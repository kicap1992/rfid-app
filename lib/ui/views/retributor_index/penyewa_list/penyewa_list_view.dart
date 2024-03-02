import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
import './penyewa_list_view_model.dart';

class PenyewaListView extends StatelessWidget {
  const PenyewaListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PenyewaListViewModel>.reactive(
      viewModelBuilder: () => PenyewaListViewModel(),
      onViewModelReady: (PenyewaListViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        PenyewaListViewModel model,
        Widget? child,
      ) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            body: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: mainGrey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: regularTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '2 orang',
                        style: regularTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: mainGrey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: model.penyewaList == null
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            itemCount: model.penyewaList!.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                    title: Text(model.penyewaList![index].nama!,
                                        style: boldTextStyle.copyWith(
                                            fontSize: 13)),
                                    subtitle: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'Card ID: ${model.penyewaList![index].rfid!}',
                                            style: regularTextStyle.copyWith(
                                                fontSize: 12)),
                                        Text(
                                            'Saldo: Rp. ${model.otherFunction.commaFormat(model.penyewaList![index].saldo!)}',
                                            style: regularTextStyle.copyWith(
                                                fontSize: 12)),
                                      ],
                                    ),
                                    // circle avatar
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            await model.topUp(
                                                model.penyewaList![index]);
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: mainColor,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: const Icon(
                                              Icons.add_card_outlined,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        GestureDetector(
                                          onTap: () => model.snackbarService
                                              .showSnackbar(
                                                  message:
                                                      'Fitur sedang dalam tahap pengembangan'),
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: mainColor,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: const Icon(
                                              Icons.list_alt,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        GestureDetector(
                                          onTap: () async =>
                                              model.editPenyewaDialog(
                                                  model.penyewaList![index]),
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: mainColor,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: const Icon(
                                              Icons.edit_document,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                              );
                            },
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
