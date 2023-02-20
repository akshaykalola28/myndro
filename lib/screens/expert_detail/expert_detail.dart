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
  late final ValueNotifier<List<Event>> _selectedEvents;
  final CalendarFormat _calendarFormat = CalendarFormat.week;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  dynamic getExpertData;

  @override
  void initState() {
    super.initState();
    getExpertData = Get.arguments;
    //////TODO dynamic date
    expertDetailController.getDrSlotList(
        int.parse(getExpertData['doctorDetail']?.doctorId ?? ''),
        '2022-12-22' /*   DateFormat('yyyy-MM-dd').format(day ?? DateTime.now()) */);
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null;
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = DateTime.now();
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
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
                                /*   Expanded(
                                  child: Column(
                                    children: [
                                      Common.iconContainer(
                                          Icons.videocam, 'Video call',
                                          isPriceVisible: true,
                                          subText:
                                              '\u{20B9}${getExpertData['doctorDetail']?.doctorVideoCharge}'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      // Padding(
                                      //   padding: const EdgeInsets.symmetric(
                                      //       horizontal: 25),
                                      //   child: dropDown(),
                                      // )
                                    ],
                                  ),
                                ),
                                Expanded(
                                    child: Column(
                                  children: [
                                    Common.iconContainer(
                                        Icons.phone_in_talk_rounded,
                                        'Audio call',
                                        isPriceVisible: true,
                                        subText:
                                            '\u{20B9}${getExpertData['doctorDetail']?.doctorAudioCharge}'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.symmetric(
                                    //       horizontal: 25),
                                    //   child: dropDown(),
                                    // )
                                  ],
                                )) */
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
                      onTap: (calendarTapDetails) {
                        print('calendarTapDetails ${calendarTapDetails.date}');
                        expertDetailController.getDrSlotList(
                            int.parse(
                                getExpertData['doctorDetail']?.doctorId ?? ''),
                            DateFormat('yyyy-MM-dd').format(
                                calendarTapDetails.date ?? DateTime.now()));
                      },
                      selectionDecoration: BoxDecoration(
                        color: Colors.transparent,
                        border:
                            Border.all(color: ColorsConfig.colorBlue, width: 2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                        shape: BoxShape.rectangle,
                      ),

                      // dataSource: expertDetailController.getDrSlotList(
                      //     int.parse(
                      //         getExpertData['doctorDetail']?.doctorId ?? ''),
                      //     '2022-12-22'),
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
////////TODO with date
                            expertDetailController.allDrSlots
                                    .map((e) => e.slots)
                                    .isNotEmpty
                                ? GroupButton(
                                    buttons: expertDetailController.allDrSlots
                                        .map((e) => e.slots)
                                        .toList(),
                                    options: GroupButtonOptions(
                                      selectedShadow: const [],
                                      unselectedShadow: const [],
                                      unselectedColor: ColorsConfig.colorGrey,
                                      selectedColor: ColorsConfig.colorBlue,
                                      unselectedTextStyle: const TextStyle(
                                        color: ColorsConfig.colorGreyy,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    onSelected: (val, i, selected) {
                                      debugPrint(
                                          'Button: $val index: $i $selected');
                                      expertDetailController.expertSlot.value =
                                          val.toString();
                                      expertDetailController.expertSlotId
                                          .value = expertDetailController
                                              .allDrSlots[i].doctorSlotId ??
                                          '';
                                    },
                                  )
                                : const MyndroLoader(),

                            //TODO calender is comment use it
                            /*   TableCalendar<Event>(
                            
                            firstDay: kFirstDay,
                            lastDay: kLastDay,
                            focusedDay: _focusedDay,
                            enabledDayPredicate: (date) {
                              if (date.isBefore(DateTime.now()
                                  .subtract(const Duration(days: 1)))) {
                                return false;
                              }
                              return true;
                            },
                            selectedDayPredicate: (day) =>
                                isSameDay(_selectedDay, day),
                            rangeStartDay: _rangeStart,
                            rangeEndDay: _rangeEnd,
                            calendarFormat: _calendarFormat,
                            rangeSelectionMode: _rangeSelectionMode,
                            // eventLoader: _getEventsForDay,
                            availableGestures: AvailableGestures.none,
                            startingDayOfWeek: StartingDayOfWeek.monday,
                            availableCalendarFormats: const {
                              CalendarFormat.week: 'Week',
                            },
                            calendarStyle: CalendarStyle(
                              outsideDaysVisible: false,
                              todayDecoration: BoxDecoration(
                                color: ColorsConfig.colorBlue.withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              selectedDecoration: const BoxDecoration(
                                color: ColorsConfig.colorBlue,
                                shape: BoxShape.circle,
                              ),
                            ),
                            onDaySelected: _onDaySelected,
                            onRangeSelected: _onRangeSelected,
                            onPageChanged: (focusedDay) {
                              _focusedDay = focusedDay;
                            },
                          ),
                          ValueListenableBuilder<List<Event>>(
                            valueListenable: _selectedEvents,
                            builder: (context, value, _) {
                              return GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 15.0,
                                  mainAxisSpacing: 15.0,
                                  childAspectRatio: (Get.width / 4) / 40,
                                ),
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: value.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      border: Border.all(
                                        color: ColorsConfig.colorBlack,
                                        style: BorderStyle.solid,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '0$index:10',
                                        style: TextStyle(
                                            fontFamily:
                                                AppTextStyle.microsoftJhengHei,
                                            fontSize: 15.0,
                                            color: ColorsConfig.colorBlack,
                                            fontWeight: FontWeight.w600),
                                        maxLines: 1,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ), */
                            const SizedBox(
                              height: 12,
                            ),
                              expertDetailController.isPromo.value ?
                            loginTextFieldWidget(
                                expertDetailController.promoController,
                                false,
                                (value) {},
                                TextInputType.text,
                                'Promo & Voucher Code',
                                Icons.discount_rounded) : Container(),
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

  Widget dropDown() {
    return DropdownButtonFormField<String>(
      iconDisabledColor: ColorsConfig.colorBlue,
      iconEnabledColor: ColorsConfig.colorBlue,
      isExpanded: false,
      value: expertDetailController.dropdownValue,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        hintText: 'Select',
        // labelText: 'Select',
        iconColor: ColorsConfig.colorGreyy,
        hintStyle: TextStyle(
          fontFamily: AppTextStyle.microsoftJhengHei,
          fontSize: 15.0,
          color: ColorsConfig.colorGreyy,
        ),
        labelStyle: TextStyle(
          fontFamily: AppTextStyle.microsoftJhengHei,
          fontSize: 15.0,
          color: ColorsConfig.colorGreyy,
        ),
        filled: true,
        fillColor: ColorsConfig.colorWhite,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: ColorsConfig.colorGreyy,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: ColorsConfig.colorGreyy,
            width: 1.5,
          ),
        ),
      ),
      items: <String>[
        'Lot 1',
        'Lot 2',
        'Lot 3',
        'Lot 4',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(
              fontFamily: AppTextStyle.microsoftJhengHei,
              fontSize: 13.0,
              color: ColorsConfig.colorGreyy,
            ),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          expertDetailController.dropdownValue = newValue;
        });
      },
    );
  }
}

