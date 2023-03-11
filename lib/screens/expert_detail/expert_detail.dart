import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../util/events_temp.dart';
import '../../widgets/widgets.dart';

class ExpertDetailScreen extends StatefulWidget {
  static const pageId = "/ExpertDetailScreen";

  const ExpertDetailScreen({Key? key}) : super(key: key);

  @override
  State<ExpertDetailScreen> createState() => _ExpertDetailScreenState();
}

class _ExpertDetailScreenState extends State<ExpertDetailScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  ScrollController controller = ScrollController();
  late List<Widget> imgData =
      hosImg.map((item) => PackagesWidget(item: item)).toList();
  ExpertDetailController expertDetailController = ExpertDetailController();

  dynamic getExpertData;

  @override
  void initState() {
    super.initState();
    getExpertData = Get.arguments;

    expertDetailController.getDrSlotList(
        int.parse(getExpertData['doctorDetail']?.doctorId ?? ''),
        DateFormat('yyyy-MM-dd').format(DateTime.now()));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConfig.colorWhite,
      body: GestureDetector(
        onTap: () {
          Get.focusScope!.unfocus();
        },
        child: Obx(
          () => LayoutWidget(
            text: 'Appointment',
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ExpertDetailContainer(
                      doctorName: getExpertData['doctorDetail']?.doctorName,
                      doctorProfession:
                          getExpertData['doctorDetail']?.doctorProfession,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Card(
                      color: ColorsConfig.colorLightGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Column(
                          children: [
                            Text(
                              'Please Select & Book Appointment',
                              style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w800,
                                color: ColorsConfig.colorBlack,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  child: const Icon(Icons.videocam,
                                      size: 25, color: ColorsConfig.colorWhite),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorsConfig.colorBlue),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GroupButton(
                                  controller: GroupButtonController(
                                    selectedIndex: 0,
                                  ),
                                  options: GroupButtonOptions(
                                    selectedShadow: const [],
                                    unselectedShadow: const [],
                                    unselectedColor: Colors.transparent,
                                    selectedColor: ColorsConfig.colorBlue,
                                    unselectedTextStyle: const TextStyle(
                                      color: ColorsConfig.colorBlack,
                                    ),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  isRadio: true,
                                  onSelected: (val, i, selected) {
                                    if (i == 0) {
                                      expertDetailController
                                          .audioVideoString.value = 'video';
                                    } else {
                                      expertDetailController
                                          .audioVideoString.value = 'audio';
                                    }
                                  },
                                  buttons: [
                                    'Video call \n \u{20B9}${getExpertData['doctorDetail']?.doctorVideoCharge}',
                                    'Audio call \n \u{20B9}${getExpertData['doctorDetail']?.doctorAudioCharge}',
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  child: const Icon(Icons.phone_in_talk_rounded,
                                      size: 25, color: ColorsConfig.colorWhite),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorsConfig.colorBlue),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    SfCalendar(
                      view: CalendarView.month,
                      firstDayOfWeek: 1,
                      todayHighlightColor: ColorsConfig.colorBlue,
                      minDate: DateTime.now(),
                      onTap: (calendarTapDetails) {
                        print('calendarTapDetails ${calendarTapDetails.date}');

                        expertDetailController.getDrSlotList(
                            int.parse(
                                getExpertData['doctorDetail']?.doctorId ?? ''),
                            DateFormat('yyyy-MM-dd').format(
                                calendarTapDetails.date ?? DateTime.now()));
                        setState(() {});
                      },
                      selectionDecoration: BoxDecoration(
                        color: Colors.transparent,
                        border:
                            Border.all(color: ColorsConfig.colorBlue, width: 2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                        shape: BoxShape.rectangle,
                      ),
                      monthViewSettings: const MonthViewSettings(
                          appointmentDisplayMode:
                              MonthAppointmentDisplayMode.none),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Card(
                      color: ColorsConfig.colorLightGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 2,
                      child: Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Column(
                          children: [
                            Text(
                              'Appointment Request',
                              style: TextStyle(
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 15.0,
                                  color: ColorsConfig.colorBlack,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            expertDetailController.allDrSlots
                                    .map((e) => e.slots)
                                    .isEmpty
                                ? const Text('Slot Data Not Found..!')
                                : expertDetailController.isSlotLoading.value
                                    ? const Text('Slot Data Not Found..!')
                                    : GroupButton(
                                        buttons: expertDetailController
                                            .allDrSlots
                                            .map((e) => e.slots)
                                            .toList(),
                                        options: GroupButtonOptions(
                                          selectedShadow: const [],
                                          unselectedShadow: const [],
                                          unselectedColor:
                                              ColorsConfig.colorGrey,
                                          selectedColor: ColorsConfig.colorBlue,
                                          unselectedTextStyle: const TextStyle(
                                            color: ColorsConfig.colorGreyy,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        onSelected: (val, i, selected) {
                                          debugPrint(
                                              'Button: $val index: $i $selected');
                                          expertDetailController.expertSlot
                                              .value = val.toString();
                                          expertDetailController.expertSlotId
                                              .value = expertDetailController
                                                  .allDrSlots[i].doctorSlotId ??
                                              '';
                                        },
                                      ),
                            const SizedBox(
                              height: 12,
                            ),
                            expertDetailController.isPromo.value
                                ? loginTextFieldWidget(
                                    expertDetailController.promoController,
                                    false,
                                    (value) {},
                                    TextInputType.text,
                                    'Promo & Voucher Code',
                                    Icons.discount_rounded)
                                : Container(),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: (() {
                                    expertDetailController
                                                .dashboardController
                                                .walletAmount
                                                .value
                                                .isNotEmpty &&
                                            expertDetailController
                                                    .dashboardController
                                                    .walletAmount
                                                    .value !=
                                                '0' &&
                                            double.parse(expertDetailController.dashboardController.walletAmount.value) >=
                                                double.parse(getExpertData['doctorDetail']?.doctorAudioCharge ??
                                                    '0') &&
                                            double.parse(expertDetailController.dashboardController.walletAmount.value) >=
                                                double.parse(
                                                    getExpertData['doctorDetail']?.doctorVideoCharge ??
                                                        '0')
                                        ? //create
                                        expertDetailController.createAppoitment(
                                            expertDetailController.audioVideoString.value,
                                            DateFormat('dd-MM-yyyy').format(DateTime.now()),
                                            '${expertDetailController.expertSlot.value},${expertDetailController.expertSlotId.value}',
                                            getExpertData['doctorDetail']?.doctorCategoryId ?? '',
                                            getExpertData['doctorDetail']?.doctorSubcategoryIds ?? '',
                                            getExpertData['doctorDetail']?.doctorId ?? '')
                                        : expertDetailController.dashboardController.displayDialog(context);
                                  }),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    decoration: const BoxDecoration(
                                      color: ColorsConfig.colorBlue,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      'Book Appointment',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily:
                                            AppTextStyle.microsoftJhengHei,
                                        fontSize: 16.0,
                                        color: ColorsConfig.colorWhite,
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    expertDetailController.isPromo.value =
                                        !expertDetailController.isPromo.value;
                                  },
                                  child: Text('Apply Promocode',
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontFamily:
                                            AppTextStyle.microsoftJhengHei,
                                        // fontSize: 10.0,
                                        color: ColorsConfig.colorBlue,
                                      )),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Divider(
                        color: ColorsConfig.colorBlack, thickness: 0.5),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(children: [
                      CarouselSlider(
                        items: imgData,
                        carouselController: _controller,
                        options: CarouselOptions(
                            enableInfiniteScroll: false,
                            viewportFraction: 1,
                            autoPlay: false,
                            enlargeCenterPage: false,
                            // aspectRatio: 1.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: hosImg.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : ColorsConfig.colorBlue)
                                      .withOpacity(
                                          _current == entry.key ? 0.99 : 0.6)),
                            ),
                          );
                        }).toList(),
                      ),
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
