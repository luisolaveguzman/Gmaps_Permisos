import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps/app/ui/pages/gmaps/gmaps_controller.dart';
import 'package:provider/provider.dart';

class GmapsPageState extends StatelessWidget {
  const GmapsPageState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GmapsController>(
      create: (_) =>
          GmapsController(), //devuelve un controller y debe ser recibido por un consumer
      child: Scaffold(
        body: Selector<GmapsController, bool>(
          selector: (_, controller) => controller.loading,
          builder: (context, loading, loadingWidget) {
            if (loading) {
              return loadingWidget!;
            }
            return Consumer<GmapsController>(
              builder: (_, controller, gpsMessageWidget) {
                if (!controller.gpsEnable) {
                  return gpsMessageWidget!;
                }

                return GoogleMap(
                  onMapCreated: controller.onMapCreated,
                  initialCameraPosition: controller.initialCameraPosition,
                  zoomControlsEnabled: false,
                  rotateGesturesEnabled: false,
                  compassEnabled: false,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                );
              },
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Para usar la app debe encender su GPS",
                        textAlign: TextAlign.center),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final controller = context.read<GmapsController>();
                        controller.turnOnGPS();
                      },
                      child: const Text("Encender GPS"),
                    )
                  ],
                ),
              ),
            );
          },
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
