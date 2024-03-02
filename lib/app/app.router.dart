// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i6;
import 'package:flutter/material.dart';
import 'package:rfid_app/model/penyewa_model.dart' as _i7;
import 'package:rfid_app/ui/views/login_screen/login_screen_view.dart' as _i3;
import 'package:rfid_app/ui/views/penyewa_index/penyewa_index_view.dart' as _i5;
import 'package:rfid_app/ui/views/penyewa_index/penyewa_log/penyewa_log_view.dart'
    as _i11;
import 'package:rfid_app/ui/views/penyewa_index/pulsa_detail/pulsa_detail_view.dart'
    as _i13;
import 'package:rfid_app/ui/views/penyewa_index/tempat_sewaan/tempat_sewaan_view.dart'
    as _i12;
import 'package:rfid_app/ui/views/retributor_index/log_history_sewaan/log_history_sewaan_view.dart'
    as _i9;
import 'package:rfid_app/ui/views/retributor_index/penyewa_list/penyewa_list_view.dart'
    as _i10;
import 'package:rfid_app/ui/views/retributor_index/retributor_index_view.dart'
    as _i4;
import 'package:rfid_app/ui/views/retributor_index/tempat_sewa_list/tempat_sewa_list_view.dart'
    as _i8;
import 'package:rfid_app/ui/views/splash_screen/splash_screen_view.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i14;

class Routes {
  static const splashScreenView = '/';

  static const loginScreenView = '/login-screen-view';

  static const retributorIndexView = '/retributor-index-view';

  static const penyewaIndexView = '/penyewa-index-view';

  static const all = <String>{
    splashScreenView,
    loginScreenView,
    retributorIndexView,
    penyewaIndexView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashScreenView,
      page: _i2.SplashScreenView,
    ),
    _i1.RouteDef(
      Routes.loginScreenView,
      page: _i3.LoginScreenView,
    ),
    _i1.RouteDef(
      Routes.retributorIndexView,
      page: _i4.RetributorIndexView,
    ),
    _i1.RouteDef(
      Routes.penyewaIndexView,
      page: _i5.PenyewaIndexView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashScreenView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashScreenView(),
        settings: data,
      );
    },
    _i3.LoginScreenView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.LoginScreenView(),
        settings: data,
      );
    },
    _i4.RetributorIndexView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.RetributorIndexView(),
        settings: data,
      );
    },
    _i5.PenyewaIndexView: (data) {
      final args = data.getArgs<PenyewaIndexViewArguments>(nullOk: false);
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i5.PenyewaIndexView(key: args.key, penyewa: args.penyewa),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class PenyewaIndexViewArguments {
  const PenyewaIndexViewArguments({
    this.key,
    required this.penyewa,
  });

  final _i6.Key? key;

  final _i7.DetailPenyewaModel penyewa;

  @override
  String toString() {
    return '{"key": "$key", "penyewa": "$penyewa"}';
  }

  @override
  bool operator ==(covariant PenyewaIndexViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.penyewa == penyewa;
  }

  @override
  int get hashCode {
    return key.hashCode ^ penyewa.hashCode;
  }
}

class RetributorIndexViewRoutes {
  static const tempatSewaListView = 'tempat-sewa-list-view';

  static const logHistorySewaanView = 'log-history-sewaan-view';

  static const penyewaListView = 'penyewa-list-view';

  static const all = <String>{
    tempatSewaListView,
    logHistorySewaanView,
    penyewaListView,
  };
}

class RetributorIndexViewRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      RetributorIndexViewRoutes.tempatSewaListView,
      page: _i8.TempatSewaListView,
    ),
    _i1.RouteDef(
      RetributorIndexViewRoutes.logHistorySewaanView,
      page: _i9.LogHistorySewaanView,
    ),
    _i1.RouteDef(
      RetributorIndexViewRoutes.penyewaListView,
      page: _i10.PenyewaListView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i8.TempatSewaListView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.TempatSewaListView(),
        settings: data,
      );
    },
    _i9.LogHistorySewaanView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.LogHistorySewaanView(),
        settings: data,
      );
    },
    _i10.PenyewaListView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.PenyewaListView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class PenyewaIndexViewRoutes {
  static const penyewaLogView = 'penyewa-log-view';

  static const tempatSewaanView = 'tempat-sewaan-view';

  static const pulsaDetailView = 'pulsa-detail-view';

  static const all = <String>{
    penyewaLogView,
    tempatSewaanView,
    pulsaDetailView,
  };
}

class PenyewaIndexViewRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      PenyewaIndexViewRoutes.penyewaLogView,
      page: _i11.PenyewaLogView,
    ),
    _i1.RouteDef(
      PenyewaIndexViewRoutes.tempatSewaanView,
      page: _i12.TempatSewaanView,
    ),
    _i1.RouteDef(
      PenyewaIndexViewRoutes.pulsaDetailView,
      page: _i13.PulsaDetailView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i11.PenyewaLogView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.PenyewaLogView(),
        settings: data,
      );
    },
    _i12.TempatSewaanView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.TempatSewaanView(),
        settings: data,
      );
    },
    _i13.PulsaDetailView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.PulsaDetailView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i14.NavigationService {
  Future<dynamic> navigateToSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRetributorIndexView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.retributorIndexView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPenyewaIndexView({
    _i6.Key? key,
    required _i7.DetailPenyewaModel penyewa,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.penyewaIndexView,
        arguments: PenyewaIndexViewArguments(key: key, penyewa: penyewa),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedTempatSewaListViewInRetributorIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(RetributorIndexViewRoutes.tempatSewaListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedLogHistorySewaanViewInRetributorIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(RetributorIndexViewRoutes.logHistorySewaanView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedPenyewaListViewInRetributorIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(RetributorIndexViewRoutes.penyewaListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedPenyewaLogViewInPenyewaIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(PenyewaIndexViewRoutes.penyewaLogView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedTempatSewaanViewInPenyewaIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(PenyewaIndexViewRoutes.tempatSewaanView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedPulsaDetailViewInPenyewaIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(PenyewaIndexViewRoutes.pulsaDetailView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRetributorIndexView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.retributorIndexView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPenyewaIndexView({
    _i6.Key? key,
    required _i7.DetailPenyewaModel penyewa,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.penyewaIndexView,
        arguments: PenyewaIndexViewArguments(key: key, penyewa: penyewa),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedTempatSewaListViewInRetributorIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(RetributorIndexViewRoutes.tempatSewaListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedLogHistorySewaanViewInRetributorIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(RetributorIndexViewRoutes.logHistorySewaanView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedPenyewaListViewInRetributorIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(RetributorIndexViewRoutes.penyewaListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedPenyewaLogViewInPenyewaIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(PenyewaIndexViewRoutes.penyewaLogView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedTempatSewaanViewInPenyewaIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(PenyewaIndexViewRoutes.tempatSewaanView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedPulsaDetailViewInPenyewaIndexViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(PenyewaIndexViewRoutes.pulsaDetailView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
