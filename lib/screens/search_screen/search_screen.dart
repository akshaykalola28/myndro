import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/controller/controller.dart';

import '../../constant/constant.dart';
import '../../model/model.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class SearchScreen extends StatefulWidget {
  static const pageId = "/SearchScreen";

  SearchScreen({Key? key, this.allTextList, this.selectedUserList})
      : super(key: key);
  final List<DoctorcategoryList>? allTextList;
  late List<DoctorcategoryList>? selectedUserList;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  HomeController homeController = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutWidget(
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              Get.focusScope!.unfocus();
            },
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.5,
                  child: FilterListWidget<DoctorcategoryList>(
                    themeData: FilterListThemeData(context),
                    choiceChipBuilder: (context, item, isSelected) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: isSelected!
                              ? ColorsConfig.colorBlue
                              : ColorsConfig.colorGreyy,
                        ),
                        child: Text(
                          item.doctorName,
                          style: TextStyle(
                            color: isSelected
                                ? ColorsConfig.colorWhite
                                : ColorsConfig.colorWhite,
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    },
                    hideSelectedTextCount: true,
                    listData: widget.allTextList?.take(10).toList(),
                    selectedListData: widget.selectedUserList,
                    onApplyButtonClick: (list) {
                      // Navigator.pop(context, list);
                      setState(() {
                        widget.selectedUserList = list;
                      });
                    },
                    choiceChipLabel: (item) {
                      return item!.doctorName;
                    },
                    validateSelectedItem: (list, val) {
                      return list!.contains(val);
                    },
                    onItemSearch: (user, query) {
                      return user.doctorName!
                          .toLowerCase()
                          .contains(query.toLowerCase());
                    },
                  ),
                ),
                if (widget.selectedUserList == null ||
                    widget.selectedUserList!.isEmpty)
                  const Center(
                    child: Text('No data found'),
                  )
                else
                  //TODO check this...
                  Container(
                    margin: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ExpertProfileCard(
                          onAppointment:
                              () => /* Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExpertDetailScreen(
                                doctorDetail:
                                    widget.selectedUserList!.isNotEmpty
                                        ? widget.selectedUserList![index]
                                        : null,
                              ),
                            ),
                          ), */
                                  Get.toNamed(ExpertDetailScreen.pageId,
                                      arguments: {
                                'doctorDetail':
                                    widget.selectedUserList!.isNotEmpty
                                        ? widget.selectedUserList![index]
                                        : null,
                              }),
                          text:
                              widget.selectedUserList![index].doctorName ?? '',
                          subText: widget
                                  .selectedUserList![index].doctorProfession ??
                              '',
                          audioPrice: widget
                                  .selectedUserList![index].doctorAudioCharge ??
                              '',
                          videoPrice: widget
                                  .selectedUserList![index].doctorVideoCharge ??
                              '',
                          language:
                              widget.selectedUserList![index].doctorLanguage ??
                                  '',
                          onInstantConnect: () => homeController.displayDialog(
                              context,
                              widget.selectedUserList![index]
                                      .doctorVideoCharge ??
                                  '',
                              widget.selectedUserList![index]
                                      .doctorAudioCharge ??
                                  '',
                              widget.selectedUserList![index].doctorId ?? ''),
                        );
                      },
                      itemCount: widget.selectedUserList!.length,
                    ),
                  ),
              ],
            ),
          ),
        ),
        isAssessment: false,
        text: 'Search',
      ),
    );
  }
}
