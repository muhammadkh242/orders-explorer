import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orders_explorer/base/domain/entities/base_state.dart';
import 'package:orders_explorer/base/helpers/context_extension.dart';
import 'package:orders_explorer/base/helpers/responsive_content_wrapper.dart';
import 'package:orders_explorer/base/helpers/widget_modifier.dart';
import 'package:orders_explorer/base/presentation/widgets/screen_title.dart';
import 'package:orders_explorer/orders_management/domain/entities/timeline_state.dart';
import 'package:orders_explorer/orders_management/presentation/view_models/timeline_viewmodel.dart';
import 'package:orders_explorer/orders_management/presentation/widgets/timeline/last_seven_days_orders_card.dart';
import 'package:orders_explorer/orders_management/presentation/widgets/timeline/timeline_chart.dart';
import 'package:orders_explorer/orders_management/presentation/widgets/timeline/timeline_date_filter.dart';
import 'package:orders_explorer/orders_management/presentation/widgets/timeline/timeline_header.dart';
import 'package:orders_explorer/orders_management/utils/di/orders_injection.dart'
    as di;

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({Key? key}) : super(key: key);
  static const String routeName = "/timeline";

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen>
    with AutomaticKeepAliveClientMixin {
  final _viewModelProvider =
      StateNotifierProvider<TimelineViewModel, BaseState<TimelineState>>(
    (ref) => TimelineViewModel(ref.watch(di.getOrdersProvider)),
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
                          const ScreenTitle(title: 'Orders Timeline'),
                          const SizedBox(height: 24),
                          const TimelineHeader(),
                          const SizedBox(height: 24),
                          Consumer(builder: (_, ref, __) {
                            final startDate = ref.watch(
                              _viewModelProvider.select(
                                (value) => value.data.startDate,
                              ),
                            );
                            final endDate = ref.watch(
                              _viewModelProvider.select(
                                (value) => value.data.endDate,
                              ),
                            );

                            return TimelineDateFilter(
                              currentDate: DateTime(2021, 10, 31),
                              startDate: startDate,
                              endDate: endDate,
                              onDateFilterChanged: (startDate, endDate) {
                                context
                                    .read(_viewModelProvider.notifier)
                                    .changeDateRange(startDate, endDate);
                              },
                            );
                          }),
                          const SizedBox(height: 24),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: Consumer(
                              builder: (_, ref, __) {
                                final filteredOrders = ref.watch(
                                  _viewModelProvider.select(
                                    (value) => value.data.filteredDailyOrders,
                                  ),
                                );
                                final startDate = ref.watch(
                                  _viewModelProvider.select(
                                    (value) => value.data.startDate,
                                  ),
                                );
                                return TimeLineChart(
                                  groupedOrders: filteredOrders,
                                  startDate: startDate,
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 24),
                          Consumer(
                            builder: (_, ref, __) {
                              final filteredOrders = ref.watch(
                                _viewModelProvider.select(
                                  (value) => value.data.filteredDailyOrders,
                                ),
                              );
                              return LastSevenDaysOrdersCard(
                                  groupedOrders: filteredOrders);
                            },
                          ),
                        ],
                      ).paddingAll(24),
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
