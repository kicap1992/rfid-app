import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
import './log_history_sewaan_view_model.dart';

class LogHistorySewaanView extends StatelessWidget {
  const LogHistorySewaanView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LogHistorySewaanViewModel>.reactive(
      viewModelBuilder: () => LogHistorySewaanViewModel(),
      onViewModelReady: (LogHistorySewaanViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        LogHistorySewaanViewModel model,
        Widget? child,
      ) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            body: Column(
              children: [
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
                    child: model.logHistorySewaanList == null
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            itemCount: model.logHistorySewaanList!.length,
                            itemBuilder: (context, index) {
                              // model.log
                              //     .i(model.logHistorySewaanList![index].date);
                              return GestureDetector(
                                onTap: () {
                                  // model.log.i('clicked on index $index');
                                  model.checkKet(
                                    model.logHistorySewaanList![index],
                                  );
                                },
                                child: Card(
                                  child: ListTile(
                                    title: Text(
                                      model.logHistorySewaanList![index].jenis!,
                                      style:
                                          boldTextStyle.copyWith(fontSize: 15),
                                    ),
                                    subtitle: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Penyewa : ${model.logHistorySewaanList![index].nama}',
                                          style: regularTextStyle,
                                        ),
                                        // Text(
                                        //   model.logHistorySewaanList![index]
                                        //       .jenis!,
                                        //   style: italicTextStyle,
                                        // ),
                                      ],
                                    ),
                                    // dummy date and time
                                    trailing: Text(
                                      model.otherFunction.formatDateString(model
                                          .logHistorySewaanList![index].date!),
                                      style: boldTextStyle,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
