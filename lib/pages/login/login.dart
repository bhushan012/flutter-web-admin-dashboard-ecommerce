import 'package:ecommerce_admin_tut/locator.dart';
import 'package:ecommerce_admin_tut/provider/appstate.dart';
import 'package:ecommerce_admin_tut/provider/auth.dart';
import 'package:ecommerce_admin_tut/rounting/route_names.dart';
import 'package:ecommerce_admin_tut/services/navigation_service.dart';
import 'package:ecommerce_admin_tut/widgets/custom_text.dart';
import 'package:ecommerce_admin_tut/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Appstate>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    bool wrongUser = false;
    return Container(
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.blue, Colors.indigo.shade600])),
      child: authProvider.status == Status.Authenticating
          ? Loading()
          : Scaffold(
              key: _key,
              backgroundColor: Colors.transparent,
              body: Center(
                child: Container(
                  color: Colors.red,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 3),
                              blurRadius: 24)
                        ]),
                    height: 400,
                    width: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "LOGIN",
                          size: 22,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.grey[200]),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextField(
                                controller: appState.userNameController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'UserName',
                                    icon: Icon(Icons.email_outlined)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.grey[200]),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextField(
                                controller: appState.passWordController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Password',
                                    icon: Icon(Icons.lock_open)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),

                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.indigo),
                            child: FlatButton(
                              onPressed: () {
                                print("Hello Indians");
                                print(
                                    "Your UserName Is: ${appState.userNameController.text}");
                                if (appState.userNameController.text ==
                                        "username" &&
                                    appState.passWordController.text ==
                                        "password") {
                                  locator<NavigationService>().globalNavigateTo(
                                      PageControllerRoute, context);
                                  print("UserName And password Is right");
                                } else {
                                  appState.userNameController.clear();
                                  wrongUser = true;
                                  print("userName and password is wrong");
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: "LOGIN",
                                      size: 22,
                                      color: Colors.white,
                                      weight: FontWeight.bold,
                                    ),
                                    // Visibility(child:

                                    // )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 40,
                        ),
                        Visibility(
                            child: Text("you enter wrong username or password"),
                            visible: wrongUser,
                            replacement: SizedBox()),
                        SizedBox(
                          height: 40,
                        ),

                        // Padding(
                        //   padding: const EdgeInsets.only(right:20),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       CustomText(text: "Do not have an account? ", size: 16,color: Colors.grey,),
                        //       GestureDetector(
                        //           onTap: (){
                        //             locator<NavigationService>().globalNavigateTo(RegistrationRoute, context);
                        //           },
                        //           child: CustomText(text: "Sign up here. ", size: 16,color: Colors.indigo,)),

                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
