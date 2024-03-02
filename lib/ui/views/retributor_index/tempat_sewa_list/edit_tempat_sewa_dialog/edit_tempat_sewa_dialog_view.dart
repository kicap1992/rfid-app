import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../../app/themes/app_colors.dart';
import '../../../../../model/penyewa_model.dart';
import '../../../../widgets/my_button.dart';
import '../../../../widgets/my_textformfield.dart';
import './edit_tempat_sewa_dialog_view_model.dart';

class EditTempatSewaDialogView extends StatelessWidget {
  final DialogRequest<PenyewaModel> request;
  final Function(DialogResponse) completer;

  const EditTempatSewaDialogView(
      {super.key, required DialogRequest request, required this.completer})
      : request = request as DialogRequest<PenyewaModel>;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditTempatSewaDialogViewModel>.reactive(
      viewModelBuilder: () => EditTempatSewaDialogViewModel(),
      onViewModelReady: (EditTempatSewaDialogViewModel model) async {
        await model.init(request.data);
      },
      builder: (
        BuildContext context,
        EditTempatSewaDialogViewModel model,
        Widget? child,
      ) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: backgroundColor,
            ),
            child: Form(
              key: model.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Tempat Sewa"),
                  MyTextFormField(
                    controller: model.tempatSewaController,
                    hintText: 'Masukkan Tempat Sewa',
                    validator:
                        Validatorless.required('Tempat Sewa harus diisi'),
                  ),
                  const SizedBox(height: 20),
                  const Text("Sewa / Bulan (Rp.)"),
                  MyTextFormField(
                    controller: model.sewaBulanController,
                    hintText: 'Masukkan Jumlah Sewa / Bulan',
                    keyboardType: TextInputType.number,
                    maxLength: 5,
                    validator: Validatorless.required(
                      'Jumlah Sewa / Bulan harus diisi',
                    ),
                  ),
                  const SizedBox(height: 20),
                  MyButton(
                    text: 'Update Detail',
                    onPressed: () async {
                      if (model.tempatSewaController.text ==
                              request.data!.namaTempatSewa &&
                          model.sewaBulanController.text ==
                              request.data!.hargaSewa.toString()) {
                        model.snackbarService.showSnackbar(
                          message: 'Tidak ada perubahan yang dilakukan',
                        );
                        return;
                      }

                      model.dialogService
                          .showDialog(
                        title: 'Edit Tempat Sewa',
                        description:
                            'Apakah anda yakin ingin mengedit detail tempat sewa?',
                        buttonTitle: 'Edit',
                        cancelTitle: 'Batal',
                      )
                          .then((value) async {
                        bool result = await model
                            .updateTempatSewa(request.data!.idTempatSerwa);
                        // model.log.i("ini result: $result");
                        if (result) {
                          completer(DialogResponse(confirmed: true));
                        }
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
