import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/controllers/invoice_controller.dart';
import 'app/controllers/location_controller.dart';
import 'app/views/invoice_page.dart';
import 'app/views/location_page.dart';
import 'app/widgets/custom_design.dart';

Future main() async {
  // app firebase initialize
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  return runApp(
    // app controllers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocationController()),
        ChangeNotifierProvider(create: (_) => InvoiceController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Asset Control App",
        theme: CustomDesign.theme,
        initialRoute: "/location_page",
        routes: {
          // routes transition from widget CustomRoute()
          "/location_page": (context) => const LocationPage(),
          "/invoice_page": (context) => const InvoicePage(),
          // "/assets_page": (context) => const AssetsPage(),
          // "/replacement_page": (context) => const ReplacementPage(),
          // "/user_page": (context) => const UserPage(),
        },
      ),
    ),
  );
}
