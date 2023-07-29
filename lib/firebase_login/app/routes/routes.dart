import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_example/firebase_login/app/app.dart';
import 'package:flutter_bloc_example/firebase_login/home/view/home_page.dart';
import 'package:flutter_bloc_example/firebase_login/login/view/login_page.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
