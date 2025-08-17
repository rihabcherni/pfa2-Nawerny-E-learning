import 'package:flutter/material.dart';
import 'package:pfa_frontend/routes/liste_routes.dart';
import 'package:pfa_frontend/utils/auth_provider.dart';
import 'package:pfa_frontend/utils/color.dart';
import 'package:pfa_frontend/utils/setting_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
        ChangeNotifierProvider.value(value: AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settingsProvider, _) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Nawarny',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
              useMaterial3: true,
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: AppColors.primaryBg,
              textTheme: TextTheme(
                displayLarge:
                    TextStyle(fontSize: settingsProvider.settings.titleSize),
                displayMedium:
                    TextStyle(fontSize: settingsProvider.settings.subTitleSize),
                displaySmall: TextStyle(
                    fontSize: settingsProvider.settings.smallTitleSize),
                bodyLarge:
                    TextStyle(fontSize: settingsProvider.settings.bigTextSize),
                bodyMedium:
                    TextStyle(fontSize: settingsProvider.settings.textSize),
                titleMedium: TextStyle(
                    fontSize: settingsProvider.settings.smallTextSize),
              ),
            ),
            initialRoute: '/',
            onGenerateRoute: ListeRouter.generateRoute,
          ),
        );
      },
    );
  }
}
