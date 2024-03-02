// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/views/retributor_index/log_history_sewaan/detail_log_history/detail_log_history_view.dart';

enum BottomSheetType {
  detailLogHistoryView,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.detailLogHistoryView: (context, request, completer) =>
        DetailLogHistoryView(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
