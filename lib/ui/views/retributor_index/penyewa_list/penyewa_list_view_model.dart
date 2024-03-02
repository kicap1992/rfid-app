import '../../../../app/app.dialogs.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../model/my_response_model.dart';
import '../../../../model/penyewa_model.dart';

class PenyewaListViewModel extends CustomBaseViewModel {
  final log = getLogger('PenyewaListViewModel');
  List<DetailPenyewaModel>? penyewaList;
  Future<void> init() async {
    log.d('init');
    await getData();
  }

  getData() async {
    try {
      var response = await httpService.get('scan/penyewa');
      MyResponseModel myResponseModel = MyResponseModel.fromJson(response.data);
      penyewaList = [];
      myResponseModel.data.forEach((item) {
        DetailPenyewaModel detailPenyewa = DetailPenyewaModel.fromJson(item);
        penyewaList!.add(detailPenyewa);
        log.d(detailPenyewa);
      });

      notifyListeners();
    } catch (e) {
      log.d(e);
      // snackbarService.showSnackbar(message: 'Error: $e');
    }
  }

  topUp(DetailPenyewaModel detailPenyewaModel) async {
    var res = await dialogService.showCustomDialog(
      variant: DialogType.topUpSaldoView,
      data: detailPenyewaModel,
      title: 'Top Up Kartu Retributor',
    );

    if (res != null && res.confirmed) {
      snackbarService.showSnackbar(message: res.data);
      await getData();
    }
  }

  editPenyewaDialog(DetailPenyewaModel detailPenyewaModel) async {
    var res = await dialogService.showCustomDialog(
      variant: DialogType.editPenyewaDialogView,
      data: detailPenyewaModel,
      // title: 'Edit Penyewa',
    );

    if (res!.confirmed) {
      snackbarService.showSnackbar(message: 'Berhasil mengupdate data');
      await getData();
    }
  }
}
