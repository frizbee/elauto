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
                          if ((vehicle.profile.nickname ?? '').isNotEmpty) ...[
                            const SizedBox(height: AppSpacing.xs),
                            Text(
                              vehicle.profile.nickname!,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
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
                          if ((vehicle.profile.vehicleColor ?? '')
                              .isNotEmpty) ...[
                            const SizedBox(height: AppSpacing.xs),
                            Row(
                              children: [
                                _ColorSwatch(
                                  color: _vehicleColorFromName(
                                    vehicle.profile.vehicleColor!,
                                  ),
                                ),
                                const SizedBox(width: AppSpacing.xs),
                                Text(
                                  'Color: ${_vehicleColorLabel(vehicle.profile.vehicleColor!)}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ],
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

  Color _vehicleColorFromName(String colorName) {
    if (colorName.startsWith('#') && colorName.length == 7) {
      final hex = colorName.substring(1);
      return Color(int.parse('FF$hex', radix: 16));
    }

    switch (colorName.toLowerCase()) {
      case 'white':
        return const Color(0xFFF8FAFC);
      case 'black':
        return const Color(0xFF111111);
      case 'silver':
        return const Color(0xFFC0C7D1);
      case 'gray':
        return const Color(0xFF6B7280);
      case 'blue':
        return const Color(0xFF2563EB);
      case 'red':
        return const Color(0xFFDC2626);
      case 'green':
        return const Color(0xFF2F855A);
      case 'brown':
        return const Color(0xFF8B5E3C);
      case 'beige':
        return const Color(0xFFD6C6A5);
      case 'orange':
        return const Color(0xFFFF6A00);
      case 'yellow':
        return const Color(0xFFF59E0B);
      default:
        return AppColors.border;
    }
  }

  String _vehicleColorLabel(String storedValue) {
    if (!storedValue.startsWith('#')) {
      return storedValue;
    }

    final hsv = HSVColor.fromColor(_vehicleColorFromName(storedValue));
    final hue = hsv.hue;

    if (hue < 20 || hue >= 340) {
      return 'Red';
    }
    if (hue < 45) {
      return 'Orange';
    }
    if (hue < 65) {
      return 'Yellow';
    }
    if (hue < 170) {
      return 'Green';
    }
    if (hue < 255) {
      return 'Blue';
    }
    if (hue < 300) {
      return 'Purple';
    }

    return 'Pink';
  }
}

class _ColorSwatch extends StatelessWidget {
  const _ColorSwatch({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.border),
      ),
    );
  }
}
