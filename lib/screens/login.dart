import 'package:ecommerce_admin_tut/locator.dart';
import 'package:ecommerce_admin_tut/provider/appstate.dart';
import 'package:ecommerce_admin_tut/rounting/route_names.dart';
import 'package:ecommerce_admin_tut/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    // final authProvider = Provider.of<AuthProvider>(context);

    return Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.blue, Colors.indigo.shade600])),
        child: Column(
          children: [
            TextFormField(
              controller: appState.userNameController,
            ),
            TextFormField(
              controller: appState.userNameController,
              decoration: InputDecoration(
                  hintText: "UserName", border: InputBorder.none),
            ),
            TextFormField(
              controller: appState.passWordController,
              decoration: InputDecoration(
                  hintText: "PassWord", border: InputBorder.none),
            ),
            TextButton(
                child: Text("LogIn"),
                onPressed: () {
                  locator<NavigationService>()
                      .globalNavigateTo(PageControllerRoute, context);
                })
          ],
        ));
  }
}
