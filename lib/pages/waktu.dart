import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Waktu extends StatefulWidget {
  const Waktu({Key? key}) : super(key: key);

  @override
  State<Waktu> createState() => _Waktu();
}

class _Waktu extends State<Waktu> {
  String _timeNowString = '';
  String _timeWIB = '';
  String _timeWITA = '';
  String _timeWIT = '';
  String _timeGMT = '';
  String _zoneString = 'WIB';

  Duration _getOffset(String zone) {
    switch (zone) {
      case 'WITA':
        return const Duration(hours: 8);
      case 'WIT':
        return const Duration(hours: 9);
      case 'GMT':
        return const Duration(hours: 0);
      default:
        return const Duration(hours: 7);
    }
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Indonesia - WIB"), value: "WIB"),
      DropdownMenuItem(child: Text("Indonesia - WITA"), value: "WITA"),
      DropdownMenuItem(child: Text("Indoensia - WIT"), value: "WIT"),
      DropdownMenuItem(child: Text("London - GMT"), value: "GMT"),
    ];
    return menuItems;
  }

  @override
  void initState() {
    super.initState();
    _timeNowString = _formatDateTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  String _FormatTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  void _getTime() {
    final DateTime utc = DateTime.now().toUtc();
    final DateTime localTime = utc.add(_getOffset(_zoneString));
    final DateTime wibTime = utc.add(_getOffset("WIB"));
    final DateTime witaTime = utc.add(_getOffset("WITA"));
    final DateTime witTime = utc.add(_getOffset("WIT"));
    final DateTime GMTTime = utc.add(_getOffset("GMT"));
    final String formattedLocalTime = _formatDateTime(localTime);
    if (this.mounted) {
      setState(() {
        _timeNowString = formattedLocalTime;
        _timeWIB = _FormatTime(wibTime);
        _timeWITA = _FormatTime(witaTime);
        _timeWIT = _FormatTime(witTime);
        _timeGMT = _FormatTime(GMTTime);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text("Timezone Access Now"),
        ),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${_timeNowString} ${_zoneString}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: DropdownButton(
                        value: _zoneString,
                        items: dropdownItems,
                        dropdownColor: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        onChanged: (String? value) {
                          setState(() {
                            _zoneString = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: ListView(
                  children: [
                    SizedBox(height: 10),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: ListTile(
                        title: Text("Indonesia - WIB"),
                        subtitle: Text('${_timeWIB} WIB'),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: ListTile(
                        title: Text("Indonesia - WITA"),
                        subtitle: Text('${_timeWITA} WITA'),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: ListTile(
                        title: Text("Indonesia - WIT"),
                        subtitle: Text('${_timeWIT} WIT'),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: ListTile(
                        title: Text("London - GMT"),
                        subtitle: Text('${_timeGMT} GMT'),
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}