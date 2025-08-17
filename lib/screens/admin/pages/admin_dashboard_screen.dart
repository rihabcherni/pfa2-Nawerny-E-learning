import 'package:flutter/material.dart';
import 'package:pfa_frontend/models/admin/adminCount.dart';
import 'package:pfa_frontend/models/admin/pierchart.dart';
import 'package:pfa_frontend/screens/admin/widgets/appBarActionItems.dart';
import 'package:pfa_frontend/screens/admin/widgets/barChart.dart';
import 'package:pfa_frontend/screens/admin/widgets/headerAdmin.dart';
import 'package:pfa_frontend/screens/admin/widgets/historyTable.dart';
import 'package:pfa_frontend/screens/admin/widgets/infoCard.dart';
import 'package:pfa_frontend/screens/admin/widgets/CategoryList.dart';
import 'package:pfa_frontend/screens/admin/widgets/sideMenuAdmin.dart';
import 'package:pfa_frontend/services/admin/admin_dash_count.dart';
import 'package:pfa_frontend/services/admin/barchart_cours_count_service.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/responsive.dart';
import 'package:pfa_frontend/utils/size_config.dart';
import 'package:pfa_frontend/utils/style.dart';

class AdminDashboardScreen extends StatefulWidget {
  @override
  _AdminDashboardScreenState createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  late Future<AdminCount> _futureAdminCount;
  final AdminDashCountService _dashCountService = AdminDashCountService();
  int lastYear = 0;
  List<int> countsByMonthLastYear = [];
  int year = 0;
  List<int> countsByMonth = [];
  late int _selectedYear;
  late List<int> _selectedYearCount;

  Future<void> fetchData() async {
    BarchartCoursCountService chartDataService = BarchartCoursCountService();
    var data = await chartDataService.fetchbarchartCoursCount();
    setState(() {
      lastYear = data.lastYear;
      countsByMonthLastYear = data.countsByMonthLastYear.cast<int>();
      year = data.year;
      countsByMonth = data.countsByMonth.cast<int>();
      _selectedYearCount = countsByMonth;
    });
  }

  @override
  void initState() {
    super.initState();
    _futureAdminCount = _dashCountService.fetchDashCount();
    fetchData();
    _selectedYear = DateTime.now().year;
  }

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        key: _drawerKey,
        drawer: SizedBox(width: 100, child: SideMenuAdmin()),
        appBar: !Responsive.isDesktop(context)
            ? AppBar(
                elevation: 0,
                backgroundColor: AppColors.white,
                leading: IconButton(
                    onPressed: () {
                      _drawerKey.currentState?.openDrawer();
                    },
                    icon: Icon(Icons.menu,
                        color: Color.fromARGB(255, 2, 44, 141))),
                actions: [
                  AppBarActionItems(),
                ],
              )
            : PreferredSize(
                preferredSize: Size.zero,
                child: SizedBox(),
              ),
        body: FutureBuilder<AdminCount>(
            future: _futureAdminCount,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final adminCount = snapshot.data!;
                return SafeArea(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (Responsive.isDesktop(context))
                        Expanded(
                          flex: 1,
                          child: SideMenuAdmin(),
                        ),
                      Expanded(
                          flex: 10,
                          child: SafeArea(
                            child: SingleChildScrollView(
                              padding: EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HeaderAdmin(
                                    title: 'Dashboard',
                                  ),
                                  SizedBox(
                                    height: SizeConfig.getInstance()
                                            .blockSizeVertical *
                                        4,
                                  ),
                                  SizedBox(
                                    width: SizeConfig.getInstance().screenWidth,
                                    child: Wrap(
                                      spacing: 20,
                                      runSpacing: 20,
                                      alignment: WrapAlignment.spaceBetween,
                                      children: [
                                        InfoCard(
                                            icon:
                                                Icon(Icons.people_alt_rounded),
                                            label: 'Students',
                                            amount: adminCount.studentCount
                                                .toString()),
                                        InfoCard(
                                            icon:
                                                Icon(Icons.people_alt_rounded),
                                            label: 'Authors',
                                            amount: adminCount.teacherCount
                                                .toString()),
                                        InfoCard(
                                            icon: Icon(Icons.book_rounded),
                                            label: 'Courses',
                                            amount: adminCount.courseCount
                                                .toString()),
                                        InfoCard(
                                            icon: Icon(Icons.category_rounded),
                                            label: 'categories of courses',
                                            amount: adminCount.categoryCount
                                                .toString()),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.getInstance()
                                            .blockSizeVertical *
                                        4,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          PrimaryText(
                                              text: 'Courses added',
                                              size: 30,
                                              fontWeight: FontWeight.w800),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.getInstance()
                                            .blockSizeVertical *
                                        3,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 500,
                                          child: Column(
                                            children: [
                                              PrimaryText(
                                                text:
                                                    'Distribution of Courses by Category: ',
                                                size: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromARGB(
                                                    255, 24, 111, 250),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Expanded(
                                                child: PieChartPage(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  HistoryTable(),
                                  if (!Responsive.isDesktop(context))
                                    CategoryList()
                                ],
                              ),
                            ),
                          )),
                      if (Responsive.isDesktop(context))
                        Expanded(
                          flex: 4,
                          child: SafeArea(
                            child: Container(
                              width: double.infinity,
                              height: SizeConfig.getInstance().screenHeight,
                              child: SingleChildScrollView(
                                padding: EdgeInsets.symmetric(
                                    vertical: 30, horizontal: 30),
                                child: Column(
                                  children: [
                                    AppBarActionItems(),
                                    CategoryList(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }
            }));
  }
}
