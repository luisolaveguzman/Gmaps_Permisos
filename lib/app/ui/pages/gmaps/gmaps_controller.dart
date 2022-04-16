import 'dart:async';

import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps/app/ui/utils/gmap_style.dart';
import 'package:geolocator/geolocator.dart';

class GmapsController extends ChangeNotifier {
  bool _loading = true;
  bool get loading => _loading;
  late bool _gpsEnable;
  bool get gpsEnable => _gpsEnable;
  StreamSubscription?
      _gpsSubscription; /*
  final initialCameraPosition = const CameraPosition(
      target: LatLng(-33.448375155223346, -70.66537346632752), zoom: 17);*/

  Position? _initialPosition;
  //Position? get initialPosition => _initialPosition;
  CameraPosition get initialCameraPosition => CameraPosition(
        target: LatLng(
          _initialPosition!.latitude,
          _initialPosition!.longitude,
        ),
        zoom: 17,
      );

  GmapsController() {
    _init();
  }

  Future<void> _init() async {
    _gpsEnable = await Geolocator.isLocationServiceEnabled();
    _loading = false;
    _gpsSubscription = Geolocator.getServiceStatusStream().listen(
      (status) async {
        _gpsEnable = status == ServiceStatus.enabled;
        await _getInitialPosition();
      },
    );
    await _getInitialPosition();
  }

  Future<void> turnOnGPS() => Geolocator.openLocationSettings();

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  Future<void> _getInitialPosition() async {
    if (_gpsEnable && _initialPosition == null) {
      _initialPosition = await Geolocator.getCurrentPosition();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _gpsSubscription?.cancel();
    super.dispose();
  }
}
