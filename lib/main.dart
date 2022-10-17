import 'package:flutter/material.dart';
import 'package:productos_app/providers/settings_provider.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:provider/provider.dart';

void main() {
  //antes de ejecutar el init de las preferencias debemos asegurarnos que se han inicializado los widgets
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SettingProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Products App',
         initialRoute: 'login',
        //initialRoute: 'home',
        routes: {
          'login': (_) => LoginScreen(),
          'home': (_) => HomeScreen(),
          'settings': (_) => SettingsScreen()
        },
        theme: ThemeData.light()
            .copyWith(scaffoldBackgroundColor: Colors.grey[300]));
  }
}
