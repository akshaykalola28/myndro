import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class SearchScreen extends StatefulWidget {
  static const pageId = "/SearchScreen";

  SearchScreen({Key? key, this.allTextList, this.selectedUserList})
      : super(key: key);
  final List<User>? allTextList;
  List<User>? selectedUserList;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
                  child: FilterListWidget<User>(
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
                          item.name,
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
                    listData: userList,
                    selectedListData: widget.selectedUserList,
                    onApplyButtonClick: (list) {
                      // Navigator.pop(context, list);
                      setState(() {
                        widget.selectedUserList = list;
                      });
                    },
                    choiceChipLabel: (item) {
                      return item!.name;
                    },
                    validateSelectedItem: (list, val) {
                      return list!.contains(val);
                    },
                    onItemSearch: (user, query) {
                      return user.name!
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
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ExpertProfileCard(
                          text: widget.selectedUserList![index].name!,
                          subText: 'pyshcologist',
                          exp: 10,
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
