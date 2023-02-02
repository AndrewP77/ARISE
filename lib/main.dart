import 'NotificationService.dart';
import 'package:flutter/services.dart';
import 'color_schemes.g.dart';
import 'package:arise/TitleScreen.dart';
import 'package:flutter/material.dart';

void main() {
  //Entire app locked in portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().setup();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  /*
  var themeData = ThemeData(
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent
    ),

    // dialogBackgroundColor: Color(0x1D312A),
    // brightness: Brightness.dark,
    dialogTheme: DialogTheme(
        backgroundColor: Color(0x1D312A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
    ),

    colorScheme: ColorScheme.fromSwatch().copyWith(
        brightness: Brightness.dark,
        primary: Color(0xFF00E560),
        background: Color(0xFF1A1C19),
        surface: Color(0xFF00E560), // is a blend, might need work...
        onPrimary: Color(0xFF003912),
        primaryContainer: Color(0xFF00531E),
        surfaceVariant: Color(0xFF404944),
        onSecondaryContainer: Color(0xFFC9EADA),
        secondaryContainer: Color(0xFF304C41),
        onSurface: Color(0xFFE1E3E0),
        outline: Color(0xFF89938D),
        onPrimaryContainer: Color(0xFF69FF87),
        onErrorContainer: Color(0xFF410E0B),
        onError: Color(0xFFFFFFFF)
    ),



    fontFamily: 'Inter',
    // TODO: put heights if it works.
    textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 32.0),
        headlineMedium: TextStyle(fontSize: 28.0),
        headlineSmall: TextStyle(fontSize: 24.0),   // headline small
        bodyLarge: TextStyle(fontSize: 16.0),
        bodyMedium: TextStyle(fontSize: 14.0),
        bodySmall: TextStyle(fontSize: 12.0),
        labelLarge: TextStyle(fontSize: 14.0),
        labelMedium: TextStyle(fontSize: 12.0),
        labelSmall: TextStyle(fontSize: 11.0),
        displayLarge: TextStyle(fontSize: 57.0),
        displayMedium: TextStyle(fontSize: 45.0),
        displaySmall: TextStyle(fontSize: 36.0),
        // display extra large cant be defined rn, probably needs to be custom
        titleLarge: TextStyle(fontSize: 22.0),//, height: 28.0),
        titleMedium: TextStyle(fontSize: 16.0),
        titleSmall: TextStyle(fontSize: 14.0)

    ),
  );

   */

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ARISE!',
      theme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      //theme: themeData,//(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

      //),
      home: TitleScreen(),
    );
  }
}