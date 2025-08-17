import 'package:flutter/material.dart';
import 'package:pfa_frontend/models/admin/teacherList.dart';
import 'package:pfa_frontend/services/admin/teacher-list_service.dart';
import 'package:pfa_frontend/utils/responsive.dart';
import 'package:pfa_frontend/utils/size_config.dart';
import 'package:pfa_frontend/widgets/custom_table_title.dart';

BoxDecoration _buildBoxDecoration(bool isGrey) {
  return BoxDecoration(
    color: isGrey ? Colors.grey[200] : Colors.transparent,
  );
}

class TeachersTable extends StatefulWidget {
  @override
  _TeachersTableState createState() => _TeachersTableState();
}

class _TeachersTableState extends State<TeachersTable> {
  final TeacherListService _apiService = TeacherListService();

  late Future<List<Teacher>> _listTeacherFuture;

  @override
  void initState() {
    super.initState();
    _listTeacherFuture = _apiService.fetchList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Teacher>>(
        future: _listTeacherFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<Teacher> listTeacher = snapshot.data!;
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
                    2: FlexColumnWidth(),
                    3: FlexColumnWidth(),
                    4: FlexColumnWidth(),
                    5: FlexColumnWidth(),
                    6: FlexColumnWidth(0.4),
                  },
                  children: [
                    TableRow(
                      decoration: _buildBoxDecoration(false),
                      children: [
                        CustomTitleTable(texte: 'Photo'),
                        CustomTitleTable(texte: 'firstName'),
                        CustomTitleTable(texte: 'LastName'),
                        CustomTitleTable(texte: 'Email'),
                        CustomTitleTable(texte: 'Address'),
                        CustomTitleTable(texte: 'Phone Number'),
                        CustomTitleTable(texte: 'Action'),
                      ],
                    ),
                    for (int index = 0; index < listTeacher.length; index++)
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
                                  listTeacher[index].photo.toString(),
                                  fit: BoxFit.cover,
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(listTeacher[index].firstName),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(listTeacher[index].lastName),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(listTeacher[index].email),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(listTeacher[index].address.toString()),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child:
                                Text(listTeacher[index].dateOfBirth.toString()),
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
                                int userId = listTeacher[index].id;

                                _apiService
                                    .deleteTeacher(userId)
                                    .then((success) {
                                  if (success) {
                                    setState(() {
                                      listTeacher.removeAt(index);
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
