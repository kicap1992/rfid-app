import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
import './tempat_sewaan_view_model.dart';

class TempatSewaanView extends StatelessWidget {
  const TempatSewaanView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TempatSewaanViewModel>.reactive(
      viewModelBuilder: () => TempatSewaanViewModel(),
      onViewModelReady: (TempatSewaanViewModel model) async {
        await model.init();
      },
      fireOnViewModelReadyOnce: true,
      builder: (
        BuildContext context,
        TempatSewaanViewModel model,
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
                        'Total Tempat Retribusi',
                        style: regularTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        model.tempatSewaanList?.length.toString() ?? '...',
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
                    child: model.tempatSewaanList == null
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            itemCount: model.tempatSewaanList!.length,
                            itemBuilder: (context, index) {
                              model.log.i(model.tempatSewaanList![index]);
                              return Card(
                                child: ListTile(
                                  title: Text(
                                    model.tempatSewaanList![index]
                                            .namaTempatSewa ??
                                        '',
                                    style: boldTextStyle.copyWith(
                                      fontSize: 15,
                                    ),
                                  ),
                                  subtitle: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Text(
                                      //   'Penyewa : ${model.tempatSewaanList![index].nama}',
                                      // ),
                                      Text(
                                        'Sewa / Bulan : Rp. ${model.otherFunction.commaFormat(model.tempatSewaanList![index].hargaSewa!)}',
                                      ),
                                    ],
                                  ),
                                  // circle avatar
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GestureDetector(
                                        onTap: () => model.snackbarService
                                            .showSnackbar(
                                                message:
                                                    'Fitur sedang dalam tahap pengembangan'),
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: mainColor,
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: const Icon(
                                            Icons.list_alt_outlined,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      // const SizedBox(width: 5),
                                      // Container(
                                      //   width: 50,
                                      //   height: 50,
                                      //   decoration: BoxDecoration(
                                      //     color: mainColor,
                                      //     borderRadius:
                                      //         BorderRadius.circular(50),
                                      //   ),
                                      //   child: const Icon(
                                      //     Icons.edit_square,
                                      //     color: Colors.white,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
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
