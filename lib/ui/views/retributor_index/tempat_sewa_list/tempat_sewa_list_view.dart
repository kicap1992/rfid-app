import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
import './tempat_sewa_list_view_model.dart';

class TempatSewaListView extends StatelessWidget {
  const TempatSewaListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TempatSewaListViewModel>.reactive(
      viewModelBuilder: () => TempatSewaListViewModel(),
      onViewModelReady: (TempatSewaListViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        TempatSewaListViewModel model,
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
                        model.tempatSewaList?.length.toString() ?? '...',
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
                    child: model.tempatSewaList == null
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            itemCount: model.tempatSewaList!.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  title: Text(
                                    model
                                        .tempatSewaList![index].namaTempatSewa!,
                                    style: boldTextStyle.copyWith(
                                      fontSize: 15,
                                    ),
                                  ),
                                  subtitle: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Penyewa : ${model.tempatSewaList![index].nama}',
                                      ),
                                      Text(
                                        'Harga : Rp. ${model.otherFunction.commaFormat(model.tempatSewaList![index].hargaSewa!)}',
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
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: mainColor,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: const Icon(
                                            Icons.list_alt_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      GestureDetector(
                                        onTap: () async =>
                                            await model.editTempatSewa(
                                          model.tempatSewaList![index],
                                        ),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: mainColor,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: const Icon(
                                            Icons.edit_square,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
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
