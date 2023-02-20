import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../services/services.dart';
import '../../util/common.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class ExpertTodayAppointment extends StatefulWidget {
  static const pageId = "/ExpertTodayAppointment";

  const ExpertTodayAppointment({Key? key}) : super(key: key);
  @override
  State<ExpertTodayAppointment> createState() => _ExpertTodayAppointmentState();
}

class _ExpertTodayAppointmentState extends State<ExpertTodayAppointment>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: "Prescription"),
    const Tab(text: 'Notes'),
  ];
  TabController? tabController;
  // dynamic getExpertData;
  // final ExpertTodayAppoController controller = Get.find();
  final ExpertTodayAppoController controller = ExpertTodayAppoController();
  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    tabController = TabController(length: myTabs.length, vsync: this);
    tabController!.addListener(handleTabSelection);
    controller.getExpertData = Get.arguments;
    controller.getnotesByAppoId(
        int.parse(controller.getExpertData['appoDetail'].appointmentId ?? 0));
    controller.getPrescriByAppoId(
        int.parse(controller.getExpertData['appoDetail'].appointmentId ?? 0));
    super.initState();
  }

  handleTabSelection() {
    if (tabController!.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpertLayout(
        text: "Appointment",
        leadingIcon: Icons.arrow_back,
        onDrawerClick: () {
          Get.back();
        },
        body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        // height: 50,
                        decoration: const BoxDecoration(
                          color: ColorsConfig.colorGreyy,
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 12),
                        child: Row(
                          children: [
                            Text(
                              'Search',
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 15.0,
                                color: ColorsConfig.colorWhite.withOpacity(0.8),
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.search,
                              color: ColorsConfig.colorWhite,
                            ),
                          ],
                        )
                        /*TextField(
                            style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontSize: 15.0,
                              color: ColorsConfig.colorBlue.withOpacity(0.8),
                            ),
                            onChanged: (_) {},
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              fillColor: ColorsConfig.colorWhite,
                              filled: true,
                              suffixIcon: const Icon(
                                Icons.search,
                                color: ColorsConfig.colorBlue,
                              ),
                              hintText: 'Search something ...',
                              hintStyle: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 15.0,
                                color: ColorsConfig.colorBlue.withOpacity(0.8),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none),
                            ))*/

                        ),
                    const SizedBox(
                      height: 10,
                    ),
                    Material(
                      elevation: 3,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Container(
                        width: Get.width * 0.5,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          color: ColorsConfig.colorGrey.withOpacity(0.5),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Case No: ${controller.getExpertData['appoDetail']?.caseNo ?? ''}',
                          style: TextStyle(
                              fontFamily: AppTextStyle.microsoftJhengHei,
                              fontSize: 14.0,
                              color: ColorsConfig.colorGreyy,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => controller.displayPrescriptionDialog(
                              context,
                              int.parse(controller.getExpertData['appoDetail']
                                      ?.appointmentId ??
                                  ''),
                              controller
                                      .getExpertData['appoDetail']?.patientId ??
                                  ''),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: ColorsConfig.colorBlue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 11),
                            child: Text(
                              "Add Prescription",
                              style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 15.0,
                                  color: ColorsConfig.colorWhite,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => controller.displayDialog(
                              context,
                              int.parse(controller.getExpertData['appoDetail']
                                      ?.appointmentId ??
                                  ''),
                              controller
                                      .getExpertData['appoDetail']?.patientId ??
                                  ''),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: ColorsConfig.colorBlue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 11),
                            child: Text(
                              "Add Note",
                              style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 15.0,
                                  color: ColorsConfig.colorWhite,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    /*   Container(
                  decoration: const BoxDecoration(
                    color: ColorsConfig.colorBlue,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
                  child: Text(
                    "Today's Appointment",
                    style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 15.0,
                        color: ColorsConfig.colorWhite,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ), */
                    ListView.builder(
                        itemCount: 1,
                        primary: false,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, index) {
                          return appointmentContainer(
                              controller.getExpertData['appoDetail']
                                      .patientName ??
                                  '',
                              controller.getExpertData['appoDetail']
                                      .appointmentDate ??
                                  '',
                              controller.getExpertData['appoDetail'].caseNo ??
                                  '',
                              controller
                                      .getExpertData['appoDetail'].audioVideo ??
                                  '',
                              controller.getExpertData['appoDetail'].type ?? '',
                              () => controller.startMeetByDr(
                                  context,
                                  controller.getExpertData['appoDetail']
                                          .meetingId ??
                                      ''));
                          /*  Get.toNamed(CallScreen.pageId, arguments: {
                                    'meetDetail':
                                        controller.getExpertData['appoDetail'],
                                  })); */
                        })),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: TabBar(
                          controller: tabController,
                          isScrollable: false,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              25.0,
                            ),
                            color: ColorsConfig.colorBlue,
                          ),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          tabs: myTabs),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                        child: [
                      controller.isPrescLoading.value
                          ? const MyndroLoader()
                          : ListView.separated(
                              reverse: true,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.prescByAppoId.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  height: 25,
                                );
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return prescriptionContainer(
                                  controller.prescByAppoId[index].medicineName,
                                  controller.prescByAppoId[index].frequency,
                                  () {
                                    Get.toNamed(WebViewScreen.pageId,
                                        arguments: {
                                          'meetDetail': controller
                                                  .prescByAppoId.isNotEmpty
                                              ? '${Apis.webViewUrl}${controller.prescByAppoId[index].attachment}'
                                              : null,
                                        });
                                  },
                                );
                              }),
                      controller.isLoading.value
                          ? const MyndroLoader()
                          : ListView.separated(
                              reverse: true,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.notesByAppoId.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  height: 35,
                                );
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return ExpertNotesWidget(
                                  date: Common.formatLockerDate(controller
                                          .notesByAppoId[index].createdDate ??
                                      ''),
                                  title: controller.getExpertData['appoDetail']
                                          .doctorName ??
                                      '',
                                  subject: controller
                                          .notesByAppoId[index].notesDesc ??
                                      '',
                                  onShare: () => controller.shareExpertNote(
                                    controller.notesByAppoId[index]
                                            .appointmentNotesId ??
                                        '',
                                  ),
                                );
                              }),
                    ][tabController!.index])
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget prescriptionContainer(
      String medName, String medFreq, VoidCallback onAttachment) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: ColorsConfig.colorBlue,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    'Medicine Name',
                    style: TextStyle(
                        fontFamily: AppTextStyle.microsoftJhengHei,
                        fontSize: 15.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  medName,
                  style: TextStyle(
                      fontFamily: AppTextStyle.microsoftJhengHei,
                      fontSize: 18.0,
                      color: ColorsConfig.colorGreyy,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                medFreq.toLowerCase().contains('morning')
                    ? Text(
                        'Morning',
                        style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 18.0,
                            color: ColorsConfig.colorGreyy,
                            fontWeight: FontWeight.w800),
                      )
                    : Container(),
                medFreq.toLowerCase().contains('afternoon')
                    ? Text(
                        'Afternoon',
                        style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 18.0,
                            color: ColorsConfig.colorGreyy,
                            fontWeight: FontWeight.w800),
                      )
                    : Container(),
                medFreq.toLowerCase().contains('evening')
                    ? Text(
                        'Evening',
                        style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 18.0,
                            color: ColorsConfig.colorGreyy,
                            fontWeight: FontWeight.w800),
                      )
                    : Container(),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onAttachment,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,

                    border:
                        Border.all(color: ColorsConfig.colorBlue, width: 1.0),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(25.0)), // Set rounded corner radius
                    // Make rounded corner of border
                  ),
                  padding: const EdgeInsets.all(6),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Attachment',
                        style: TextStyle(
                            color: ColorsConfig.colorBlue,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.attach_file,
                        color: ColorsConfig.colorBlue,
                        size: 25,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appointmentContainer(String name, String date, String caseNo,
      String callType, String appoType, VoidCallback onClickCall) {
    return Card(
        elevation: 5,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(ImagePath.iconHuman)),
                          color: ColorsConfig.colorBlue,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50))),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        name,
                        style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 20.0,
                            color: ColorsConfig.colorGreyy,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        date,
                        style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 15.0,
                            color: ColorsConfig.colorBlue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: onClickCall,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                            color: ColorsConfig.colorBlue,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Icon(
                            callType == 'audio' ? Icons.phone : Icons.videocam,
                            color: ColorsConfig.colorWhite,
                            size: 25),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 20,
                      width: 45,
                    ),
                    Text(
                      'Case No.: $caseNo',
                      style: TextStyle(
                          fontFamily: AppTextStyle.microsoftJhengHei,
                          fontSize: 15.0,
                          color: ColorsConfig.colorGreyy,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 40,
                      width: 45,
                    ),
                    Expanded(
                      child: Text(
                        appoType,
                        style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 15.0,
                            color: ColorsConfig.colorBlue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    //////TODO ask confirmed or not confirmed param
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(
                        'Confirmed',
                        style: TextStyle(
                            fontFamily: AppTextStyle.microsoftJhengHei,
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            )));
  }
}
