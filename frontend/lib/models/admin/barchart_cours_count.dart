class BarchartCoursCount {
  final int lastYear;
  final List<int> countsByMonthLastYear;
  final int year;
  final List<int> countsByMonth;

  BarchartCoursCount({
    required this.lastYear,
    required this.countsByMonthLastYear,
    required this.year,
    required this.countsByMonth,
  });

  factory BarchartCoursCount.fromJson(Map<String, dynamic> json) {
    return BarchartCoursCount(
      lastYear: json['last_year'],
      countsByMonthLastYear: List<int>.from(json['counts_by_month_last_year']),
      year: json['year'],
      countsByMonth: List<int>.from(json['counts_by_month']),
    );
  }
}


