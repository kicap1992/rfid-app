import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../model/my_response_model.dart';
import '../../../../model/penyewa_model.dart';

class TempatSewaanViewModel extends CustomBaseViewModel {
  final log = getLogger('TempatSewaanViewModel');
  List<PenyewaModel>? tempatSewaanList;
  String? nik;
  Future<void> init() async {
    nik = await mySharedPrefs.getString('nik');
    await getData(nik);
  }

  getData(String? nik) async {
    try {
      var response = await httpService.get('user/tempat_sewa/$nik');
      MyResponseModel myResponseModel = MyResponseModel.fromJson(response.data);
      log.i(myResponseModel.data);
      tempatSewaanList = [];
      myResponseModel.data.forEach((item) {
        PenyewaModel penyewa = PenyewaModel.fromJson(item);
        tempatSewaanList!.add(penyewa);
        log.d(penyewa);
      });
      notifyListeners();
    } catch (e) {
      log.e(e);
    }
  }
}
