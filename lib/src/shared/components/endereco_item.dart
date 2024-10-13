import 'package:fastlocation/src/shared/model/cep_model.dart';
import 'package:fastlocation/src/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class EnderecoItem extends StatelessWidget {
  final CepModel cepModel;

  const EnderecoItem({super.key, required this.cepModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(cepModel.logradouro),
      subtitle: Text('${cepModel.localidade}, ${cepModel.uf}'),
      leading: const Icon(Icons.map, color: AppColors.primary),
      onTap: () async {
        Position userPosition = await _determinePosition();

        List<Location> locations = await locationFromAddress(
          '${cepModel.logradouro}, ${cepModel.localidade}, ${cepModel.uf}, ${cepModel.cep}',
        );

        if (locations.isNotEmpty) {
          Location destination = locations.first;

          if (await MapLauncher.isMapAvailable(MapType.google) == true) {
            await MapLauncher.showDirections(
              mapType: MapType.google,
              destination: Coords(destination.latitude, destination.longitude),
              origin: Coords(userPosition.latitude, userPosition.longitude),
              directionsMode: DirectionsMode.driving,
            );
          } else {
            String googleMapsUrl =
                'https://www.google.com/maps/dir/?api=1&origin=${userPosition.latitude},${userPosition.longitude}&destination=${destination.latitude},${destination.longitude}&travelmode=driving';

            Uri googleMapsUri = Uri.parse(googleMapsUrl);
            if (await canLaunchUrl(googleMapsUri)) {
              await launchUrl(googleMapsUri);
            } else {
              throw 'Não foi possível abrir o mapa.';
            }
          }
        }
      },
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('O serviço de localização está desativado.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('As permissões de localização foram negadas');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'As permissões de localização estão permanentemente negadas.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