// List<Meeting> _getDataSource() {
//   final List<Meeting> meetings = <Meeting>[];
//   final DateTime today = DateTime.now();
//   final DateTime startTime =
//       DateTime(today.year, today.month, today.day, 9, 0, 0);
//   final DateTime endTime = startTime.add(const Duration(hours: 2));
//   meetings.add(Meeting(
//       "Conference", startTime, endTime, const Color(0xFF0F8644), false));
//   return meetings;
// }

// class MeetingDataSource extends CalendarDataSource {
//   expertDetailController.getDrSlotList(
//         int.parse(getExpertData['doctorDetail']?.doctorId ?? ''),
//   // MeetingDataSource(List<Meeting> source) {
//   //   appointments = source;
//   // }

//   // @override
//   // DateTime getStartTime(int index) {
//   //   return appointments![index].from;
//   // }

//   // @override
//   // DateTime getEndTime(int index) {
//   //   return appointments![index].to;
//   // }

//   // @override
//   // String getSubject(int index) {
//   //   return appointments![index].eventName;
//   // }

//   // @override
//   // Color getColor(int index) {
//   //   return appointments![index].background;
//   // }

//   // @override
//   // bool isAllDay(int index) {
//   //   return appointments![index].isAllDay;
//   // }
// }

// class Meeting {
//   Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

//   String eventName;
//   DateTime from;
//   DateTime to;
//   Color background;
//   bool isAllDay;
// }
