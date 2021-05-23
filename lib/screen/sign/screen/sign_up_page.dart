import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:artemis/artemis.dart';
import 'package:doing_app/common/constants/environment_config.dart';
import 'package:doing_app/common/widgets/do_check_box.dart';
import 'package:doing_app/common/widgets/hex_color.dart';
import 'package:doing_app/graphql/generated/doing.query.dart';
import 'package:doing_app/screen/sign/screen/sign_up_succes.dart';
import 'package:doing_app/store/sign_up_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = Get.put(SignUpController());
    return Scaffold(
      backgroundColor: HexColor.fromHex("#f7f7f8"),
      body: Container(
        child: SingleChildScrollView(
          child: main(context, signUpController),
        ),
      ),
    );
  }

  Widget main(
    BuildContext context,
    SignUpController signUpController,
  ) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: ScreenUtil().setWidth(312),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            formProfileImage(),
            formDuplicateUserNickName(signUpController),
            line(
              context,
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(24)),
              color: HexColor.fromHex("#eeeeee"),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(24),
            ),
            formAgree(context, signUpController),
            SizedBox(
              height: ScreenUtil().setHeight(44),
            ),
            btnRegistration(onTap: () async {
              if (Get.find<SignUpController>().checkNickName.isFalse) {
                await showOkAlertDialog(
                  context: context,
                  title: '실패',
                  message: '닉네임 중복 확인 버튼을 눌러주세요.',
                  barrierDismissible: true,
                );
                return;
              }
              if (Get.find<SignUpController>().isRequiredCheck().isFalse) {
                await showOkAlertDialog(
                  context: context,
                  title: '실패',
                  message: '필수 동의 확인해주세요.',
                  barrierDismissible: true,
                );
                return;
              }
              print("성공");
            }),
            SizedBox(
              height: ScreenUtil().setHeight(40),
            ),
          ],
        ),
      ),
    );
  }

  Widget formProfileImage() {
    return Container(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(133),
        bottom: ScreenUtil().setHeight(47),
      ),
      child: LayoutBuilder(
        builder: (context, contraints) {
          return Center(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  width: ScreenUtil().setWidth(80),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor.fromHex("#19000000"),
                        spreadRadius: 0,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      )
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Obx(
                    () => Get.find<SignUpController>().imagePath.isNotEmpty
                        ? Image.file(
                            File(Get.find<SignUpController>().imagePath.value),
                            height: ScreenUtil().setHeight(80),
                            width: ScreenUtil().setWidth(80),
                          )
                        : SvgPicture.asset(
                            "assets/svgs/sign_up/img_profile_large_default.svg",
                            height: ScreenUtil().setHeight(80),
                            width: ScreenUtil().setWidth(80),
                          ),
                  ),
                ),
                Positioned(
                  right: ScreenUtil().setWidth(-30),
                  bottom: ScreenUtil().setWidth(-40),
                  child: InkWell(
                    onTap: () async {
                      var image = await ImagePicker()
                          .getImage(source: ImageSource.gallery);
                      if (image == null) {
                        return;
                      }
                      Get.find<SignUpController>().imagePath(image.path);
                    },
                    child: Container(
                      child: Image.asset(
                        "assets/images/ico_camera.png",
                        height: ScreenUtil().setHeight(80),
                        width: ScreenUtil().setWidth(80),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget formDuplicateUserNickName(SignUpController controller) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: ScreenUtil().setHeight(24),
            child: Text(
              "사용자 닉네임",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                color: HexColor.fromHex("#242424"),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(7),
          ),
          inputDuplicateNickName(controller),
        ],
      ),
    );
  }

  Widget btnRegistration({Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: HexColor.fromHex("#2cff3c3c"),
              offset: Offset(0, ScreenUtil().setHeight(16)),
              blurRadius: 15,
              spreadRadius: 5,
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [HexColor.fromHex("#ff4f4f"), HexColor.fromHex("#ff2f2f")],
          ),
        ),
        height: ScreenUtil().setHeight(64),
        child: Center(
          child: Text(
            "가입완료",
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil().setSp(16),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget formAgree(BuildContext context, SignUpController controller) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(16),
              bottom: ScreenUtil().setHeight(16),
            ),
            child: Obx(
              () => DoCheckbox(
                value: controller.checkAll(),
                onChangeValue: (bool value) {
                  controller.handleCheckAll();
                },
                child: Container(
                  margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(8),
                  ),
                  child: Text(
                    "모두 동의하기",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: HexColor.fromHex("#242424"),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          line(
            context,
            color: HexColor.fromHex("#222222"),
            margin: EdgeInsets.only(
              bottom: ScreenUtil().setHeight(8),
            ),
          ),
          agreeContentItem(
            value: controller.checkAge,
            title: "[필수] 만 14세 이상입니다.",
          ),
          agreeContentItem(
            value: controller.checkTermsAndConditions,
            title: "[필수] 이용약관 동의",
          ),
          agreeContentItem(
              value: controller.checkCollectPersonalInformation,
              title: "[필수] 개인정보수집 및 이용 동의"),
          agreeContentItem(
            value: controller.checkMarketingUtilization,
            title: "[선택] 마케팅 이용 수신 동의",
          ),
        ],
      ),
    );
  }

  Widget agreeContentItem({RxBool value, String title, String link}) {
    return Container(
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(10),
        bottom: ScreenUtil().setHeight(10),
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DoCheckbox(
              value: value,
              selectImage:
                  "assets/svgs/sign_up/buttons_toggle_check_btn_check_selected.svg",
              unselectImage:
                  "assets/svgs/sign_up/buttons_toggle_check_btn_check_unselected.svg",
              child: Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(8)),
                child: Text(
                  title,
                  style: TextStyle(
                    color: HexColor.fromHex("#666666"),
                    fontSize: ScreenUtil().setSp(14),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  print("클릭");
                },
                child: Text(
                  "보기",
                  style: TextStyle(
                    color: HexColor.fromHex("#666666"),
                    decoration: TextDecoration.underline,
                    fontSize: ScreenUtil().setSp(14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget line(BuildContext context, {Color color, EdgeInsetsGeometry margin}) {
    return Container(
      child: Center(
        child: Container(
          margin: margin,
          width: MediaQuery.of(context).size.width * 1,
          color: color,
          height: 1,
        ),
      ),
    );
  }

  Widget inputDuplicateNickName(SignUpController controller) {
    return Container(
      height: ScreenUtil().setHeight(48),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: ScreenUtil().setHeight(34),
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(24),
              ),
              child: TextFormField(
                onChanged: controller.handleNickName,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  border: InputBorder.none,
                  hintText: "2자 ~ 10자로 입력해주세요.",
                  hintStyle: TextStyle(
                    color: HexColor.fromHex("#bbbbbb"),
                    fontSize: ScreenUtil().setSp(14),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  child: Obx(
                    () => controller.checkNickName.isTrue
                        ? SvgPicture.asset(
                            "assets/svgs/sign_up/buttons_toggle_check_btn_check_selected.svg",
                          )
                        : Container(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(ScreenUtil().setHeight(8)),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: HexColor.fromHex("#110f24"),
                      ),
                      padding: EdgeInsets.only(
                          top: ScreenUtil().setHeight(6),
                          left: ScreenUtil().setWidth(7),
                          bottom: ScreenUtil().setHeight(6),
                          right: ScreenUtil().setWidth(7)),
                    ),
                    onPressed: () async {
                      if (controller.nickName.value.isEmpty) {
                        controller.checkNickName(false);
                        return;
                      }
                      var client = ArtemisClient(EnvironmentConfig.url);
                      final res = await client.execute(
                        ExistNickNameQuery(
                          variables: ExistNickNameArguments(
                            existNickNameInput: ExistNickNameInput(
                              nickName: controller.nickName.value,
                            ),
                          ),
                        ),
                      );
                      controller.checkNickName(!res.data.existNickName.exist);
                    },
                    child: Text(
                      "중복확인",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                        color: HexColor.fromHex("#110f24"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
