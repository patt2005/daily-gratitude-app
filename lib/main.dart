import 'package:daily_gratitude_journal/pages/intro_page.dart';
import 'package:daily_gratitude_journal/services/journal_service.dart';
import 'package:daily_gratitude_journal/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('journal');
  await Hive.openBox('settings');
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: kBackgroundColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: kBackgroundColor,
    ),
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => JournalService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;

    return MaterialApp(
      title: "Gratitude",
      theme: ThemeData(fontFamily: "Playwrite"),
      home: const IntroPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
