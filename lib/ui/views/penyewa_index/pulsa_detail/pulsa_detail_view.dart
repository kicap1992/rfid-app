import 'package:flutter/material.dart';
import 'package:rfid_app/app/themes/app_text.dart';
import 'package:rfid_app/ui/widgets/my_button.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_colors.dart';
import './pulsa_detail_view_model.dart';

class PulsaDetailView extends StatelessWidget {
  const PulsaDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PulsaDetailViewModel>.reactive(
      viewModelBuilder: () => PulsaDetailViewModel(),
      onViewModelReady: (PulsaDetailViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        PulsaDetailViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: mainColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: model.detailPenyewaModel == null
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _RowChildren(
                            title: 'NIK',
                            value: model.detailPenyewaModel!.nik ?? '...',
                          ),
                          const SizedBox(height: 5),
                          _RowChildren(
                            title: 'Nama',
                            value: model.detailPenyewaModel!.nama ?? '...',
                          ),
                          const SizedBox(height: 5),
                          _RowChildren(
                            title: 'Pulsa',
                            value:
                                'Rp. ${model.otherFunction.commaFormat(model.detailPenyewaModel!.saldo ?? 0)}',
                          ),
                          const SizedBox(height: 5),
                          _RowChildren(
                            title: 'Card ID',
                            value: model.detailPenyewaModel!.rfid ?? '...',
                          ),
                        ],
                      ),
              ),
              const SizedBox(height: 20),
              const MyButton(text: 'Ganti Password')
            ],
          ),
        );
      },
    );
  }
}

class _RowChildren extends StatelessWidget {
  const _RowChildren({
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
          flex: 2,
          child: Text(
            title,
            style: regularTextStyle,
          ),
        ),
        const Expanded(flex: 1, child: Text(':')),
        Expanded(
          flex: 5,
          child: Text(
            value,
            style: boldTextStyle,
          ),
        ),
      ],
    );
  }
}
