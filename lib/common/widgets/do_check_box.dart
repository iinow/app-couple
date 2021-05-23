import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/state_manager.dart';

class DoCheckbox extends StatelessWidget {
  final Widget child;
  var value = false.obs;
  final String selectImage, unselectImage;
  final Function onChangeValue;

  DoCheckbox({
    Key key,
    @required this.child,
    this.value,
    this.selectImage,
    this.unselectImage,
    this.onChangeValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          value(!value.value);
          if (onChangeValue != null) {
            onChangeValue(value.value);
          }
        },
        child: Row(
          children: [
            Obx(() => value.isTrue
                ? SvgPicture.asset(
                    selectImage != null
                        ? selectImage
                        : "assets/svgs/sign_up/buttons_toggle_checkbox_btn_checkbox_selected.svg",
                  )
                : SvgPicture.asset(
                    unselectImage != null
                        ? unselectImage
                        : "assets/svgs/sign_up/buttons_toggle_checkbox_btn_checkbox_unselected.svg",
                  )),
            child == null ? Container() : child
          ],
        ),
      ),
    );
  }
}
