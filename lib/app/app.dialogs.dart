// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/views/retributor_index/penyewa_list/edit_penyewa_dialog/edit_penyewa_dialog_view.dart';
import '../ui/views/retributor_index/penyewa_list/top_up_saldo/top_up_saldo_view.dart';
import '../ui/views/retributor_index/scan_rfid_dialog/scan_rfid_dialog_view.dart';
import '../ui/views/retributor_index/tempat_sewa_list/edit_tempat_sewa_dialog/edit_tempat_sewa_dialog_view.dart';

enum DialogType {
  scanRfidDialogView,
  topUpSaldoView,
  editTempatSewaDialogView,
  editPenyewaDialogView,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.scanRfidDialogView: (context, request, completer) =>
        ScanRfidDialogView(request: request, completer: completer),
    DialogType.topUpSaldoView: (context, request, completer) =>
        TopUpSaldoView(request: request, completer: completer),
    DialogType.editTempatSewaDialogView: (context, request, completer) =>
        EditTempatSewaDialogView(request: request, completer: completer),
    DialogType.editPenyewaDialogView: (context, request, completer) =>
        EditPenyewaDialogView(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
