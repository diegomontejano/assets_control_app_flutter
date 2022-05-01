import 'package:flutter/material.dart';
import 'custom_design.dart';

class CustomTextField extends StatelessWidget {
  // attributes
  final String title;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final bool editMode;
  final bool? disableEditMode;
  final int minLengthValidator;
  final int maxLength;
  final bool autofocus;

  // constructor
  const CustomTextField({
    required this.title,
    required this.controller,
    required this.onChanged,
    this.editMode = false,
    this.disableEditMode,
    required this.minLengthValidator,
    this.maxLength = 28,
    this.autofocus = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 8),
      child: Column(
        children: [
          // title
          Container(
            margin: const EdgeInsets.only(bottom: 6),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                title, // title attribute
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: controller.text.length <
                          minLengthValidator // minLengthValidator attribute
                      ? CustomDesign.errorColor
                      : CustomDesign.secondaryColor5,
                ),
              ),
            ),
          ),
          // textfield
          SizedBox(
            height: 40,
            child: TextField(
              controller: controller, // controller attribute
              onChanged: onChanged, // onChanged attribute
              readOnly: disableEditMode ??
                  !editMode, // disableEditMode + !editMode attributes
              maxLength: maxLength, // maxLength attribute
              autofocus: autofocus, // autofocus attribute
              maxLines: 1,
              cursorColor: CustomDesign.secondaryColor5,
              style: TextStyle(
                fontSize: 15,
                color: controller.text.length <
                        minLengthValidator // minLengthValidator attribute
                    ? CustomDesign.errorColor
                    : CustomDesign.secondaryColor5,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                counter: const Offstage(),
                filled: true,
                fillColor: disableEditMode == true ||
                        !editMode // disableEditMode + !editMode attributes
                    ? CustomDesign.secondaryColor3
                    : CustomDesign.secondaryColor1,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 2,
                    color: controller.text.length <
                            minLengthValidator // minLengthValidator attribute
                        ? CustomDesign.errorColor
                        : Colors.transparent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 2,
                    color: controller.text.length <
                            minLengthValidator // minLengthValidator attribute
                        ? CustomDesign.errorColor
                        : Colors.transparent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 2,
                    color: controller.text.length <
                            minLengthValidator // minLengthValidator attribute
                        ? CustomDesign.errorColor
                        : Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
