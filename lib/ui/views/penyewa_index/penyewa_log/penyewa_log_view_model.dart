import '../../../../app/app.bottomsheets.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../model/my_response_model.dart';
import '../../../../model/penyewa_model.dart';

class PenyewaLogViewModel extends CustomBaseViewModel {
  final log = getLogger('PenyewaLogViewModel');
  List<PenyewaModel>? logHistorySewaanList;
  String? nik;
  Future<void> init() async {
    nik = await mySharedPrefs.getString('nik');
    await getData(nik);
  }

  getData(String? nik) async {
    try {
      var response = await httpService.get('user/log_user/$nik');
      MyResponseModel myResponseModel = MyResponseModel.fromJson(response.data);
      log.i(myResponseModel.data);
      logHistorySewaanList = [];
      myResponseModel.data.forEach((item) {
        PenyewaModel penyewa = PenyewaModel.fromJson(item);
        logHistorySewaanList!.add(penyewa);
        log.d(penyewa);
      });
      notifyListeners();
    } catch (e) {
      log.e(e);
    }
  }

  checkKet(PenyewaModel penyewaModel) async {
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.detailLogHistoryView,
      data: penyewaModel,
    );
  }
}
