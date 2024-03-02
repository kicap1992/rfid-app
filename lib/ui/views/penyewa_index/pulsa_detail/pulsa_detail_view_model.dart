import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../model/my_response_model.dart';
import '../../../../model/penyewa_model.dart';

class PulsaDetailViewModel extends CustomBaseViewModel {
  final log = getLogger('PulsaDetailViewModel');
  String? nik;
  DetailPenyewaModel? detailPenyewaModel;
  Future<void> init() async {
    nik = await mySharedPrefs.getString('nik');
    await getData(nik);
  }

  getData(String? nik) async {
    try {
      var response = await httpService.get('user/user/$nik');
      MyResponseModel myResponseModel = MyResponseModel.fromJson(response.data);
      detailPenyewaModel = DetailPenyewaModel.fromJson(myResponseModel.data);
      notifyListeners();
    } catch (e) {
      log.e(e);
    }
  }
}
