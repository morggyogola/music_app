// import 'package:bluetooth_classic/bluetooth_classic.dart';
// import 'package:bluetooth_classic/models/device.dart';
// import 'package:get/get.dart';
//
// class DeviceScanningController {
//   final _bluetoothClassicPlugin = BluetoothClassic();
//   // List<Device> devices = [];
//   bool scanning = false;
//   RxList<Device> discoveredDevices = <Device>[].obs;
//
//   // Future<List> scanningDevices() async {
//   //   if (! scanning) {
//   //     _bluetoothClassicPlugin.startScan();
//   //     _bluetoothClassicPlugin.onDeviceDiscovered().listen((event) {
//   //       print(event.name);
//   //       discoveredDevices.value = [...discoveredDevices, event];
//   //     });
//   //   }
//   Future<void> scanningDevices() async {
//     if (!scanning) {
//       scanning = true; // Set scanning flag to true
//       _bluetoothClassicPlugin.startScan();
//       _bluetoothClassicPlugin.onDeviceDiscovered().listen((event) {
//         print(event.name);
//         discoveredDevices.add(event); // Use add() instead of assigning a new list
//       });
//     }
//   }
//     return discoveredDevices;
//   }
//
// }

import 'package:bluetooth_classic/bluetooth_classic.dart';
import 'package:bluetooth_classic/models/device.dart';
import 'package:get/get.dart';

class DeviceScanningController {
  final _bluetoothClassicPlugin = BluetoothClassic();
  bool scanning = false;
  RxList<Device> discoveredDevices = <Device>[].obs;

  Future<void> scanningDevices() async {
    if (!scanning) {
      scanning = true;
      _bluetoothClassicPlugin.startScan();
      _bluetoothClassicPlugin.onDeviceDiscovered().listen((event) {
        print(event.name);
        discoveredDevices.add(event);
      });
    }
  }
}