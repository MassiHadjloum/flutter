import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:photo_app/helpers/location_helper.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  Location location = Location();
  bool? _serviceEnabled;
  PermissionStatus? _permission;
  LocationData? _locationData;

  Future<void> _getLocation() async {
    final locData = await Location().getLocation();
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
      latitude: locData.latitude,
      longitude: locData.longitude,
    );
    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
    /*  _serviceEnabled = await location.serviceEnabled();
    if(!_serviceEnabled!){
      _serviceEnabled = await location.serviceEnabled();
      if(!_serviceEnabled!) {
        return;
      }
    }
    _permission = await location.hasPermission();
    if(_permission == PermissionStatus.denied){
      _permission = await location.requestPermission();
      if(_permission == PermissionStatus.granted){
        return;
      }
    }
    _locationData = await location.getLocation(); */
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _previewImageUrl == null
              ? const Text(
                  "No Location Chosen yet !!",
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextButton.icon(
              onPressed: _getLocation,
              icon: const Icon(Icons.location_on),
              label: const Text("Current Location"),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map),
              label: const Text("Select on Map"),
            ),
          ],
        )
      ],
    );
  }
}
