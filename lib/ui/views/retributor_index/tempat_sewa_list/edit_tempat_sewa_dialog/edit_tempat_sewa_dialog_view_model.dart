import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rfid_app/model/penyewa_model.dart';

import '../../../../../app/app.logger.dart';
import '../../../../../app/core/custom_base_view_model.dart';

class EditTempatSewaDialogViewModel extends CustomBaseViewModel {
  final log = getLogger('EditTempatSewaDialogViewModel');
  TextEditingController tempatSewaController = TextEditingController();
  TextEditingController sewaBulanController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> init(PenyewaModel? data) async {
    log.d('init edit tempat sewa dialog');
    tempatSewaController.text = data!.namaTempatSewa!;
    sewaBulanController.text = data.hargaSewa!.toString();
    notifyListeners();
  }

  Future<bool> updateTempatSewa(int? idTempatSerwa) async {
    String tempatSewa = tempatSewaController.text;
    String sewaBulan = sewaBulanController.text;

    try {
      var formData = FormData.fromMap({
        'nama_tempat_sewa': tempatSewa,
        'harga_sewa': int.parse(sewaBulan),
      });
      easyLoading.customLoading('Updating...');
      await httpService.putWithFormData(
          'scan/tempat_sewa/$idTempatSerwa', formData);
      return true;
    } catch (e) {
      log.e(e);
      return false;
    } finally {
      easyLoading.dismiss();
    }
  }
}
