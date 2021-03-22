// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
//
// class LocationAppExample extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _LocationAppExampleState();
// }
//
// class _LocationAppExampleState extends State<LocationAppExample> {
//   ValueNotifier<GeoPoint> notifier = ValueNotifier(null);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("search picker example"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ValueListenableBuilder<GeoPoint>(
//               valueListenable: notifier,
//               builder: (ctx, p, child) {
//                 return Center(
//                   child: Text(
//                     "${p?.toString() ?? ""}",
//                     textAlign: TextAlign.center,
//                   ),
//                 );
//               },
//             ),
//             Column(
//               children: [
//                 ElevatedButton(
//                   onPressed: () async {
//                     var p = await Navigator.pushNamed(context, "/search");
//                     if (p != null) {
//                       notifier.value = p as GeoPoint;
//                     }
//                   },
//                   child: Text("pick address"),
//                 ),
//                 ElevatedButton(
//                   onPressed: () async {
//                     var p = await showSimplePickerLocation(
//                       context: context,
//                       isDismissible: true,
//                       title: "location picker",
//                       textConfirmPicker: "pick",
//                       initCurrentUserPosition: false,
//                       initPosition:
//                           GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
//                       radius: 8.0,
//                     );
//                     if (p != null) {
//                       notifier.value = p;
//                     }
//                   },
//                   child: Text("show picker address"),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// showSimplePickerLocation(
//     {BuildContext context,
//     bool isDismissible,
//     String title,
//     String textConfirmPicker,
//     bool initCurrentUserPosition,
//     GeoPoint initPosition,
//     double radius}) {}
//
// class SearchPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _SearchPageState();
// }
//
// class _SearchPageState extends State<SearchPage> {
//   ValueNotifier<GeoPoint> notifierGeoPoint = ValueNotifier(null);
//   ValueNotifier<bool> notifierAutoCompletion = ValueNotifier(false);
//   MapController controller = MapController(
//     initMapWithUserPosition: true,
//   );
//   StreamController<List<SearchInfo>> streamSuggestion;
//   Future<List<SearchInfo>> _futureSuggestionAddress;
//   final TextEditingController textEditingController = TextEditingController();
//   String oldText = "";
//   Timer _timerToStartSuggestionReq;
//   final Key streamKey = Key("streamAddressSug");
//
//   @override
//   void initState() {
//     super.initState();
//     streamSuggestion = StreamController();
//     textEditingController.addListener(onChanged);
//   }
//
//   @override
//   void dispose() {
//     _timerToStartSuggestionReq?.cancel();
//     textEditingController.removeListener(onChanged);
//     streamSuggestion.close();
//     super.dispose();
//   }
//
//   void onChanged() async {
//     final v = textEditingController.text;
//     if (v.length > 3 && oldText != v) {
//       oldText = v;
//       if (_timerToStartSuggestionReq != null &&
//           _timerToStartSuggestionReq.isActive) {
//         _timerToStartSuggestionReq.cancel();
//       }
//       _timerToStartSuggestionReq =
//           Timer.periodic(Duration(seconds: 3), (timer) async {
//         await suggestionProcessing(v);
//         timer.cancel();
//       });
//     }
//     if (v.isEmpty) {
//       await reInitStream();
//     }
//   }
//
//   Future reInitStream() async {
//     notifierAutoCompletion.value = false;
//     await streamSuggestion.close();
//     setState(() {
//       streamSuggestion = StreamController();
//     });
//   }
//
//   Future<void> suggestionProcessing(String addr) async {
//     notifierAutoCompletion.value = true;
//     _futureSuggestionAddress = addressSuggestion(
//       addr,
//       limitInformation: 5,
//     );
//     _futureSuggestionAddress.then((value) {
//       streamSuggestion.sink.add(value);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: TextField(
//           controller: textEditingController,
//           onEditingComplete: () async {
//             FocusScope.of(context).requestFocus(new FocusNode());
//           },
//           decoration: InputDecoration(
//             prefixIcon: Icon(
//               Icons.search,
//               color: Colors.black,
//             ),
//             suffix: ValueListenableBuilder<TextEditingValue>(
//               valueListenable: textEditingController,
//               builder: (ctx, text, child) {
//                 if (text.text.isNotEmpty) {
//                   return child;
//                 }
//                 return SizedBox.shrink();
//               },
//               child: InkWell(
//                 focusNode: FocusNode(),
//                 onTap: () {
//                   if (_timerToStartSuggestionReq.isActive) {
//                     _timerToStartSuggestionReq.cancel();
//                   }
//                   textEditingController.clear();
//                   FocusScope.of(context).requestFocus(new FocusNode());
//                 },
//                 child: Icon(
//                   Icons.close,
//                   size: 16,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             focusColor: Colors.black,
//             filled: true,
//             hintText: "search",
//             border: InputBorder.none,
//             enabledBorder: InputBorder.none,
//             fillColor: Colors.grey[300],
//             errorBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.red),
//             ),
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           OSMFlutter(
//             controller: controller,
//             showDefaultInfoWindow: false,
//             useSecureURL: true,
//             isPicker: true,
//             onGeoPointClicked: (geoPoint) {},
//           ),
//           Positioned(
//             top: 0.0,
//             left: 0.0,
//             right: 0.0,
//             height: MediaQuery.of(context).size.height / 4,
//             child: ValueListenableBuilder<bool>(
//               valueListenable: notifierAutoCompletion,
//               builder: (ctx, isVisible, child) {
//                 if (isVisible) {
//                   return child;
//                 }
//                 return Container();
//               },
//               child: StreamBuilder<List<SearchInfo>>(
//                 stream: streamSuggestion.stream,
//                 key: streamKey,
//                 builder: (ctx, snap) {
//                   if (snap.hasData) {
//                     return Card(
//                       child: ListView.builder(
//                         itemExtent: 50.0,
//                         itemBuilder: (ctx, index) {
//                           return ListTile(
//                             title: Text(
//                               snap.data[index].address.toString(),
//                               maxLines: 1,
//                               overflow: TextOverflow.fade,
//                             ),
//                             onTap: () async {
//                               /// go to location selected by address
//                               // controller.goToLocation(
//                               //   snap.data[index].point,
//                               // );
//
//                               /// hide suggestion card
//                               notifierAutoCompletion.value = false;
//                               await reInitStream();
//                               FocusScope.of(context).requestFocus(
//                                 new FocusNode(),
//                               );
//                             },
//                           );
//                         },
//                         itemCount: snap.data.length,
//                       ),
//                     );
//                   }
//                   if (snap.connectionState == ConnectionState.waiting) {
//                     return Card(
//                       child: Center(
//                         child: CircularProgressIndicator(),
//                       ),
//                     );
//                   }
//                   return SizedBox();
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           GeoPoint p = await controller.selectAdvancedPositionPicker();
//           Navigator.pop(context, p);
//         },
//         child: Icon(Icons.arrow_forward),
//       ),
//     );
//   }
// }
