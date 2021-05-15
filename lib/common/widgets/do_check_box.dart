import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoCheckbox extends StatefulWidget {
  final Widget child;
  bool value = false;
  final String selectImage, unselectImage;
  DoCheckbox({
    Key key,
    @required this.child,
    this.value,
    this.selectImage,
    this.unselectImage,
  }) : super(key: key);

  @override
  _DoCheckboxState createState() => _DoCheckboxState();
}

class _DoCheckboxState extends State<DoCheckbox> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          setState(() {
            value = !value;
            widget.value = value;
          });
        },
        child: Row(
          children: [
            value
                ? SvgPicture.asset(
                    widget.selectImage != null
                        ? widget.selectImage
                        : "assets/svgs/sign_up/buttons_toggle_checkbox_btn_checkbox_selected.svg",
                  )
                : SvgPicture.asset(
                    widget.unselectImage != null
                        ? widget.unselectImage
                        : "assets/svgs/sign_up/buttons_toggle_checkbox_btn_checkbox_unselected.svg",
                  ),
            widget.child == null ? Container() : widget.child
          ],
        ),
      ),
    );
  }
}
