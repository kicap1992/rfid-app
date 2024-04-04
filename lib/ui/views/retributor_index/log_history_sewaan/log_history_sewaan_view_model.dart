import '../../../../app/app.bottomsheets.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../model/my_response_model.dart';
import '../../../../model/penyewa_model.dart';

class LogHistorySewaanViewModel extends CustomBaseViewModel {
  final log = getLogger('LogHistorySewaanViewModel');
  List<PenyewaModel>? logHistorySewaanList;

  Future<void> init() async {
    log.d('init log history sewaan');
    await getData();
  }

  getData() async {
    logHistorySewaanList = [];
    try {
      var response = await httpService.get('scan/log');
      MyResponseModel myResponseModel = MyResponseModel.fromJson(response.data);
      logHistorySewaanList = [];
      myResponseModel.data.forEach((item) {
        PenyewaModel penyewa = PenyewaModel.fromJson(item);
        logHistorySewaanList!.add(penyewa);
        log.d(penyewa);
      });
      notifyListeners();
    } catch (e) {
      log.e(e);
      // snackbarService.showSnackbar(message: 'Error: $e');
    }
  }

  checkKet(PenyewaModel penyewaModel) async {
    await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.detailLogHistoryView,
      data: penyewaModel,
    );
  }
}
