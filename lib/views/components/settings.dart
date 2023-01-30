// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';

class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  DateTime currentDate = DateTime.now();
  TimeOfDay currentTime = TimeOfDay.now();

  List<String> Months = [
    'January ',
    'February ',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Date",
                style: TextStyle(
                  color: Color(0xff54759e),
                ),
              ),
              Text(
                '${currentDate.day},${Months[currentDate.month - 1]} ${currentDate.year}',
                style: const TextStyle(
                  color: Color(0xff54759e),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => Color(0xff54759e),
                ),
              ),
              child: const Text("Change Date"),
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: currentDate,
                    firstDate: DateTime(2010),
                    errorFormatText: "Error",
                    lastDate: DateTime(2050),
                    builder: (context, widget) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: Color(0xff54759e),
                            onPrimary: Colors.white,
                            onSurface: Colors.black,
                          ),
                        ),
                        child: MediaQuery(
                            data: MediaQuery.of(context).copyWith(
                              boldText: true,
                              invertColors: true,
                            ),
                            child: widget!),
                      );
                    });
                setState(() {
                  if (pickedDate != null) {
                    currentDate = pickedDate;
                  }
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Time",
                    style: TextStyle(
                      color: Color(0xff54759e),
                    ),
                  ),
                  (currentTime.period.name == 'pm')
                      ? Text(
                          "${currentTime.hour}:${currentTime.minute} ${currentTime.period.name}",
                          style: const TextStyle(
                            color: Color(0xff54759e),
                          ),
                        )
                      : Text(
                          "${currentTime.hour}:${currentTime.minute} ${currentTime.period.name}",
                          style: const TextStyle(
                            color: Color(0xff54759e),
                          ),
                        ),
                ],
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => const Color(0xff54759e),
                    ),
                  ),
                  onPressed: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: currentTime,
                        builder: (context, widget) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: Color(0xff54759e),
                                onPrimary: Colors.white,
                                onSurface: Colors.black,
                              ),
                            ),
                            child: MediaQuery(
                                data: MediaQuery.of(context).copyWith(
                                  alwaysUse24HourFormat: false,
                                  boldText: true,
                                  invertColors: true,
                                ),
                                child: widget!),
                          );
                        });
                    setState(() {
                      if (pickedTime != null) {
                        currentTime = pickedTime;
                      }
                    });
                  },
                  child: const Text("Change Time"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
