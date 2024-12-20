import 'company.dart';

class DashBoardState {
  int? totalOrders;
  double? averagePrice;
  int? returnsCount;
  double? totalRevenue;
  List<Company> topThreeCompanies;

  DashBoardState({
    this.averagePrice,
    this.returnsCount,
    this.totalOrders,
    this.totalRevenue,
    List<Company>? topThreeCompanies,
  }) : topThreeCompanies = topThreeCompanies ?? [];

  DashBoardState copyWith({
    int? totalOrders,
    double? averagePrice,
    int? returnsCount,
    double? totalRevenue,
    List<Company>? topThreeCompanies,
  }) =>
      DashBoardState(
        totalOrders: totalOrders ?? this.totalOrders,
        averagePrice: averagePrice ?? this.averagePrice,
        returnsCount: returnsCount ?? this.returnsCount,
        topThreeCompanies: topThreeCompanies ?? this.topThreeCompanies,
      );
}
