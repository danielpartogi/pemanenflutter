// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../main.dart' as _i1;
import '../../presentation/harvester/harvester_detail.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MyHomeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MyHomePage());
    },
    HarvesterDetail.name: (routeData) {
      final args = routeData.argsAs<HarvesterDetailArgs>(
          orElse: () => const HarvesterDetailArgs());
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.HarvesterDetail(key: args.key));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(MyHomeRoute.name, path: '/'),
        _i3.RouteConfig(HarvesterDetail.name, path: '/harvester-detail')
      ];
}

/// generated route for
/// [_i1.MyHomePage]
class MyHomeRoute extends _i3.PageRouteInfo<void> {
  const MyHomeRoute() : super(MyHomeRoute.name, path: '/');

  static const String name = 'MyHomeRoute';
}

/// generated route for
/// [_i2.HarvesterDetail]
class HarvesterDetail extends _i3.PageRouteInfo<HarvesterDetailArgs> {
  HarvesterDetail({_i4.Key? key})
      : super(HarvesterDetail.name,
            path: '/harvester-detail', args: HarvesterDetailArgs(key: key));

  static const String name = 'HarvesterDetail';
}

class HarvesterDetailArgs {
  const HarvesterDetailArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'HarvesterDetailArgs{key: $key}';
  }
}
