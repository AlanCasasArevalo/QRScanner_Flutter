import 'package:flutter/material.dart';
import 'package:qrscanner/pages/MapDetailPage.dart';
import 'package:qrscanner/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:qrscanner/providers/scan_list_provider.dart';
import 'package:qrscanner/providers/ui_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UIProvider(),),
        ChangeNotifierProvider(create: (_) => new ScanListProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QRScanner',
        initialRoute: 'home_page',
        routes: {
          'home_page' : (BuildContext context) => HomePage(),
          'map_page_detail' : (BuildContext context) => MapDetailPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurple,
          )
        ),
      ),
    );
  }
}
