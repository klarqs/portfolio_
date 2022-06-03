import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'kola.dev',
      theme: ThemeData.dark(),
      home: HomeView());
  }
}

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final HomeViewController controller = Get.put(HomeViewController());

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Obx(
      () => Scaffold(
        body: SizedBox.expand(
          child: Stack(
            children: [
              Positioned.fill(
                child: IgnorePointer(
                  child: Image.network(
                    controller.backgroundImage.value,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    opacity: const AlwaysStoppedAnimation(.35)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * .045,
                  vertical: screenSize.height * .124,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FadeIn(
                          child: Text(
                            controller.name.value,
                            style: GoogleFonts.comforterBrush(
                              fontSize: screenSize.width < 700
                                  ? screenSize.width * .04
                                  : screenSize.width < 1300
                                      ? screenSize.width * .032
                                      : screenSize.width * .024,
                              fontWeight: FontWeight.w100,
                              letterSpacing: .2,
                              color: Colors.orange.shade100,
                              height: screenSize.width * .00024,
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: screenSize.width * .04,
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(12),
                              radius: 50,
                              splashColor: Colors.transparent,
                              onTap: controller._launchTwitter,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  controller.contact.value,
                                  style: GoogleFonts.dmSans(
                                    fontSize: screenSize.width < 700
                                        ? screenSize.width * .028
                                        : screenSize.width < 1300
                                            ? screenSize.width * .016
                                            : screenSize.width * .01,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: .2,
                                    height: 1.25,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenSize.width * .04,
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(12),
                              radius: 50,
                              splashColor: Colors.transparent,
                              onTap: controller._launchResume,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  controller.resume.value,
                                  style: GoogleFonts.dmSans(
                                    fontSize: screenSize.width < 700
                                        ? screenSize.width * .028
                                        : screenSize.width < 1300
                                            ? screenSize.width * .016
                                            : screenSize.width * .01,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: .2,
                                    height: 1.25,
                                  ),
                                ),
                              ),
                            ),
                           
                            // SizedBox(
                            //   width: screenSize.width * .04,
                            // ),
                            // InkWell(
                            //   borderRadius: BorderRadius.circular(12),
                            //   radius: 50,
                            //   // onTap: controller._launchResume,
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(8.0),
                            //     child: SvgPicture.asset(
                            //       'assets/svgs/moon.svg',
                            //       color: Colors.white,
                            //       height: 28,
                            //     ),
                            //   ),
                            // ),
                            
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: FadeIn(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'This is me. A Product-oriented ',
                                    style: GoogleFonts.dmSans(
                                      fontSize: screenSize.width < 700
                                          ? screenSize.width * .052
                                          : screenSize.width < 1300
                                              ? screenSize.width * .040
                                              : screenSize.width * .034,
                                      color: Colors.white54,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .2,
                                      height: 1.2,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Mobile Engineer ',
                                    style: GoogleFonts.dmSans(
                                      fontSize: screenSize.width < 700
                                          ? screenSize.width * .052
                                          : screenSize.width < 1300
                                              ? screenSize.width * .040
                                              : screenSize.width * .035,
                                      color: Colors.white.withOpacity(.8),
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .2,
                                      height: 1.2,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'with 4+ years of experience working in a variety of ',
                                    style: GoogleFonts.dmSans(
                                      fontSize: screenSize.width < 700
                                          ? screenSize.width * .052
                                          : screenSize.width < 1300
                                              ? screenSize.width * .040
                                              : screenSize.width * .035,
                                      color: Colors.white54,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .2,
                                      height: 1.2,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'fast-paced, dynamic, and adaptable settings.',
                                    style: GoogleFonts.dmSans(
                                      fontSize: screenSize.width < 700
                                          ? screenSize.width * .052
                                          : screenSize.width < 1300
                                              ? screenSize.width * .040
                                              : screenSize.width * .035,
                                      color: Colors.white.withOpacity(.8),
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: .2,
                                      height: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: screenSize.width < 700
                              ? 0
                              : screenSize.width < 1300
                                  ? 1
                                  : 2,
                          child: const SizedBox(),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white.withOpacity(.04),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                radius: 50,
                                splashColor: Colors.transparent,
                                onTap: controller._launchGithub,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    controller.githubAsset.value,
                                    color: Colors.white60,
                                    width: screenSize.width < 700
                                        ? screenSize.width * .036
                                        : screenSize.width < 1300
                                            ? screenSize.width * .024
                                            : screenSize.width * .018,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenSize.width < 700
                                  ? screenSize.width * .036
                                  : screenSize.width < 1300
                                      ? screenSize.width * .024
                                      : screenSize.width * .018,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white.withOpacity(.04),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                radius: 50,
                                splashColor: Colors.transparent,
                                onTap: controller._launchDribbble,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    controller.dribbbleAsset.value,
                                    color: Colors.white60,
                                    width: screenSize.width < 700
                                        ? screenSize.width * .036
                                        : screenSize.width < 1300
                                            ? screenSize.width * .024
                                            : screenSize.width * .018,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenSize.width < 700
                                  ? screenSize.width * .036
                                  : screenSize.width < 1300
                                      ? screenSize.width * .024
                                      : screenSize.width * .018,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white.withOpacity(.04),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                radius: 50,
                                splashColor: Colors.transparent,
                                onTap: controller._launchTwitter,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    controller.twitterAsset.value,
                                    color: Colors.white60,
                                    width: screenSize.width < 700
                                        ? screenSize.width * .036
                                        : screenSize.width < 1300
                                            ? screenSize.width * .024
                                            : screenSize.width * .018,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenSize.width < 700
                                  ? screenSize.width * .036
                                  : screenSize.width < 1300
                                      ? screenSize.width * .024
                                      : screenSize.width * .018,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white.withOpacity(.04),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                radius: 50,
                                splashColor: Colors.transparent,
                                onTap: controller._launchLinkedin,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    controller.linkedinAsset.value,
                                    color: Colors.white60,
                                    width: screenSize.width < 700
                                        ? screenSize.width * .036
                                        : screenSize.width < 1300
                                            ? screenSize.width * .024
                                            : screenSize.width * .018,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenSize.height * .02),
                        Text(
                          '© 2022 Fluttering Around, Inc.',
                          style: GoogleFonts.dmSans(
                            fontSize: screenSize.width < 700
                                ? screenSize.width * .018
                                : screenSize.width < 1300
                                    ? screenSize.width * .012
                                    : screenSize.width * .0092,
                            fontWeight: FontWeight.w300,
                            letterSpacing: .2,
                            color: Colors.white30,
                            height: 1.1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeViewController extends GetxController {
  final Uri _twitter = Uri.parse('https://twitter.com/kola_rt');
  final Uri _github = Uri.parse('https://github.com/kola-rt');
  final Uri _dribbble = Uri.parse('https://dribbble.com/klart');
  final Uri _linkedin = Uri.parse('https://www.linkedin.com/in/paul-kolawole/');
  final Uri _resume = Uri.parse(
      'https://docs.google.com/document/d/1LVMIu2WNwUHETXiQuMtjg0pW9EwV7Ot2C56gWCYquu4/edit#heading=h.ejmc0qsd9rzw');

  final RxString backgroundImage =
      'https://images.unsplash.com/photo-1542507815265-3e0105099f95?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1283&q=80'
          .obs;
  final RxString name = 'Kolawole Oluwafemi.'.obs;
  final RxString content =
      'This is me. A Product-oriented Mobile Engineer with 4+ years of experience working in a variety of fast-paced, dynamic, and ever-changing settings.'
          .obs;

  final RxString githubAsset = 'assets/svgs/github.svg'.obs,
      linkedinAsset = 'assets/svgs/linkedin.svg'.obs,
      dribbbleAsset = 'assets/svgs/dribbble.svg'.obs,
      twitterAsset = 'assets/svgs/twitter.svg'.obs;

  final RxString contact = 'Contact Me'.obs, resume = 'Resume'.obs;

  void _launchTwitter() async {
    if (!await launchUrl(_twitter)) throw 'Could not launch $_twitter';
  }

  void _launchGithub() async {
    if (!await launchUrl(_github)) throw 'Could not launch $_github';
  }

  void _launchDribbble() async {
    if (!await launchUrl(_dribbble)) throw 'Could not launch $_dribbble';
  }

  void _launchLinkedin() async {
    if (!await launchUrl(_linkedin)) throw 'Could not launch $_linkedin';
  }

  void _launchResume() async {
    if (!await launchUrl(_resume)) throw 'Could not launch $_resume';
  }
}
