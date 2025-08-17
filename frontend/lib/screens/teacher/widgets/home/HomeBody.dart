import 'package:flutter/material.dart';
import 'package:pfa_frontend/models/teacher/cours.dart';
import 'package:pfa_frontend/screens/teacher/pages/AddcoursScreen.dart';
import 'package:pfa_frontend/screens/teacher/pages/Details_screen.dart';
import 'package:pfa_frontend/screens/teacher/widgets/home/cours_card.dart';
import 'package:pfa_frontend/services/teacher/coursAff_service.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/constants.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<Cours> coursList = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromBackend();
  }

  Future<void> fetchDataFromBackend() async {
    final data = await fetchCours();
    setState(() {
      coursList = data.cast<Cours>();
    });
    print(coursList);
    try {
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search for courses...',
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              onChanged: (value) {
              },
            ),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          Expanded(
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 70.0),
                  decoration: const BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: coursList.length,
                  itemBuilder: (context, index) =>CoursCard (
                    indexItem: index,
                    cours: coursList[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            cours: coursList[index],
                          ),
                        ),
                      );
                    },
                    onDelete: () {
                      deleteCours(index);
                      setState(() {});
                    },
                  ),
                ),
                Positioned(
                  bottom: 16.0,
                  right: 16.0,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddCoursScreen(),
                        ),
                      );
                    },
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void deleteCours(int index) {
    if (index >= 0 && index < coursList.length) {
      coursList.removeAt(index);
    }
  }
}
