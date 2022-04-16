import 'dart:async';

import 'package:permission_handler/permission_handler.dart';

class RequestPermissionController {
  final Permission _locationPermission;
  //constructor
  RequestPermissionController(this._locationPermission);
  final _streamController = StreamController<PermissionStatus>.broadcast();
  Stream<PermissionStatus> get onStatusChanged => _streamController.stream;

  Future<void> request() async {
    final status = await _locationPermission.request();
    _notify(status);
  }

  void _notify(PermissionStatus status) {
    if (!_streamController.isClosed && _streamController.hasListener) {
      _streamController.sink.add(status);
    }
  }

  Future<PermissionStatus> check() async {
    final status = await _locationPermission.status;
    return status;
  }

  void dispose() {
    _streamController.close();
  }
}
