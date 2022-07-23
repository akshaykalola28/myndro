import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../constant/constant.dart';
import '../../controller/controller.dart';
import '../../util/common.dart';
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

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
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
        _rangeStart = null; // Important to clean those
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
      _rangeStart = start;
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
        child: LayoutWidget(
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
                  const ExpertDetailContainer(),
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
                              Expanded(
                                child: Column(
                                  children: [
                                    Common.iconContainer(
                                        Icons.videocam, 'Video call',
                                        isPriceVisible: true,
                                        subText: '\u{20B9}${' 500'}'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 25),
                                      child: dropDown(),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Column(
                                children: [
                                  Common.iconContainer(
                                      Icons.phone_in_talk_rounded, 'Audio call',
                                      isPriceVisible: true,
                                      subText: '\u{20B9}${' 400'}'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: dropDown(),
                                  )
                                ],
                              ))
                            ],
                          ),
                        ],
                      ),
                    ),
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
                            'Appointment Request',
                            style: TextStyle(
                                fontFamily: AppTextStyle.microsoftJhengHei,
                                fontSize: 15.0,
                                color: ColorsConfig.colorGreyy,
                                fontWeight: FontWeight.w600),
                          ),
                          TableCalendar<Event>(
                            firstDay: kFirstDay,
                            lastDay: kLastDay,
                            focusedDay: _focusedDay,
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
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          GestureDetector(
                            onTap: (() {}),
                            child: Container(
                              // height: 45,
                              // width: Get.width,
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
                                  fontFamily: AppTextStyle.microsoftJhengHei,
                                  fontSize: 16.0,
                                  color: ColorsConfig.colorWhite,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Divider(color: ColorsConfig.colorBlack, thickness: 0.5),
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
