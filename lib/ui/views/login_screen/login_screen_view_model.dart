import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';
import '../../../app/core/custom_base_view_model.dart';
import '../../../model/my_response_model.dart';
import '../../../model/penyewa_model.dart';

class LoginScreenViewModel extends CustomBaseViewModel {
  final log = getLogger('LoginScreenViewModel');

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> init() async {}

  login() async {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username == 'retributor' && password == 'retributor') {
      await mySharedPrefs.clear();
      await mySharedPrefs.setString('level', 'retributor');
      snackbarService.showSnackbar(
          message: 'Login Berhasil\nSelamat Datang Retributor');
      navigationService.navigateTo(Routes.retributorIndexView);
      return;
    }
    easyLoading.customLoading('Login...');

    try {
      var formData =
          FormData.fromMap({'username': username, 'password': password});
      var response = await httpService.postWithFormData('login', formData);
      MyResponseModel myResponseModel = MyResponseModel.fromJson(response.data);
      // log.i(myResponseModel);
      if (myResponseModel.status == true) {
        // mySharedPrefs.clear();
        // log.i('pindah');
        DetailPenyewaModel detailPenyewa =
            DetailPenyewaModel.fromJson(myResponseModel.data);
        // log.i(detailPenyewa.nik);
        await mySharedPrefs.setString('level', 'penyewa');
        mySharedPrefs.setString('nik', detailPenyewa.nik!);
        // String ininikcoba = await mySharedPrefs.getString('nik') ?? 'tidak ada';
        // log.i("ini nik coba $ininikcoba");
        snackbarService.showSnackbar(
            message: 'Login Berhasil\nSelamat Datang ${detailPenyewa.nama}');
        navigationService.navigateTo(
          Routes.penyewaIndexView,
          arguments: PenyewaIndexViewArguments(penyewa: detailPenyewa),
        );
      }
    } catch (e) {
      log.e(e);
      // snackbarService.showSnackbar(message: 'Error: $e');
    } finally {
      easyLoading.dismiss();
    }
  }
}
