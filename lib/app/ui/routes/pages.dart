import 'package:flutter/widgets.dart';
import 'package:maps/app/ui/pages/gmaps/gmaps.dart';
import 'package:maps/app/ui/pages/gmaps/splash/splash_page.dart';
import 'package:maps/app/ui/pages/request_permission/request_permission_page.dart';
import 'package:maps/app/ui/routes/routes.dart';

Map<String, Widget Function(BuildContext)> appRoutes() {
  return {
    Routes.SPLAH: (_) => const SplashPage(),
    Routes.PERMISSIONS: (_) => const RequestPermissionPage(),
    Routes.GMAPS: (_) => const GmapsPageState(),
  };
}
