import 'package:flutter/material.dart';
import 'package:rfid_app/model/penyewa_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
import './scan_rfid_dialog_view_model.dart';

class ScanRfidDialogView extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ScanRfidDialogView({
    super.key,
    required this.request,
    required this.completer,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScanRfidDialogViewModel>.reactive(
      viewModelBuilder: () => ScanRfidDialogViewModel(),
      onViewModelReady: (ScanRfidDialogViewModel model) async {
        await model.init(request.data);
      },
      builder: (
        BuildContext context,
        ScanRfidDialogViewModel model,
        Widget? child,
      ) {
        return Dialog(
          child: Container(
            // alignment: Alignment.center,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: backgroundColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    request.title!,
                    style: regularTextStyle.copyWith(
                      fontSize: 20,
                      // color: Colors.white,
                    ),
                  ),
                ),
                // const SizedBox(height: 10),
                // create line
                const Divider(
                  color: greyBlueColor,
                  thickness: 1,
                ),
                const SizedBox(height: 5),
                DetailRow(title: 'nama', value: model.nama ?? '...'),
                const SizedBox(height: 5),
                DetailRow(title: 'Card id', value: model.cardId ?? '...'),
                const SizedBox(height: 5),
                DetailRow(title: 'Saldo', value: model.saldo ?? '...'),
                const SizedBox(height: 10),
                const Text('  Pilih tempat retribusi', style: regularTextStyle),
                model.penyewaList.isEmpty
                    ? Container()
                    : Container(
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
                          child: DropdownButton<String>(
                            value: model.idTempatSerwa.toString(),
                            onChanged: (String? newValue) {
                              model.log.d('newValue: $newValue');
                              model.idTempatSerwa = int.parse(newValue!);
                              model.notifyListeners();
                            },
                            items: model.penyewaList.map((PenyewaModel value) {
                              return DropdownMenuItem<String>(
                                value: value.idTempatSerwa.toString(),
                                child: Text(
                                  value.namaTempatSewa.toString(),
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
                        // String? message = await model.bayar();

                        // if (message != null) {
                        //   completer(DialogResponse(
                        //     confirmed: true,
                        //     data: message,
                        //   ));
                        // }
                        PenyewaModel penyewa = model.penyewaList.firstWhere(
                            (element) =>
                                element.idTempatSerwa == model.idTempatSerwa);

                        model.dialogService
                            .showDialog(
                          title: 'Bayar?',
                          description:
                              '${model.nama} dengan Card ID ${model.cardId} akan membayar retribusi ${penyewa.namaTempatSewa} sebanyak Rp. ${model.otherFunction.commaFormat(penyewa.hargaSewa!)} per bulan sekarang?',
                          cancelTitle: 'Batal',
                        )
                            .then((res) async {
                          if (res!.confirmed) {
                            String? message = await model.bayar(penyewa);
                            if (message != null) {
                              completer(DialogResponse(
                                confirmed: true,
                                data: message,
                              ));
                            }
                            // completer(DialogResponse(
                            //   confirmed: true,
                            // ));
                          }
                        });
                      },
                      child: const Text('Bayar'),
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

class DetailRow extends StatelessWidget {
  const DetailRow({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Text(title),
        ),
        const Expanded(
          flex: 1,
          child: Text(':'),
        ),
        Expanded(
          flex: 8,
          child: Text(value),
        ),
      ],
    );
  }
}
