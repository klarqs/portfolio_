import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lots_/app/modules/login/controllers/login_controller.dart';
import 'package:lots_/app/utils/colors.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final LoginController loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: CustomColors.primaryYellow,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  TextFormField(
                    controller: loginController.tagController,
                    onChanged: loginController.clearTagErrorText,
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: CustomColors.grayColor),
                    decoration: InputDecoration(
                      hintText: 'username',
                      hintStyle: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w400,
                        color: CustomColors.grayColor,
                      ),
                      errorText: loginController.tagErrorText.value.isEmpty
                          ? null
                          : loginController.tagErrorText.value,
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.5),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                            color: CustomColors.redColor, width: 1.5),
                      ),
                      errorStyle:
                          GoogleFonts.dmSans(fontWeight: FontWeight.w400),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: loginController.passwordController,
                    onChanged: loginController.clearPasswordErrorText,
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: CustomColors.grayColor),
                    decoration: InputDecoration(
                      hintText: 'password',
                      errorText: loginController.passwordErrorText.value.isEmpty
                          ? null
                          : loginController.passwordErrorText.value,
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.5),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                            color: CustomColors.redColor, width: 1.5),
                      ),
                      hintStyle: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w400,
                        color: CustomColors.grayColor,
                      ),
                      errorStyle:
                          GoogleFonts.dmSans(fontWeight: FontWeight.w400),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: Get.width,
                    height: 58,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shadowColor: Colors.white,
                        onPrimary: Colors.white,
                        onSurface: Colors.white,
                        elevation: 0,
                        // splashFactory: NoSplash.splashFactory,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: CustomColors.redColor.withOpacity(.5),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        loginController.validateTextForm(context);
                        if (loginController.isLoading.value != false) {
                          loginController.isLoading.value = true;
                        } else {
                          loginController.isLoading.value = false;
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              loginController.isLoading.value
                                  ? "Loading..."
                                  : 'Go to Dashboard',
                              style: const TextStyle(
                                color: CustomColors.grayColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          loginController.isLoading.value
                              ? Container(
                                  margin: const EdgeInsets.only(left: 12),
                                  height: 20,
                                  width: 20,
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 1,
                                    valueColor: AlwaysStoppedAnimation(
                                      CustomColors.grayColor,
                                    ),
                                  ),
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
