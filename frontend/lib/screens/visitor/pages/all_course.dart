import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pfa_frontend/models/cours.dart';
import 'package:pfa_frontend/services/visitor/cours_visitor_service.dart';
import 'package:pfa_frontend/utils/auth_provider.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:pfa_frontend/utils/setting_provider.dart';
import '../../../widgets/side_menu.dart';

class AllCourseScreen extends StatefulWidget {
  const AllCourseScreen({Key? key}) : super(key: key);
  @override
  _AllCourseScreenState createState() => _AllCourseScreenState();
}

class _AllCourseScreenState extends State<AllCourseScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isMenuOpen = false;
  List<Course> courses = [];
  final List<String> catNames = [
    "Category",
    'Your Courses',
    'Top Courses',
    'New Courses',
  ];
  List<IconData> catIcons = [
    Icons.category,
    Icons.assignment,
    Icons.emoji_events,
    Icons.fiber_new,
  ];

  @override
  void initState() {
    super.initState();
    fetchCourses();
  }

  void fetchCourses() async {
    try {
      final coursesVisitorService = CoursesVisitorService();
      final List<Course> fetchedCourses =
          await coursesVisitorService.fetchList();
      setState(() {
        courses = fetchedCourses;
      });
    } catch (e) {
      print('Error fetching courses: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final authToken = context.watch<AuthProvider>().authToken;
    final refreshAuthToken = context.watch<AuthProvider>().refreshAuthToken;
    final isLoggedIn = context.watch<AuthProvider>().isLoggedIn;
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideMenu(),
      body: ListView(
        children: [
          Semantics(
            label: 'Courses Page Header',
            child: Container(
              padding: const EdgeInsets.only(
                  top: 15, left: 15, right: 15, bottom: 10),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Semantics(
                        label: 'Logo of Nawarny application',
                        child: Container(
                          width: 70,
                          height: 70,
                          padding: const EdgeInsets.all(7),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                      ),
                      Text(
                        "Nawarny",
                        style: TextStyle(
                          fontSize: context
                              .watch<SettingsProvider>()
                              .settings
                              .titleSize,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          wordSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/settings-size');
                        },
                        icon: const Icon(
                          Icons.settings,
                          semanticLabel: 'Open settings page with this button',
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                      isLoggedIn
                          ? IconButton(
                              onPressed: () {
                                _scaffoldKey.currentState!.openDrawer();
                              },
                              icon: AnimatedCrossFade(
                                firstChild: const Icon(Icons.menu,
                                    size: 28, color: Colors.white),
                                secondChild: const Icon(Icons.close,
                                    size: 28,
                                    semanticLabel: 'Close Button',
                                    color: Colors.white),
                                crossFadeState: _isMenuOpen
                                    ? CrossFadeState.showSecond
                                    : CrossFadeState.showFirst,
                                duration: const Duration(milliseconds: 300),
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/login');
                              },
                              icon: Semantics(
                                label: 'Login',
                                child: const Icon(
                                  semanticLabel: 'Login Button',
                                  Icons.login,
                                  size: 28,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Semantics(
                    label: 'Search Bar',
                    child: Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search here ...",
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                          ),
                          prefixIcon: const Icon(
                            semanticLabel: ' Search icon',
                            Icons.search,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GridView.builder(
                  itemCount: catNames.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Navigator.of(context).pushNamed('/course/category');
                            break;
                          case 1:
                            Navigator.of(context)
                                .pushNamed('/course/your_course');
                            break;
                          case 2:
                            Navigator.of(context)
                                .pushNamed('/course/top_courses');
                            break;
                          case 3:
                            Navigator.of(context)
                                .pushNamed('/course/new_courses');
                            break;
                        }
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: kColors[index],
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                semanticLabel: catNames[index] + ' button',
                                catIcons[index],
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          Text(
                            catNames[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: context
                                  .watch<SettingsProvider>()
                                  .settings
                                  .smallTextSize,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                InteractiveViewer(
                  boundaryMargin: EdgeInsets.all(20.0),
                  minScale: 0.1,
                  maxScale: 4.0,
                  child: GridView.builder(
                    itemCount: courses.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          MediaQuery.of(context).size.width < kTabletBreakpoint
                              ? 2
                              : MediaQuery.of(context).size.width <
                                      kDesktopBreakpoint
                                  ? 3
                                  : 4,
                      childAspectRatio: 2 / 2.7,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/courses',
                              arguments: courses[index].id);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFFF5F3FF),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Semantics(
                                label: 'Tap to view course details',
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/courses',
                                        arguments: courses[index].id);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            courses[index].coursPhoto),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                courses[index].titre,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: context
                                      .watch<SettingsProvider>()
                                      .settings
                                      .bigTextSize,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "(${courses[index].niveau})",
                                style: TextStyle(
                                  fontSize: context
                                      .watch<SettingsProvider>()
                                      .settings
                                      .smallTextSize,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                              Text(
                                'Auteur: ${courses[index].auteur}',
                                style: TextStyle(
                                  fontSize: context
                                      .watch<SettingsProvider>()
                                      .settings
                                      .textSize,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (courses[index].totalRatings == 0 &&
                                      courses[index].totalReviews == 0)
                                    Text(
                                      '0',
                                      style: TextStyle(
                                        fontSize: context
                                            .watch<SettingsProvider>()
                                            .settings
                                            .textSize,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber,
                                      ),
                                    )
                                  else
                                    Text(
                                      '${(courses[index].totalRatings / courses[index].totalReviews).toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontSize: context
                                            .watch<SettingsProvider>()
                                            .settings
                                            .textSize,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber,
                                      ),
                                    ),
                                  RatingBar.builder(
                                    initialRating:
                                        courses[index].totalRatings == 0 &&
                                                courses[index].totalReviews == 0
                                            ? 0.0
                                            : double.parse((courses[index]
                                                        .totalRatings /
                                                    courses[index].totalReviews)
                                                .toStringAsFixed(2)),
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 13,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 0.2),
                                    itemBuilder: (context, _) => Icon(
                                      semanticLabel: 'Ratting star',
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  Text(
                                    '(${courses[index].totalRatings == 0 && courses[index].totalReviews == 0 ? 0 : courses[index].totalReviews})',
                                    style: TextStyle(
                                      fontSize: context
                                          .watch<SettingsProvider>()
                                          .settings
                                          .textSize,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "${courses[index].langue}",
                                style: TextStyle(
                                  fontSize: context
                                      .watch<SettingsProvider>()
                                      .settings
                                      .smallTextSize,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
