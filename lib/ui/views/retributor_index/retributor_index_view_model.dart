import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.dialogs.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';
import '../../../services/my_socket_io_client.dart';
import '../../../services/shared_prefs.dart';

class RetributorIndexViewModel extends IndexTrackingViewModel {
  final log = getLogger('RetributorIndexViewModel');
  final _navigationService = locator<NavigationService>();
  final socketIoClient = locator<MySocketIoClient>();
  final dialogService = locator<DialogService>();
  final snackbarService = locator<SnackbarService>();
  final mySharedPrefs = locator<MySharedPrefs>();

  final _bottomNavBarList = [
    {
      'name': 'Tempat Sewa',
      'icon': Icons.home_outlined,
      'header': 'List Tempat Sewa',
    },
    {
      'name': 'History Sewaan',
      'icon': Icons.work_history_outlined,
      'header': 'Log History Sewaan',
    },
    {
      'name': 'List Penyewa',
      'icon': Icons.people_outlined,
      'header': 'List Penyewa',
    },
  ];

  List<Map<String, dynamic>> get bottomNavBarList => _bottomNavBarList;

  final List<String> _views = [
    RetributorIndexViewRoutes.tempatSewaListView,
    RetributorIndexViewRoutes.logHistorySewaanView,
    RetributorIndexViewRoutes.penyewaListView,
  ];

  String header = 'List Tempat Sewa';

  String? level;

  Future<void> init() async {
    // socketIoClient.on('connect', (data) => log.i('connected'));
    level = await mySharedPrefs.getString('level');
    if (level != 'retributor') {
      snackbarService.showSnackbar(
        message: 'Hanya Retributor yang dapat mengakses halaman ini',
      );
      _navigationService.navigateTo(Routes.loginScreenView);
      return;
    }

    socketIoClient.on('scan', (data) async {
      var res = await dialogService.showCustomDialog(
        variant: DialogType.scanRfidDialogView,
        title: 'Pembayaran Retribusi',
        data: data,
      );

      if (res!.confirmed) {
        snackbarService.showSnackbar(
          message: res.data,
        );
      }
    });
  }

  void handleNavigation(int index) {
    log.d("handleNavigation: $index");
    log.d("currentIndex: $currentIndex");

    if (currentIndex == index) return;

    setIndex(index);
    header = _bottomNavBarList[index]['header'] as String;
    _navigationService.navigateTo(
      _views[index],
      id: 3,
    );
  }

  logout() async {
    dialogService
        .showConfirmationDialog(
      title: 'Konfirmasi',
      description: 'Apakah anda yakin ingin keluar?',
      cancelTitle: 'Batal',
      confirmationTitle: 'Keluar',
    )
        .then((value) async {
      if (value!.confirmed) {
        await mySharedPrefs.clear();
        _navigationService.clearStackAndShow(Routes.loginScreenView);
      }
    });
  }
}
