import 'package:flutter/material.dart';
import 'package:pfa_frontend/models/category.dart';
import 'package:pfa_frontend/screens/admin/widgets/CategoryListTitle.dart';
import 'package:pfa_frontend/services/admin/category_service.dart';
import 'package:pfa_frontend/utils/size_config.dart';
import 'package:pfa_frontend/utils/style.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  late Future<List<Category>> _categoriesFuture;

  @override
  void initState() {
    super.initState();
    _categoriesFuture = CategoryService().fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
      future: _categoriesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Category> categories = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.getInstance().blockSizeVertical * 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryText(
                      text: 'Categories',
                      size: 18,
                      fontWeight: FontWeight.w800),
                ],
              ),
              SizedBox(
                height: SizeConfig.getInstance().blockSizeVertical * 2,
              ),
              Column(
                children: categories.map((category) {
                  return CategoryListTitle(
                    icon: IconData(int.parse(category.icon),
                        fontFamily: 'MaterialIcons'),
                    label: category.name,
                    courseNumber: category.courseNumber,
                  );
                }).toList(),
              ),
            ],
          );
        }
      },
    );
  }
}
