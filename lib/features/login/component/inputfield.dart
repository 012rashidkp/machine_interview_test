
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/constant/constant.dart';
import '../../shared/resources/color.dart';

class Inpufield extends StatefulWidget {
  final String? hintvalue;
  final String? textvalue;
  final TextInputType? textInputType;
  final bool? isreadonly;
  final bool? ispassword;
  final IconData? icon;
  final Function(String?)?onchange;
  const Inpufield({
    this.hintvalue,
    this.textvalue,
    this.textInputType,
    this.isreadonly,
    this.icon,
    this.onchange,
    this.ispassword
  });

  @override
  State<Inpufield> createState() => _InpufieldState();
}

class _InpufieldState extends State<Inpufield> {
  late TextEditingController editingController;
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    editingController = TextEditingController();
    editingController.addListener(_handleTextChange);
  }

  void _handleTextChange() {


    // Add any specific actions you want to perform when text changes
  } @override
  void dispose() {
    editingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final mheight=MediaQuery.of(context).size.height;
    return  Container(
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        textAlign: TextAlign.justify,
        readOnly: widget.isreadonly ?? false,
        style:  const TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black,
            fontSize: 17
        ),
        controller: editingController,
        obscureText: widget.ispassword ?? false,
        keyboardType:widget.textInputType,
        autofocus: false,
        focusNode: _focusNode,
        onChanged: (value){
          widget.onchange!(value);

        },
        decoration:  InputDecoration(
          border: OutlineInputBorder(
            borderSide:   BorderSide(
                color:inputbodycolor,
                width: borderwidth
            ),
            borderRadius: BorderRadius.circular(8.0),


          ),
          enabledBorder:    OutlineInputBorder(
            borderSide:   BorderSide(
                color:inputbodycolor,
                width: borderwidth
            ),
            borderRadius: BorderRadius.circular(8.0),

          ),

          filled: true,
          fillColor:  inputbodycolor,
          hintText:widget.hintvalue,
          focusedBorder:OutlineInputBorder(
            borderSide:   BorderSide(
                color:inputbodycolor,
                width: borderwidth
            ),
            borderRadius: BorderRadius.circular(10.0),

          ),
          hintStyle:   TextStyle(
            color:  Colors.black.withOpacity(0.3),
            fontSize: 17,

          ),
          suffixIconConstraints: const BoxConstraints(
              minHeight: 26,
              minWidth: 26
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
                widget.icon,
               color: tealcolor,
            )
          ),
          focusColor: inputbodycolor,

          contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),



        ),
      ),
    );
  }
}
