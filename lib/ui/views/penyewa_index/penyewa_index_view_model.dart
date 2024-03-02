import 'package:flutter/material.dart';
import 'package:rfid_app/app/app.locator.dart';
import 'package:rfid_app/model/penyewa_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';
import '../../../services/shared_prefs.dart';

class PenyewaIndexViewModel extends IndexTrackingViewModel {
  final log = getLogger('PenyewaIndexViewModel');
  final mySharedPrefs = locator<MySharedPrefs>();
  final _navigationService = locator<NavigationService>();
  final dialogService = locator<DialogService>();
  final snackbarService = locator<SnackbarService>();
  // final socketIoClient = locator<MySocketIoClient>();

  final _bottomNavBarList = [
    {
      'name': 'Tempat Sewa',
      'icon': Icons.home_outlined,
      'header': 'List Tempat Sewa',
    },
    {
      'name': 'Log History',
      'icon': Icons.work_history_outlined,
      'header': 'Log History',
    },
    {
      'name': 'Detail User',
      'icon': Icons.mobile_friendly_outlined,
      'header': 'Detail User',
    },
  ];

  List<Map<String, dynamic>> get bottomNavBarList => _bottomNavBarList;

  final List<String> _views = [
    PenyewaIndexViewRoutes.tempatSewaanView,
    PenyewaIndexViewRoutes.penyewaLogView,
    PenyewaIndexViewRoutes.pulsaDetailView,
  ];

  String header = 'Log History';
  String? level;

  Future<void> init(DetailPenyewaModel penyewa) async {
    level = await mySharedPrefs.getString('level');
    if (level != 'penyewa') {
      snackbarService.showSnackbar(
        message: 'Hanya Penyewa yang dapat mengakses halaman ini',
      );
      _navigationService.navigateTo(Routes.loginScreenView);
      return;
    }

    setIndex(1);
    // String nikAtprefs = await mySharedPrefs.getString('nik') ?? 'tidak ada';
    // log.i("ini nikAtprefs $nikAtprefs");
    // log.i(penyewa.nik);
  }

  void handleNavigation(int index) {
    log.d("handleNavigation: $index");
    log.d("currentIndex: $currentIndex");

    if (currentIndex == index) return;

    setIndex(index);
    header = _bottomNavBarList[index]['header'] as String;
    _navigationService.navigateTo(
      _views[index],
      id: 4,
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
