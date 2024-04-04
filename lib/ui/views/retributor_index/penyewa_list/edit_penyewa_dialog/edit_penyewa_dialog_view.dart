import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../../app/themes/app_colors.dart';
import '../../../../../model/penyewa_model.dart';
import '../../../../widgets/my_button.dart';
import '../../../../widgets/my_textformfield.dart';
import './edit_penyewa_dialog_view_model.dart';

class EditPenyewaDialogView extends StatelessWidget {
  final DialogRequest<DetailPenyewaModel> request;
  final Function(DialogResponse) completer;
  const EditPenyewaDialogView({
    super.key,
    required DialogRequest request,
    required this.completer,
  }) : request = request as DialogRequest<DetailPenyewaModel>;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditPenyewaDialogViewModel>.reactive(
      viewModelBuilder: () => EditPenyewaDialogViewModel(),
      onViewModelReady: (EditPenyewaDialogViewModel model) async {
        await model.init(request.data);
      },
      builder: (
        BuildContext context,
        EditPenyewaDialogViewModel model,
        Widget? child,
      ) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: backgroundColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("NIK"),
                  MyTextFormField(
                    controller: model.nikController,
                    hintText: 'Masukkan NIK Penyewa',
                    keyboardType: TextInputType.number,
                    maxLength: 16,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('NIK harus diisi'),
                        Validatorless.min(16, 'NIK harus 16 digit'),
                        Validatorless.max(16, 'NIK harus 16 digit'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Nama"),
                  MyTextFormField(
                    controller: model.nameController,
                    hintText: 'Masukkan Nama Penyewa',
                    validator: Validatorless.required('Nama harus diisi'),
                  ),
                  const SizedBox(height: 20),
                  MyButton(
                    text: 'Update Data',
                    onPressed: () {
                      if (request.data!.nik == model.nikController.text &&
                          request.data!.nama == model.nameController.text) {
                        model.snackbarService.showSnackbar(
                          message: 'Tidak ada perubahan',
                        );
                        return;
                      }

                      model.dialogService
                          .showDialog(
                        title: 'Konfirmasi',
                        description: 'Apakah anda yakin ingin mengupdate data?',
                        cancelTitle: 'Batal',
                        buttonTitle: 'Update',
                        // confirmationTitle: 'Update',
                      )
                          .then((value) async {
                        if (value!.confirmed) {
                          bool res = await model.updateData(request.data!.nik);
                          // model.log.i("ini res: $res");
                          if (res) {
                            completer(DialogResponse(confirmed: true));
                          }
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
