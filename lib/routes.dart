import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:honeywell_test/device_page.dart';
import 'package:honeywell_test/device_page2.dart';
import 'package:honeywell_test/external_page.dart';
import 'package:honeywell_test/homepage.dart';
import 'package:honeywell_test/honeywell_page.dart';

const String krHomePage = '/home';
const String krHoneywell = '/honeywell';
const String krExternal = '/external';
const String krDevice = '/device';
const String krDevice2 = '/device-2';

List<GetPage<dynamic>>? routes = [
  //* info:: auth screens
  GetPage(name: krHomePage, page: () => HomePage2(), transition: Transition.noTransition),
  GetPage(name: krHoneywell, page: () => Honeywell(), transition: Transition.noTransition),
  GetPage(name: krExternal, page: () => External(), transition: Transition.noTransition),
  GetPage(name: krDevice, page: () => Device(), transition: Transition.noTransition),
  GetPage(name: krDevice2, page: () => Device2(), transition: Transition.noTransition),
];
