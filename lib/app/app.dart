import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked_annotations.dart';

import '../services/http_services.dart';
import '../services/my_easyloading.dart';
import '../services/my_socket_io_client.dart';
import '../services/other_function.dart';
import '../services/shared_prefs.dart';
import '../ui/views/login_screen/login_screen_view.dart';
import '../ui/views/penyewa_index/penyewa_index_view.dart';
import '../ui/views/penyewa_index/penyewa_log/penyewa_log_view.dart';
import '../ui/views/penyewa_index/pulsa_detail/pulsa_detail_view.dart';
import '../ui/views/penyewa_index/tempat_sewaan/tempat_sewaan_view.dart';
import '../ui/views/retributor_index/log_history_sewaan/detail_log_history/detail_log_history_view.dart';
import '../ui/views/retributor_index/log_history_sewaan/log_history_sewaan_view.dart';
import '../ui/views/retributor_index/penyewa_list/edit_penyewa_dialog/edit_penyewa_dialog_view.dart';
import '../ui/views/retributor_index/penyewa_list/penyewa_list_view.dart';
import '../ui/views/retributor_index/penyewa_list/top_up_saldo/top_up_saldo_view.dart';
import '../ui/views/retributor_index/retributor_index_view.dart';
import '../ui/views/retributor_index/scan_rfid_dialog/scan_rfid_dialog_view.dart';
import '../ui/views/retributor_index/tempat_sewa_list/edit_tempat_sewa_dialog/edit_tempat_sewa_dialog_view.dart';
import '../ui/views/retributor_index/tempat_sewa_list/tempat_sewa_list_view.dart';
import '../ui/views/splash_screen/splash_screen_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreenView, initial: true),
    MaterialRoute(page: LoginScreenView),
    MaterialRoute(
      page: RetributorIndexView,
      children: [
        MaterialRoute(page: TempatSewaListView),
        MaterialRoute(page: LogHistorySewaanView),
        MaterialRoute(page: PenyewaListView),
      ],
    ),
    MaterialRoute(page: PenyewaIndexView, children: [
      MaterialRoute(page: PenyewaLogView),
      MaterialRoute(page: TempatSewaanView),
      MaterialRoute(page: PulsaDetailView),
    ])
  ],
  dialogs: [
    StackedDialog(classType: ScanRfidDialogView),
    StackedDialog(classType: TopUpSaldoView),
    StackedDialog(classType: EditTempatSewaDialogView),
    StackedDialog(classType: EditPenyewaDialogView)
  ],
  bottomsheets: [
    StackedBottomsheet(classType: DetailLogHistoryView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    //

    LazySingleton(classType: MyEasyLoading),
    LazySingleton(classType: MyHttpServices),
    LazySingleton(classType: OtherFunction),
    LazySingleton(classType: MySocketIoClient),
    LazySingleton(classType: MySharedPrefs)
  ],
  logger: StackedLogger(),
)
class App {}
