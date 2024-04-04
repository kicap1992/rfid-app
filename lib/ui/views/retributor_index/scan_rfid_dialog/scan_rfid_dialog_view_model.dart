import 'package:dio/dio.dart';
import 'package:rfid_app/app/core/custom_base_view_model.dart';
import 'package:rfid_app/model/my_response_model.dart';
import 'package:rfid_app/model/penyewa_model.dart';

import '../../../../app/app.logger.dart';

class ScanRfidDialogViewModel extends CustomBaseViewModel {
  final log = getLogger('ScanRfidDialogViewModel');
  String? nama;
  String? cardId;
  String? saldo;
  List<PenyewaModel> penyewaList = [];

  int? idTempatSerwa;

  Future<void> init(data) async {
    log.d('init');
    log.d(data);
    getData(data);
  }

  getData(String data) async {
    try {
      var respose = await httpService.get('scan/id/$data');
      // log.d(respose.data);
      MyResponseModel response = MyResponseModel.fromJson(respose.data);

      response.data.forEach((item) {
        PenyewaModel penyewa = PenyewaModel.fromJson(item);
        // log.d(penyewa);
        penyewaList.add(penyewa);
      });
      log.d(penyewaList);
      nama = penyewaList[0].nama;
      cardId = penyewaList[0].rfid;
      saldo = 'Rp. ${otherFunction.commaFormat(penyewaList[0].saldo ?? 0)}';
      idTempatSerwa = penyewaList[0].idTempatSerwa;

      notifyListeners();
    } catch (e) {
      log.e(e);
      // snackbarService.showSnackbar(message: 'Error: $e');
    }
  }

  Future<String?> bayar(PenyewaModel penyewa) async {
    try {
      var formData = FormData.fromMap({
        'nik': penyewa.nik,
        'rfid': cardId,
        'id_tempat_sewa': idTempatSerwa,
      });
      var respose = await httpService.postWithFormData('scan/bayar', formData);
      MyResponseModel response = MyResponseModel.fromJson(respose.data);
      return response.message;
    } catch (e) {
      log.e(e);
      return null;
    } finally {
      easyLoading.dismiss();
    }
  }
}
