/* 

import 'package:adhan/adhan.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

class TimesSalatProvider with ChangeNotifier {

  final Location _location = Location();
  final _coord = {'latitude': 0.0, 'longitude': 0.0};
  final _prayerTimes = {
    'fajr': null, 
    'sunrise': null, 
    'dhuhr': null, 
    'asr': null, 
    'maghrib': null, 
    'isha': null, 
  };

  Future<void> getLocationG() async {
    var _serviceEnabled;
    var _permissionGranted;
    var _locationData;

    _location.enableBackgroundMode(enable: true);
  
    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) return;
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) return;
    }
    _locationData = await _location.getLocation();
    _coord.update('latitude', (value) => _locationData.latitude);
    _coord.update('longitude', (value) => _locationData.longitude);
    notifyListeners();
  }

  Map<String, double> get getLocation {
    return _coord;
  }

  void printTimer(){
    final coordinates = Coordinates(_coord['latitude'], _coord['longitude']);
    CalculationParameters params = CalculationMethod.dubai.getParameters();
    params.madhab = Madhab.hanafi;
    /* params.adjustments.fajr = 46;
    params.adjustments.dhuhr = 4;
    params.adjustments.asr = -54;
    params.adjustments.maghrib = 5;
    params.adjustments.isha = -21; */
    final prayertimes = PrayerTimes(coordinates, DateComponents.from(DateTime.now()), params);
    print(prayertimes.fajr.timeZoneName);



    print(DateFormat.jm().format(prayertimes.sunrise));
    print(DateFormat.jm().format(prayertimes.dhuhr));
    print(DateFormat.jm().format(prayertimes.asr.toLocal()));
    print(DateFormat.jm().format(prayertimes.maghrib));
    print(DateFormat.jm().format(prayertimes.isha));
    
    //notifyListeners();
    
    }
  

} */