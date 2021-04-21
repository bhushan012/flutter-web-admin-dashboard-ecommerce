import 'package:ecommerce_admin_tut/pages/login/login.dart';
import 'package:ecommerce_admin_tut/provider/app_provider.dart';
import 'package:ecommerce_admin_tut/provider/appstate.dart';
import 'package:ecommerce_admin_tut/provider/auth.dart';
import 'package:ecommerce_admin_tut/provider/tables.dart';
import 'package:ecommerce_admin_tut/rounting/route_names.dart';
import 'package:ecommerce_admin_tut/rounting/router.dart';
import 'package:ecommerce_admin_tut/widgets/layout/layout.dart';
import 'package:ecommerce_admin_tut/widgets/loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'helpers/costants.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: AppProvider.init()),
    ChangeNotifierProvider.value(value: Appstate()),
    ChangeNotifierProvider.value(value: AuthProvider.initialize()),
    ChangeNotifierProvider.value(value: TablesProvider.init()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: AppPagesController(),
      routes: <String, WidgetBuilder>{
        // '/dealersProductPage': (context) => DealersProductPage(),
        // '/manageOrders': (BuildContext context) => ManageOrders(),
        // '/manageCustomersOrders': (BuildContext context) =>
        //     ManageCustomersOrders(),
        // '/customerOrderStatus': (BuildContext context) =>
        //     CustomerOrderStatus(),
        // '/locationAdd': (BuildContext context) => LocationAdd(),
        // '/getNewArrivalProduct': (BuildContext context) => GetNewArrivalProduct(),
        // '/navigationPage': (BuildContext context) => NavigationPage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      onGenerateRoute: generateRoute,
      // initialRoute: HomeRoute,
      // initialRoute: Login,
      initialRoute: PageControllerRoute,
    );
  }
}

class AppPagesController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return FutureBuilder(
      // Initialize FlutterFire:
      future: initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Something went wrong")],
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          print(authProvider.status.toString());
          switch (authProvider.status) {
            case Status.Uninitialized:
              return Loading();
            case Status.Unauthenticated:
            case Status.Authenticating:
              return LayoutTemplate();
            case Status.Authenticated:
              return LayoutTemplate();
            default:
              return LoginPage();
          }
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
        );
      },
    );
  }
}
