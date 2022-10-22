import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myndro/screens/screens.dart';

class ExpertProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final TextEditingController titleController = TextEditingController();
  final List<Tab> myTabs = <Tab>[
    const Tab(text: "Info"),
    const Tab(text: 'Feedback'),
    const Tab(text: 'Docspace'),
    const Tab(text: 'Ask Anything'),
  ];
  TabController? tabController;
  bool isFromEdit = true;

  @override
  void onClose() {
    tabController!.dispose();
    super.onClose();
  }

  RxList<String> selected = <String>[].obs;

  @override
  void onInit() {
    tabController = TabController(length: myTabs.length, vsync: this);
    tabController!.addListener(handleTabSelection);
    super.onInit();
  }

  handleTabSelection() {
    if (tabController!.indexIsChanging) {
      update();
    }
  }

  showPopupMenu(BuildContext context, Offset offset) {
    double left = offset.dx;
    double top = offset.dy;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, 0, 0),
      items: [
        const PopupMenuItem<String>(
          value: '1',
          child: Text('Mandatory'),
        ),
        const PopupMenuItem<String>(
          value: '2',
          child: Text('Non Mandatory'),
        ),
      ],
      elevation: 8.0,
    ).then<void>((String? itemSelected) {
      if (itemSelected == null) return;

      if (itemSelected == "1") {
        Get.toNamed(ExpertRegistrationForm.pageId, arguments: {
          'is_edit': isFromEdit,
        });
      } else if (itemSelected == "2") {
        Get.toNamed(ExpertProfileNonMandatory.pageId);
      } else {
        //code here
      }
    });
  }
}
