// import 'package:flutter/material.dart';
// import 'package:weather_app/core/helpers/app_consts.dart';
// import 'package:weather_app/core/helpers/spacing.dart';
// import 'package:weather_app/core/theming/app_colors.dart';
// import 'package:weather_app/core/theming/text_styles.dart';
// import 'package:weather_app/features/general_widgets/main_button.dart';
// import 'package:weather_app/features/offline/bus/network_connection_bus.dart';
// import 'package:weather_app/features/offline/bus/network_connection_events.dart';

// class NoInternetWidget extends StatelessWidget {
//   const NoInternetWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: NetworkConnectionBus.inst.getStream<NetWorkConnectionEvents>(),
//       initialData: NetworkConnected(),
//       builder: (context, snapshot) {
//         if (snapshot.data is NetworkConnected) {
//           return const SizedBox.shrink();
//         }
//         return LayoutBuilder(
//           builder: (context, contrains) {
//             return SizedBox(
//               height: MediaQuery.sizeOf(context).height,
//               width: MediaQuery.sizeOf(context).width,
//               child: ColoredBox(
//                 color: Colors.black38,
//                 child: Center(
//                   child: Dialog(
//                     elevation: 10,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Badge(
//                             label: Text('Offline', style: TStyle.whiteBold(15)),
//                             alignment: Alignment.centerRight,
//                             backgroundColor: Co.grey,
//                             child: const Icon(Icons.wifi_off_rounded, color: Co.grey, size: 65),
//                           ),
//                           const VerticalSpacing(16),
//                           Text("Connection disrupted", style: TStyle.darkBold(17)),
//                           const VerticalSpacing(8),
//                           Text("No or week internet connection", style: TStyle.greySemi(15)),
//                           const VerticalSpacing(16),
//                           MainButton(
//                             margin: AppConsts.defaultHorPadding,
//                             isLoading: snapshot.data is NetworkChecking,
//                             text: "Try again",
//                             ontap: () => NetworkConnectionBus.inst.checkNetworkConnection(),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

// class L10n {}
