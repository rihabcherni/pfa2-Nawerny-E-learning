import 'package:flutter/material.dart';
import 'package:pfa_frontend/models/cours.dart';
import 'package:pfa_frontend/services/admin/courses_list_service.dart';
import 'package:pfa_frontend/utils/responsive.dart';
import 'package:pfa_frontend/utils/size_config.dart';
import 'package:pfa_frontend/widgets/custom_table_title.dart';

BoxDecoration _buildBoxDecoration(bool isGrey) {
  return BoxDecoration(
    color: isGrey ? Colors.grey[200] : Colors.transparent,
  );
}

class CoursesTable extends StatefulWidget {
  @override
  _CoursesTableState createState() => _CoursesTableState();
}

class _CoursesTableState extends State<CoursesTable> {
  final CoursesAdminListService _apiService = CoursesAdminListService();

  late Future<List<Course>> _listAdminCourseFuture;

  @override
  void initState() {
    super.initState();
    _listAdminCourseFuture = _apiService.fetchList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Course>>(
        future: _listAdminCourseFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<Course> listAdminCourse = snapshot.data!;
            return SingleChildScrollView(
              scrollDirection: Responsive.isDesktop(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              child: SizedBox(
                width: Responsive.isDesktop(context)
                    ? double.infinity
                    : SizeConfig.getInstance().screenWidth,
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  columnWidths: {
                    0: FlexColumnWidth(0.3),
                    1: FlexColumnWidth(),
                    2: FlexColumnWidth(0.9),
                    3: FlexColumnWidth(0.6),
                    4: FlexColumnWidth(0.6),
                    5: FlexColumnWidth(),
                    5: FlexColumnWidth(),
                    6: FlexColumnWidth(0.4),
                  },
                  children: [
                    TableRow(
                      decoration: _buildBoxDecoration(false),
                      children: [
                        CustomTitleTable(texte: 'Image course'),
                        CustomTitleTable(texte: 'Title'),
                        CustomTitleTable(texte: 'Category'),
                        CustomTitleTable(texte: 'Language'),
                        CustomTitleTable(texte: 'Level'),
                        CustomTitleTable(texte: 'Author'),
                        CustomTitleTable(texte: 'created at'),
                        CustomTitleTable(texte: 'Action'),
                      ],
                    ),
                    for (int index = 0; index < listAdminCourse.length; index++)
                      TableRow(
                        decoration: _buildBoxDecoration(index % 2 == 0),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 176, 176, 176),
                                  width: 1,
                                ),
                              ),
                              child: ClipOval(
                                child: Image.network(
                                  listAdminCourse[index].coursPhoto,
                                  fit: BoxFit.cover,
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(listAdminCourse[index].titre),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(listAdminCourse[index].category),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(listAdminCourse[index].langue),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(listAdminCourse[index].niveau),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                                      listAdminCourse[index].auteurPhoto,
                                      fit: BoxFit.cover,
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                Text(listAdminCourse[index].auteur),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                                listAdminCourse[index].createdAt.toString()),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 30,
                              ),
                              onPressed: () {
                                int userId = listAdminCourse[index].id;

                                _apiService
                                    .deleteAdminCourse(userId)
                                    .then((success) {
                                  if (success) {
                                    setState(() {
                                      listAdminCourse.removeAt(index);
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content:
                                            Text('User deleted successfully'),
                                        margin: EdgeInsets.all(16),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Failed to delete user'),
                                        margin: EdgeInsets.all(16),
                                      ),
                                    );
                                  }
                                });
                              },
                            ),
                          )
                        ],
                      )
                  ],
                ),
              ),
            );
          }
        });
  }
}
