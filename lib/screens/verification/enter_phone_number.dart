import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/screens/screens.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';

class EnterPhoneNumber extends GetView<PhoneNumberController> {
  static const pageId = "/EnterPhoneNumber";

   EnterPhoneNumber({Key? key}) : super(key: key);
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: ColorsConfig.colorBlue,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_outlined),
            onPressed: () {},
          ),
        ),
        body: GestureDetector(
          onTap: () {
            Get.focusScope!.unfocus();
          },
          child: SafeArea(
            child: Column(
              children: [
                ClipPath(
                  clipper: CurvedBottomClipper(),
                  child: Container(
                    color: ColorsConfig.colorBlue,
                    height: Get.height*0.48,
                    width: Get.width,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Enter Your phone Number', style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 25.0,
                          color: ColorsConfig.colorWhite,
                        ),),
                        const SizedBox(height: 10,),
                        Text('We will send you 6 digit verification code', style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 15.0,
                          color: ColorsConfig.colorWhite,
                        ),),
                        const SizedBox(height: 38,),
                        Image.asset(ImagePath.humanPhone,height: 190,width: 240,),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [

                      TextFormField(
                        style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400,
                          color: ColorsConfig.colorBlue,
                        ),
                        controller: phoneController,
                        keyboardType:  TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                          hintText: 'Your Phone number',
                          hintStyle:  TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 13.0,
                            color: ColorsConfig.colorBlue,
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: ColorsConfig.colorBlack),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color:ColorsConfig.colorBlue),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed(VerificationCodeScreen.pageId);
                        },
                          child: loginButtonWidget('Submit',)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
