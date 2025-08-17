import 'package:flutter/material.dart';
import 'package:pfa_frontend/models/category.dart';
import 'package:pfa_frontend/screens/visitor/pages/course_par_category.dart';
import 'package:pfa_frontend/services/student/category_service.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/setting_provider.dart';
import 'package:provider/provider.dart';

class CategoryCourseScreen extends StatefulWidget {
  const CategoryCourseScreen({Key? key}) : super(key: key);

  @override
  _CategoryCourseScreenState createState() => _CategoryCourseScreenState();
}

class _CategoryCourseScreenState extends State<CategoryCourseScreen> {
  final CategoryService _categoryService = CategoryService();

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    try {
      final categories = await _categoryService.getCategories();
      setState(() {});
    } catch (e) {
      print('Error loading categories: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kPrimaryColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<List<Category>>(
        future: _categoryService.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final categories = snapshot.data!;
            return Semantics(
              label: 'Categories List',
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Semantics(
                    label: category.name,
                    value: category.descriptionImage,
                    child: ListTile(
                      title: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          category.name,
                          style: TextStyle(
                            fontSize: context
                                .watch<SettingsProvider>()
                                .settings
                                .bigTextSize,
                            fontWeight: FontWeight.w800,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          category.image,
                          width: 200,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CoursesCategoryScreen(categoryId: category.id),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
