import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../util/common.dart';
import '../../widgets/widgets.dart';

class CreatePasswordScreen extends StatefulWidget {
  static const pageId = "/NewPasswordScreen";
  const CreatePasswordScreen({Key? key}) : super(key: key);

  @override
  _CreatePasswordScreenState createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  bool _passwordVisible = false;
  bool _value = true;
  final TextEditingController passController = TextEditingController();
  final TextEditingController conPassController = TextEditingController();


  String? validateConfirmPassword(String? value) {
    if (value!.trim() != passController.text.trim()) {
      return 'Password Mismatch !!!';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsConfig.colorWhite,
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          child: GestureDetector(
            onTap: () {
              Get.focusScope!.unfocus();
            },
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: Image.asset(
                    ImagePath.topCurved,
                    width: Get.width ,
                    height: Get.height*0.27,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 16,
                  child:IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: ColorsConfig.colorWhite,
                    ),
                    onPressed: () {},
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: Get.width*0.15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text('Create Your New Password',
                                style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 13.0,
                                  color: ColorsConfig.colorBlue,
                                )),
                          ),
                          const SizedBox(height: 25,),
                          TextFormField(
                            style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                              color: ColorsConfig.colorBlue,
                            ),
                            controller: passController,
                            obscureText: true,
                            validator: Common.validatePassword,
                            keyboardType:  TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.fromLTRB(16,16,0,16),
                              suffixIcon: IconButton(
                                icon: Icon(_passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,color: ColorsConfig.colorBlue,size: 23), onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              ),
                              hintText: 'New Password',
                              hintStyle:  TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 13.0,
                                color: ColorsConfig.colorBlue,
                              ),
                              filled: true,
                              fillColor: ColorsConfig.colorWhite,
                              focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: const BorderSide(color: ColorsConfig.colorBlue),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: const BorderSide(
                                  color: ColorsConfig.colorBlue,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30,),
                          TextFormField(
                            style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                              color: ColorsConfig.colorBlue,
                            ),
                            controller: passController,
                            obscureText: true,
                            validator: Common.validatePassword,
                            keyboardType:  TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.fromLTRB(16,16,0,16),
                              suffixIcon: IconButton(
                                icon: Icon(_passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,color: ColorsConfig.colorBlue,size: 23), onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              ),
                              hintText: 'Confirm Password',
                              hintStyle:  TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 13.0,
                                color: ColorsConfig.colorBlue,
                              ),
                              filled: true,
                              fillColor: ColorsConfig.colorWhite,
                              focusedBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: const BorderSide(color: ColorsConfig.colorBlue),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: const BorderSide(
                                  color: ColorsConfig.colorBlue,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height :25,),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 8,
                            child: Checkbox(
                              value: _value,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  _value = newValue!;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Text('I have Read and agree to ',  style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 13.0,
                            color: ColorsConfig.colorBlack,
                          )),
                          Text('the Term & Conditions',  style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 13.0,
                            color: ColorsConfig.colorBlue,
                          )),

                        ],
                      ),
                    ),
                    const SizedBox(height :25,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45),
                      child: loginButtonWidget('Reset Password',),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    ImagePath.designCuttedImg,
                    width: Get.width * 0.75,
                    height: 180,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
