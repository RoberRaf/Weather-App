// import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
// import 'package:weather_app/core/cubit/app_bus.dart';
// import 'package:weather_app/features/offline/bus/network_connection_events.dart';

// class NetworkConnectionBus extends AppBus {
//   NetworkConnectionBus._();
//   static final _inst = NetworkConnectionBus._();
//   static NetworkConnectionBus get inst => _inst;

//   final _connection = InternetConnection.createInstance(
//     useDefaultOptions: false,
//     customCheckOptions: [
//       InternetCheckOption(uri: Uri.parse("https://www.google.com/"), timeout: const Duration(seconds: 30)),
//       // InternetCheckOption(
//       //   uri: Uri.parse(ApiClient.mainDomain),
//       //   timeout: const Duration(seconds: 10),
//       // ),
//     ],
//   );

//   Future<void> checkNetworkConnection() async {
//     fire(NetworkChecking());
//     final hasConnection = await _connection.hasInternetAccess;
//     if (hasConnection) {
//       networkConnected();
//     } else {
//       networkDisconnected();
//     }
//   }

//   networkConnected() {
//     fire(NetworkConnected());
//   }

//   networkDisconnected() {
//     fire(NetworkDisconnected());
//   }
// }
