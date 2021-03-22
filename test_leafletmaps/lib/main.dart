import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'flutter_osm_plugin/flutter_osm_plugin.dart';
import 'flutter_osm_plugin/search_example.dart';
import 'flutter_ui/ExpandadedList.dart';
import 'dargmarker_drow/dragmarker.dart';
import 'flutter_ui/flow_menu.dart';
import 'flutter_ui/itemDroppedOnCustomerCart.dart';
import 'flutter_ui/swipe_Dismissible.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Map Example'),
        ),
        body: SwipeDismissible(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Set<Polyline> _polylines = {};
  List<Polyline> _polylines = [];

  //Set<Polyline> _polylines = Set<Polyline>();
  //List<LatLng> polylineCoordinates = [];

  static LatLng _lastMapPositionMarker;
  String currentGeoPositionLatLng;

  // MapType _currentMapType = MapType.normal;

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  dynamic noData;
  dynamic userStatus;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _getCurrentLocation() async {
    await geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      refreshList();
      _lastMapPositionMarker = LatLng(position.latitude, position.longitude);
      currentGeoPositionLatLng = "${position.latitude}, ${position.longitude}";
      if (!noData && userStatus == "Online") dbValueInitialize();
    }).catchError((e) {
      print(e);
    });
  }

  _onMapTypeButtonPressed() {
    setState(() {
      // _currentMapType = _currentMapType == MapType.normal
      //     ? MapType.satellite
      //     : MapType.normal;
    });
  }

  _addPolyline(latLngForPolyline) {
    int i = 0;
    setState(() {
      _polylines.add(Polyline(
        points: latLngForPolyline,
        // polylineId: PolylineId((i++).toString()),
        //visible: true,
        //width: 2,

        borderColor: Colors.red,
        color: Colors.red.withOpacity(0.0),
        borderStrokeWidth: 2,
      ));
    });
  }

  dbValueInitialize() {}

  refreshList() async {}

  var points = <LatLng>[
    LatLng(23.7745, 90.4116),
    LatLng(23.7745, 90.4116),
  ];

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(title: new Text('Leaflet Maps')),
    //   body: FlutterMap(
    //     options: MapOptions(
    //         center: new LatLng(23.774410397298723, 90.41153171206585),
    //         minZoom: 16.0),
    //     layers: [
    //       TileLayerOptions(
    //         urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
    //
    //         // urlTemplate:
    //         //     "https://api.mapbox.com/styles/v1/mdrahamat05/ckmipjjqxqwtv17ptd4n1n9j0/wmts?access_token=pk.eyJ1IjoibWRyYWhhbWF0MDUiLCJhIjoiY2ttaW95ZHNkMGoyeDJxczJoNzNqY2w2dCJ9._vbpLvM6XlJCH4zOG0AnjA",
    //
    //         subdomains: ['a', 'b', 'c'],
    //
    //         // additionalOptions: {
    //         //   'accessToken':
    //         //       'pk.eyJ1IjoibWRyYWhhbWF0MDUiLCJhIjoiY2ttaW95ZHNkMGoyeDJxczJoNzNqY2w2dCJ9._vbpLvM6XlJCH4zOG0AnjA',
    //         //   'id': 'mapbox.mapbox-streets-v1'
    //         // },
    //       ),
    //       MarkerLayerOptions(
    //         markers: [
    //           new Marker(
    //             width: 45.0,
    //             height: 45.0,
    //             point: new LatLng(23.774410397298723, 90.41153171206585),
    //             builder: (context) => new Container(
    //               child: IconButton(
    //                 icon: Icon(Icons.location_on),
    //                 color: Colors.red,
    //                 iconSize: 45.0,
    //                 onPressed: () {
    //                   print('Marker tapped');
    //                 },
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //       PolylineLayerOptions(
    //         polylines: [
    //           Polyline(
    //             points: points,
    //             strokeWidth: 5.0,
    //             color: Colors.greenAccent,
    //           )
    //         ],
    //       ),
    //     ],
    //   ),
    // );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            child: FlutterMap(
              options: MapOptions(
                plugins: [
                  DragMarkerPlugin(),
                ],
                center: LatLng(23.77441, 90.41153),
                zoom: 16.4,
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: [
                    'a',
                    'b',
                    'c',
                  ],
                ),
                PolylineLayerOptions(polylines: _polylines),
                DragMarkerPluginOptions(
                  markers: <DragMarker>[
                    DragMarker(
                      point: LatLng(23.7744, 90.4115),
                      width: 80.0,
                      height: 80.0,
                      offset: Offset(0.0, -8.0),
                      builder: (ctx) => Container(
                        child: Icon(Icons.location_on,
                            size: 50, color: Colors.blueAccent),
                      ),
                      onDragStart: (details, point) =>
                          print("Drag Start point $point"),
                      onDragEnd: (details, point) =>
                          print("Drag End point $point"),
                      // onDragUpdate: (details, point) {
                      //   print("on Drag Update $point");
                      // },
                      // onTap: (point) {
                      //   print("on tap $point");
                      // },
                      // onLongPress: (point) {
                      //   print("on long press $point");
                      // },

                      feedbackBuilder: (ctx) => Container(
                        child: Icon(
                          Icons.edit_location,
                          size: 75,
                          color: Colors.redAccent,
                        ),
                      ),
                      feedbackOffset: Offset(0.0, -18.0),
                      updateMapNearEdge: false,
                      nearEdgeRatio: 2.0,
                      nearEdgeSpeed: 1.0,
                    ),
                    DragMarker(
                      point: LatLng(23.7745, 90.4116),
                      width: 80.0,
                      height: 80.0,
                      builder: (ctx) => Container(
                        child: Icon(
                          Icons.location_on,
                          color: Colors.green,
                          size: 50,
                        ),
                      ),
                      onDragStart: (details, point) =>
                          print("Drag Start point $point"),
                      onDragEnd: (details, point) {
                        print('Finished Drag $details $point');
                      },
                      updateMapNearEdge: false,
                    ),
                  ],
                ),
                // PolylineLayerOptions(
                //   polylines: [
                //     Polyline(
                //       points: points,
                //       strokeWidth: 2.0,
                //       color: Colors.red,
                //     )
                //   ],
                // ),
              ],
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    children: <Widget>[
                      button(_onMapTypeButtonPressed, Icons.map, "btn1"),
                      SizedBox(
                        height: 16.0,
                      ),
                      button(_getCurrentLocation, Icons.location_searching,
                          "btn3"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget button(Function function, IconData icon, String heroTag) {
    return FloatingActionButton(
      onPressed: function,
      heroTag: heroTag,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.grey,
      child: Icon(
        icon,
        size: 30.0,
      ),
    );
  }
}
