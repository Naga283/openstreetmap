import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:openstreetmap/controllers/open_location.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double latitude = 17.326518;
    double longitude = 78.490920;
    String title = '';
    MapController controller = MapController.withPosition(
      initPosition: GeoPoint(
        latitude: latitude,
        longitude: longitude,
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: SizedBox(
        height: 100,
        width: 100,
        child: GestureDetector(
          onTap: () {
            debugPrint('downlll');
            OpenLocation().openMapsSheet(context, latitude, longitude, title);
          },
          child: Stack(
            children: [
              OSMFlutter(
                controller: controller,
                showZoomController: false,
                initZoom: 12,
                staticPoints: [
                  StaticPositionGeoPoint(
                    '',
                    const MarkerIcon(
                      icon: Icon(
                        Icons.person_pin_circle,
                        color: Colors.red,
                        size: 100,
                      ),
                    ),
                    [
                      GeoPoint(
                        latitude: latitude,
                        longitude: longitude,
                      ),
                    ],
                  ),
                ],
              ),
              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'open ',
                    style: TextStyle(fontSize: 30),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
