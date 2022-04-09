import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lots_/app/modules/dashboard/dashboard_controller.dart';
import 'package:lots_/app/modules/dashboard/widgets/eature_card.dart';
import 'package:lots_/app/utils/colors.dart';

import '../../utils/assets.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  final DashboardController dashboardController = DashboardController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: CustomColors.primaryYellow,
        // ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                height: 52,
                width: Get.width,
                decoration:
                    const BoxDecoration(color: CustomColors.primaryYellow),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(Assets.bxTimeFive),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => dashboardController.toggle(),
                          child: Icon(
                            dashboardController.isVisible.value == true
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined,
                            color: CustomColors.grayColor,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.white,
                              width: 1.4,
                            ),
                          ),
                          child: Text(
                            dashboardController.isVisible.value
                                ? "N 0.00"
                                : 'N *****',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SvgPicture.asset(Assets.icBaselineAccountCircle),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                height: 124,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: const [
                    FeatureCard(
                      icon: Assets.send,
                      title: 'Send Money',
                    ),
                    FeatureCard(
                      icon: Assets.naira,
                      title: 'Request Money',
                    ),
                    FeatureCard(
                      icon: Assets.call,
                      title: 'Buy Airtime',
                    ),
                    FeatureCard(
                      icon: Assets.network,
                      title: 'Buy Data',
                    ),
                    FeatureCard(
                      icon: Assets.doc,
                      title: 'Pay Bills',
                    ),
                  ],
                  // itemCount: 5,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.nairaSign,
                    height: 22,
                  ),
                  SizedBox(
                    width: dashboardController.monitor.isNotEmpty ? 12 : 0,
                  ),
                  Text(
                    dashboardController.monitor
                        .toString()
                        .replaceAll("[", "")
                        .replaceAll("]", "")
                        .replaceAll(" ", "")
                        .replaceAll(",", ""),
                    style: const TextStyle(
                      color: Color(0xff232323),
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: Divider(
                  color: CustomColors.primaryYellow,
                  thickness: 1,
                  height: 0,
                ),
              ),
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,
                  childAspectRatio: 1.5,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  children: [
                    gridCard(
                        index: '1',
                        onTap: () => dashboardController.addToList('1')),
                    gridCard(
                        index: '2',
                        onTap: () => dashboardController.addToList('2')),
                    gridCard(
                        index: '3',
                        onTap: () => dashboardController.addToList('3')),
                    gridCard(
                        index: '4',
                        onTap: () => dashboardController.addToList('4')),
                    gridCard(
                        index: '5',
                        onTap: () => dashboardController.addToList('5')),
                    gridCard(
                        index: '6',
                        onTap: () => dashboardController.addToList('6')),
                    gridCard(
                        index: '7',
                        onTap: () => dashboardController.addToList('7')),
                    gridCard(
                        index: '8',
                        onTap: () => dashboardController.addToList('8')),
                    gridCard(
                        index: '9',
                        onTap: () => dashboardController.addToList('9')),
                    gridCard(isIcon: true, index: Assets.scan),
                    gridCard(
                        index: '0',
                        onTap: () => dashboardController.addToList('0')),
                    gridCard(
                        isIcon: true,
                        index: Assets.delete,
                        onTap: () => dashboardController.removeFromList()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget gridCard({index = "1", isIcon = false, onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 28,
          vertical: 12,
        ),
        height: 54,
        width: 57,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: isIcon ? Colors.transparent : Colors.black,
          ),
        ),
        child: Center(
          child: isIcon
              ? SvgPicture.asset(index)
              : Text(
                  index,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                  ),
                ),
        ),
      ),
    );
  }
}
