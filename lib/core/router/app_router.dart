import 'package:auto_route/auto_route.dart';
import 'package:pemanen_flutter/main.dart';
import 'package:pemanen_flutter/presentation/harvester/harvester_detail.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MyHomePage, initial: true),
    AutoRoute(page: HarvesterDetail),
  ],
)
class $AppRouter {}