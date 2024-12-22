import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orders_explorer/base/domain/entities/base_state.dart';
import 'package:orders_explorer/base/helpers/context_extension.dart';
import 'package:orders_explorer/base/helpers/responsive_content_wrapper.dart';
import 'package:orders_explorer/base/helpers/responsive_helper.dart';
import 'package:orders_explorer/base/helpers/widget_modifier.dart';
import 'package:orders_explorer/base/presentation/widgets/screen_title.dart';
import 'package:orders_explorer/orders_management/domain/entities/dashboard_state.dart';
import 'package:orders_explorer/orders_management/presentation/view_models/dashboard_viewmodel.dart';
import 'package:orders_explorer/orders_management/presentation/widgets/dashboard/circular_progress_card.dart';
import 'package:orders_explorer/orders_management/presentation/widgets/dashboard/linear_progress_card.dart';
import 'package:orders_explorer/orders_management/presentation/widgets/dashboard/metrics_section.dart';
import 'package:orders_explorer/orders_management/presentation/widgets/dashboard/top_companies_section.dart';
import 'package:orders_explorer/orders_management/utils/di/orders_injection.dart'
    as di;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static const String routeName = "/dashboard";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with AutomaticKeepAliveClientMixin {
  final _viewModelProvider =
      StateNotifierProvider<DashboardViewModel, BaseState<DashBoardState>>(
    (ref) => DashboardViewModel(ref.watch(di.getOrdersProvider)),
  );

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() {
    Future.delayed(Duration.zero, () {
      context.read(_viewModelProvider.notifier).getOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: Consumer(
          builder: (_, ref, __) {
            final isLoading = ref
                .watch(_viewModelProvider.select((value) => value.isLoading));
            return ResponsiveContentWrapper(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ScreenTitle(
                            title: 'Dashboard Overview',
                          ),
                          const SizedBox(height: 24),
                          Consumer(builder: (_, ref, __) {
                            final ordersState = ref.watch(
                              _viewModelProvider.select((value) => value.data),
                            );
                            return MetricsSection(
                              totalOrders: ordersState.totalOrders,
                              averagePrice: ordersState.averagePrice,
                              returnsCount: ordersState.returnsCount,
                              totalRevenue: ordersState.totalRevenue,
                            );
                          }),
                          const SizedBox(height: 24),
                          Consumer(builder: (_, ref, __) {
                            final returnsCount = ref.read(
                              _viewModelProvider
                                  .select((value) => value.data.returnsCount),
                            );
                            final totalOrders = ref.read(
                              _viewModelProvider
                                  .select((value) => value.data.totalOrders),
                            );
                            return context.isMinimized
                                ? CircularProgressCard(
                                    returnsCount: returnsCount,
                                    totalOrders: totalOrders)
                                : LinearProgressCard(
                                    returnsCount: returnsCount,
                                    totalOrders: totalOrders,
                                  );
                          }),
                          const SizedBox(height: 24),
                          Consumer(
                            builder: (_, ref, __) {
                              final topCompanies = ref.read(
                                _viewModelProvider.select(
                                    (value) => value.data.topThreeCompanies),
                              );
                              return (topCompanies.isNotEmpty)
                                  ? TopCompaniesSection(
                                      companies: topCompanies,
                                    )
                                  : const SizedBox.shrink();
                            },
                          ),
                        ],
                      ).paddingAll(12),
                    ),
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
