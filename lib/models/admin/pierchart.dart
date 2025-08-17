import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pfa_frontend/models/category.dart';
import 'package:pfa_frontend/services/admin/category_service.dart';
import 'package:pfa_frontend/utils/setting_provider.dart';
import 'package:provider/provider.dart';

class PieChartPage extends StatefulWidget {
  @override
  _PieChartPageState createState() => _PieChartPageState();
}

class _PieChartPageState extends State<PieChartPage> {
  List<Category> _categories = [];
  List<Color> _colors = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.teal,
    Colors.indigo,
    Colors.deepOrange,
    Colors.cyan,
  ];
  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    try {
      final CategoryService categoryService = CategoryService();
      List<Category> categories = await categoryService.fetchCategories();

      categories =
          categories.where((category) => category.courseNumber > 0).toList();

      setState(() {
        _categories = categories;
      });
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _categories.isEmpty
          ? CircularProgressIndicator()
          : PieChart(
              PieChartData(
                sections: List.generate(
                  _categories.length,
                  (index) => PieChartSectionData(
                    color: _colors[index % _colors.length],
                    value: _categories[index].courseNumber.toDouble(),
                    title: _categories[index].name,
                    radius: 100,
                    titleStyle: TextStyle(
                      fontSize: context
                          .watch<SettingsProvider>()
                          .settings
                          .smallTextSize,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
                centerSpaceRadius: 38.0,
              ),
            ),
    );
  }
}
