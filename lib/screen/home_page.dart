import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:openstreetmap/controllers/open_location.dart';
import 'package:openstreetmap/screen/controller_zoom_in.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double latitude = 17.7961693;
    double longitude = 83.3427411;
    String title = '';

    MapController controller = MapController.customLayer(
      // initMapWithUserPosition: false,
      // initPosition: GeoPoint(
      //   latitude: latitude,
      //   longitude: longitude,
      // ),
      customTile: CustomTile(
        sourceName: "publicTransportationLayer",
        tileExtension: ".png",
        minZoomLevel: 2,
        maxZoomLevel: 19,
        urlsServers: [
          TileURLs(
            url: "https://tile.opentopomap.org/",
            subdomains: [],
          )
        ],
        tileSize: 256,
      ),
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Stack(
        children: [
          OSMFlutter(
            controller: controller,
            initZoom: 8,
            minZoomLevel: 3,
            maxZoomLevel: 19,
            stepZoom: 1.0,
            userLocationMarker: UserLocationMaker(
              personMarker: const MarkerIcon(
                icon: Icon(
                  Icons.location_history_rounded,
                  color: Colors.red,
                  size: 100,
                ),
              ),
              directionArrowMarker: const MarkerIcon(
                icon: Icon(
                  Icons.double_arrow,
                  size: 48,
                ),
              ),
            ),
            roadConfiguration: RoadConfiguration(
              roadColor: Colors.yellowAccent,
            ),
            markerOption: MarkerOption(
              defaultMarker: const MarkerIcon(
                icon: Icon(
                  Icons.person_pin_circle,
                  color: Colors.blue,
                  size: 56,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ZoomIconWidget(
            controller: controller,
            iconWidget: Icons.zoom_in,
            onTap: () async {
              await controller.zoomIn();
            },
            text: 'Zoom In',
          ),
          ZoomIconWidget(
            controller: controller,
            iconWidget: Icons.location_history,
            onTap: () async {
              await controller.currentLocation();
            },
            text: 'Current',
          ),
          ZoomIconWidget(
            controller: controller,
            iconWidget: Icons.zoom_out,
            onTap: () async {
              await controller.zoomOut();
            },
            text: 'Zoom In',
          ),
        ],
      ),
    );
  }
}
