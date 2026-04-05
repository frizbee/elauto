import 'package:flutter/material.dart';

import '../../data/local/app_database.dart';
import '../../theme/app_theme.dart';

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

            return Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dashboard',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Card(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSpacing.xl),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppRadius.lg),
                        boxShadow: AppShadows.soft,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            vehicle.vehicleType.name,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            '${vehicle.vehicleBrand.name} ${vehicle.vehicleModel.name}',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: AppSpacing.md),
                          Text(
                            'Year: ${vehicle.profile.year ?? '-'}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            'Mileage: ${_formatMileage(vehicle.profile.currentOdometerKm, vehicle.profile.odometerUnit)}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          if ((vehicle.profile.vin ?? '').isNotEmpty) ...[
                            const SizedBox(height: AppSpacing.xs),
                            Text(
                              '${vehicle.vehicleType.code == 'car' ? 'VIN' : 'Frame'}: ${vehicle.profile.vin}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                          if ((vehicle.profile.plateNumber ?? '')
                              .isNotEmpty) ...[
                            const SizedBox(height: AppSpacing.xs),
                            Text(
                              'Plate: ${vehicle.profile.plateNumber}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  String _formatMileage(int currentOdometerKm, String odometerUnit) {
    if (odometerUnit == 'miles') {
      final miles = currentOdometerKm / 1.60934;
      return '${miles.round()} miles';
    }

    return '$currentOdometerKm km';
  }
}
