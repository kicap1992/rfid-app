import 'package:flutter/material.dart';
import 'package:rfid_app/app/themes/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../app/themes/app_text.dart';
import '../../../../../model/penyewa_model.dart';
import './detail_log_history_view_model.dart';

class DetailLogHistoryView extends StatelessWidget {
  final SheetRequest<PenyewaModel> request;
  final Function(SheetResponse) completer;

  const DetailLogHistoryView({
    super.key,
    required SheetRequest request,
    required this.completer,
  }) : request = request as SheetRequest<PenyewaModel>;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailLogHistoryViewModel>.reactive(
      viewModelBuilder: () => DetailLogHistoryViewModel(),
      onViewModelReady: (DetailLogHistoryViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        DetailLogHistoryViewModel model,
        Widget? child,
      ) {
        return SafeArea(
          child: Container(
            // alignment: Alignment.topCenter,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(child: Text(request.data!.jenis!, style: boldTextStyle)),
                const Divider(
                  color: mainGrey,
                  thickness: 1,
                ),
                _RowDetail(
                  title: 'Nama',
                  value: request.data!.nama!,
                ),
                const SizedBox(height: 10),
                _RowDetail(
                  title: 'Waktu',
                  value: model.otherFunction
                      .formatDateString2(request.data!.date!),
                ),
                const SizedBox(height: 10),
                _RowDetail(
                  title: 'Keterangan',
                  value: request.data!.ket!,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _RowDetail extends StatelessWidget {
  const _RowDetail({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            title,
            style: boldTextStyle,
          ),
        ),
        const Expanded(
          flex: 1,
          child: Text(':'),
        ),
        Expanded(
          flex: 7,
          child: Text(
            value,
            style: italicTextStyle,
          ),
        ),
      ],
    );
  }
}
