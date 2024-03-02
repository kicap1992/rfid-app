import 'package:dio/dio.dart';
import 'package:rfid_app/model/my_response_model.dart';

import '../../../../../app/app.logger.dart';
import '../../../../../app/core/custom_base_view_model.dart';
import '../../../../../model/penyewa_model.dart';

class TopUpSaldoViewModel extends CustomBaseViewModel {
  final log = getLogger('TopUpSaldoViewModel');

  DetailPenyewaModel? detailPenyewaModel;

  List<Map<String, dynamic>> topUpList = [
    {'title': 'Rp. 50.000', 'value': 50000},
    {'title': 'Rp. 75.000', 'value': 75000},
    {'title': 'Rp. 100.000', 'value': 100000},
    {'title': 'Rp. 200.000', 'value': 200000},
  ];

  int topUpValue = 50000;

  Future<void> init(DetailPenyewaModel? data) async {
    log.d(data);

    detailPenyewaModel = data;
    notifyListeners();
  }

  Future<String?> topUpSaldo() async {
    log.i('ini topUpValue: $topUpValue');
    try {
      var formData = FormData.fromMap({
        'topup': topUpValue,
      });

      var response = await httpService.postWithFormData(
          'scan/penyewa/${detailPenyewaModel!.nik}', formData);

      MyResponseModel myResponseModel = MyResponseModel.fromJson(response.data);

      return myResponseModel.message;
    } catch (e) {
      log.e(e);
      // snackbarService.showSnackbar(message: 'Error: $e');
    }
    return null;
  }
}
