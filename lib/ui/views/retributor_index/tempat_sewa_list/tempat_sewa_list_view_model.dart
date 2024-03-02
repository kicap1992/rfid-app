import '../../../../app/app.dialogs.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../model/my_response_model.dart';
import '../../../../model/penyewa_model.dart';

class TempatSewaListViewModel extends CustomBaseViewModel {
  final log = getLogger('TempatSewaListViewModel');
  List<PenyewaModel>? tempatSewaList;

  Future<void> init() async {
    log.d('init tempat sewa list');
    await getData();
  }

  getData() async {
    try {
      var response = await httpService.get('scan/tempat_sewa');
      MyResponseModel myResponseModel = MyResponseModel.fromJson(response.data);
      tempatSewaList = [];
      myResponseModel.data.forEach((item) {
        PenyewaModel penyewa = PenyewaModel.fromJson(item);
        tempatSewaList!.add(penyewa);
        log.d(penyewa);
      });
      notifyListeners();
    } catch (e) {
      log.e(e);
      // snackbarService.showSnackbar(message: 'Error: $e');
    }
  }

  editTempatSewa(PenyewaModel penyewaModel) async {
    var res = await dialogService.showCustomDialog(
      variant: DialogType.editTempatSewaDialogView,
      data: penyewaModel,
    );
    log.i("ini res: ${res!.confirmed}");
    if (res.confirmed) {
      snackbarService.showSnackbar(message: 'Berhasil Update Data');
      getData();
    }
  }
}
