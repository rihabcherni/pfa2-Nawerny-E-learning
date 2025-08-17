import 'package:flutter/material.dart';
import 'package:pfa_frontend/models/admin/admin_cours_last5.dart';
import 'package:pfa_frontend/services/admin/last5_cours_service.dart';
import 'package:pfa_frontend/utils/responsive.dart';
import 'package:pfa_frontend/utils/size_config.dart';
import 'package:pfa_frontend/widgets/custom_table_title.dart';

BoxDecoration _buildBoxDecoration(bool isGrey) {
  return BoxDecoration(
    color: isGrey ? Colors.grey[200] : Colors.transparent,
  );
}

class HistoryTable extends StatefulWidget {
  @override
  _HistoryTableState createState() => _HistoryTableState();
}

class _HistoryTableState extends State<HistoryTable> {
  final Last5CoursService _apiService = Last5CoursService();

  late Future<List<AdminCourseLast5>> _lastCourseFuture;

  @override
  void initState() {
    super.initState();
    _lastCourseFuture = _apiService.fetchLast5Courses();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AdminCourseLast5>>(
        future: _lastCourseFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<AdminCourseLast5> courses = snapshot.data!;
            return SingleChildScrollView(
                scrollDirection: Responsive.isDesktop(context)
                    ? Axis.vertical
                    : Axis.horizontal,
                child: SizedBox(
                    width: Responsive.isDesktop(context)
                        ? double.infinity
                        : SizeConfig.getInstance().screenWidth,
                    child: Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: {
                        0: FlexColumnWidth(),
                        1: FlexColumnWidth(),
                        2: FlexColumnWidth(0.6),
                        3: FlexColumnWidth(0.6),
                        4: FlexColumnWidth(1.2),
                        5: FlexColumnWidth(0.8),
                      },
                      children: [
                        TableRow(
                          decoration: _buildBoxDecoration(false),
                          children: [
                            CustomTitleTable(texte: 'Title'),
                            CustomTitleTable(texte: 'Category'),
                            CustomTitleTable(texte: 'Language'),
                            CustomTitleTable(texte: 'Level'),
                            CustomTitleTable(texte: 'Author'),
                            CustomTitleTable(texte: 'Created at'),
                          ],
                        ),
                        for (int index = 0; index < courses.length; index++)
                          TableRow(
                            decoration: _buildBoxDecoration(index % 2 == 0),
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(courses[index].title),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(courses[index].category),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(courses[index].language),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(courses[index].level),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      margin: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 176, 176, 176),
                                          width: 1,
                                        ),
                                      ),
                                      child: ClipOval(
                                        child: Image.network(
                                          courses[index].authorPhoto,
                                          fit: BoxFit.cover,
                                          width: 50,
                                          height: 50,
                                        ),
                                      ),
                                    ),
                                    Text(courses[index].author),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(courses[index].createdAt),
                              ),
                            ],
                          )
                      ],
                    )));
          }
        });
  }
}
