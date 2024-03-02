import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../../app/app.logger.dart';
import '../../../../../app/core/custom_base_view_model.dart';
import '../../../../../model/penyewa_model.dart';

class EditPenyewaDialogViewModel extends CustomBaseViewModel {
  final log = getLogger('EditPenyewaDialogViewModel');

  TextEditingController nikController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> init(DetailPenyewaModel? data) async {
    log.d('init edit penyewa dialog');
    nikController.text = data!.nik!;
    nameController.text = data.nama!;
    notifyListeners();
  }

  Future<bool> updateData(String? nik) async {
    try {
      easyLoading.customLoading('Updating Data...');
      // delay 2 seconds
      // await Future.delayed(const Duration(seconds: 2));
      var formData = FormData.fromMap({
        'nik_baru': nikController.text,
        'nama': nameController.text,
      });
      await httpService.putWithFormData('scan/penyewa/$nik', formData);
      return true;
    } catch (e) {
      log.d(e);
      return false;
    } finally {
      easyLoading.dismiss();
    }
  }
}
