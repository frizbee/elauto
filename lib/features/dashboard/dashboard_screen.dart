import 'package:flutter/material.dart';

import '../../data/local/app_database.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, required this.database});

  final AppDatabase database;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<VehicleCatalogProfile?>(
          future: database.getPrimaryVehicleCatalogProfile(),
          builder: (context, snapshot) {
            final vehicle = snapshot.data;

            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }

            if (vehicle == null) {
              return const SizedBox.expand();
            }

            return Center(
              child: Text(
                '${vehicle.vehicleBrand.name} ${vehicle.vehicleModel.name}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            );
          },
        ),
      ),
    );
  }
}
