import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../widgets/widgets.dart';

class MyndroDocumentScreen extends GetView<MyndroLockerController> {
  static const pageId = "/MyndroDocumentScreen";

  const MyndroDocumentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.focusScope!.unfocus();
      },
      child: Scaffold(
        body: LayoutWidget(
            isAssessment: false,
            text: 'Myndro Locker',
            body: Container(
              margin: const EdgeInsets.fromLTRB(12, 15, 12, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Documents',
                    style: TextStyle(
                        color: ColorsConfig.colorGreyy,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: 5,
                      padding: const EdgeInsets.only(bottom: 25),
                      itemBuilder: (context, index) {
                        return docDesign('Report', '10/06/2022');
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

Widget docDesign(String text, String subText) {
  return Material(
    elevation: 8,
    borderRadius: const BorderRadius.all(
      Radius.circular(20),
    ),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        color: ColorsConfig.colorGreyy.withOpacity(0.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.file_copy,
            size: 55,
            color: ColorsConfig.colorGreyy,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: ColorsConfig.colorGreyy,
                  fontSize: 20,
                ),
              ),
              Text(
                subText,
                style: const TextStyle(
                  color: ColorsConfig.colorGreyy,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const DottedLine(
            dashLength: 8,
            dashGapLength: 6,
            lineThickness: 6,
            dashRadius: 50,
            dashColor: ColorsConfig.colorGreyy,
            // dashGapColor: Colors.red,
            direction: Axis.vertical,
            lineLength: 40,
          ),
        ],
      ),
    ),
  );
}
