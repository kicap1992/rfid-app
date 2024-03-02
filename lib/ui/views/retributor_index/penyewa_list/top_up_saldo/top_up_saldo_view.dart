import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../app/themes/app_colors.dart';
import '../../../../../app/themes/app_text.dart';
import '../../../../../model/penyewa_model.dart';
import '../../scan_rfid_dialog/scan_rfid_dialog_view.dart';
import './top_up_saldo_view_model.dart';

class TopUpSaldoView extends StatelessWidget {
  final DialogRequest<DetailPenyewaModel> request;
  final Function(DialogResponse) completer;
  const TopUpSaldoView({
    super.key,
    required DialogRequest request,
    required this.completer,
  }) : request = request as DialogRequest<DetailPenyewaModel>;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TopUpSaldoViewModel>.reactive(
      viewModelBuilder: () => TopUpSaldoViewModel(),
      onViewModelReady: (TopUpSaldoViewModel model) async {
        await model.init(request.data);
      },
      builder: (
        BuildContext context,
        TopUpSaldoViewModel model,
        Widget? child,
      ) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: backgroundColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  request.title!,
                  style: boldTextStyle.copyWith(
                    fontSize: 15,
                  ),
                ),
                const Divider(
                  color: greyBlueColor,
                  thickness: 1,
                ),
                const SizedBox(height: 5),
                DetailRow(
                  title: 'Nama',
                  value: request.data!.nama ?? '...',
                ),
                const SizedBox(height: 10),
                DetailRow(
                  title: 'Card ID',
                  value: request.data!.rfid ?? '...',
                ),
                const SizedBox(height: 10),
                DetailRow(
                  title: 'Saldo',
                  value:
                      'Rp. ${model.otherFunction.commaFormat(request.data!.saldo ?? 0)}',
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: mainColor,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      value: model.topUpValue,
                      onChanged: (int? newValue) {
                        // model.log.d('newValue: $newValue');
                        model.topUpValue = newValue!;
                        model.notifyListeners();
                      },
                      items: model.topUpList.map((Map<String, dynamic> value) {
                        // model.log.d('value: $value');
                        return DropdownMenuItem<int>(
                          value: value['value'],
                          child: Text(
                            value['title'].toString(),
                            style: regularTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () async {
                        String? message = await model.topUpSaldo();

                        if (message != null) {
                          completer(DialogResponse(
                            confirmed: true,
                            data: message,
                          ));
                        }
                      },
                      child: const Text('TopUp Saldo'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
