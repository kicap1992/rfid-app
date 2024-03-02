import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../../app/app.router.dart';
import '../../../app/themes/app_colors.dart';
import '../../../app/themes/app_text.dart';
import '../../../model/penyewa_model.dart';
import './penyewa_index_view_model.dart';

class PenyewaIndexView extends StatelessWidget {
  final DetailPenyewaModel penyewa;

  const PenyewaIndexView({super.key, required this.penyewa});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PenyewaIndexViewModel>.reactive(
      viewModelBuilder: () => PenyewaIndexViewModel(),
      onViewModelReady: (PenyewaIndexViewModel model) async {
        await model.init(penyewa);
      },
      builder: (
        BuildContext context,
        PenyewaIndexViewModel model,
        Widget? child,
      ) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                model.header,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              backgroundColor: mainColor,
              elevation: 0,
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  onPressed: () {
                    model.logout();
                  },
                  icon: const Icon(Icons.logout, color: Colors.white),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: ExtendedNavigator(
                navigatorKey: StackedService.nestedNavigationKey(4),
                router: PenyewaIndexViewRouter(),
                initialRoute: PenyewaIndexViewRoutes.penyewaLogView,
              ),
            ),
            bottomNavigationBar: StylishBottomBar(
              items: [
                for (var item in model.bottomNavBarList)
                  BottomBarItem(
                    icon: Icon(item['icon'],
                        color: model.currentIndex ==
                                model.bottomNavBarList.indexOf(item)
                            ? sixthGrey
                            : backgroundColor),
                    title: Text(
                      item['name'],
                      style: regularTextStyle.copyWith(
                        color: model.currentIndex ==
                                model.bottomNavBarList.indexOf(item)
                            ? sixthGrey
                            : mainGrey,
                      ),
                    ),
                    backgroundColor: model.currentIndex ==
                            model.bottomNavBarList.indexOf(item)
                        ? fontColor
                        : mainGrey,
                  ),
              ],
              currentIndex: model.currentIndex,
              hasNotch: true,
              backgroundColor: mainColor,
              onTap: (value) {
                model.handleNavigation(value);
              },
              option: BubbleBarOptions(
                  barStyle: BubbleBarStyle.horizotnal,
                  bubbleFillStyle: BubbleFillStyle.fill,
                  opacity: 0.3),
            ),
          ),
        );
      },
    );
  }
}
