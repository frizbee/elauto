import 'package:flutter/material.dart';

import '../../data/local/app_database.dart';
import '../../theme/app_theme.dart';

class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({
    super.key,
    required this.database,
    required this.onCompleted,
  });

  final AppDatabase database;
  final VoidCallback onCompleted;

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  int _currentStep = 0;
  bool _isLoading = true;
  bool _isSaving = false;

  List<VehicleType> _vehicleTypes = const [];
  VehicleType? _selectedType;
  VehicleBrand? _selectedBrand;
  VehicleModel? _selectedModel;
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _mileageController = TextEditingController();
  final TextEditingController _identificationController =
      TextEditingController();
  final TextEditingController _plateNumberController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  String _odometerUnit = 'km';
  String? _yearErrorText;
  String? _mileageErrorText;

  @override
  void initState() {
    super.initState();
    _loadVehicleTypes();
  }

  @override
  void dispose() {
    _yearController.dispose();
    _mileageController.dispose();
    _identificationController.dispose();
    _plateNumberController.dispose();
    _nicknameController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  Future<void> _loadVehicleTypes() async {
    final vehicleTypes = await widget.database.getVehicleTypes();

    if (!mounted) {
      return;
    }

    setState(() {
      _vehicleTypes = vehicleTypes;
      _isLoading = false;
    });
  }

  Future<void> _pickBrand() async {
    final selectedType = _selectedType;

    if (selectedType == null) {
      return;
    }

    final brand = await _showSearchPicker<VehicleBrand>(
      title: 'Select brand',
      search: (query) => widget.database.searchVehicleBrands(
        vehicleTypeId: selectedType.id,
        query: query,
      ),
      itemLabel: (item) => item.name,
      createLabel: (value) => 'Add new brand "$value"',
      onCreate: (value) async {
        final id = await widget.database.addVehicleBrand(
          vehicleTypeId: selectedType.id,
          name: value,
        );
        return widget.database.getVehicleBrandById(id);
      },
    );

    if (brand == null || !mounted) {
      return;
    }

    setState(() {
      _selectedBrand = brand;
      _selectedModel = null;
    });
  }

  Future<void> _pickModel() async {
    final selectedBrand = _selectedBrand;

    if (selectedBrand == null) {
      return;
    }

    final model = await _showSearchPicker<VehicleModel>(
      title: 'Select model',
      search: (query) => widget.database.searchVehicleModels(
        vehicleBrandId: selectedBrand.id,
        query: query,
      ),
      itemLabel: (item) => item.name,
      createLabel: (value) => 'Add new model "$value"',
      onCreate: (value) async {
        final id = await widget.database.addVehicleModel(
          vehicleBrandId: selectedBrand.id,
          name: value,
        );
        return widget.database.getVehicleModelById(id);
      },
    );

    if (model == null || !mounted) {
      return;
    }

    setState(() {
      _selectedModel = model;
    });
  }

  Future<T?> _showSearchPicker<T>({
    required String title,
    required Future<List<T>> Function(String query) search,
    required String Function(T item) itemLabel,
    required String Function(String value) createLabel,
    required Future<T> Function(String value) onCreate,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return _SearchPickerSheet<T>(
          title: title,
          search: search,
          itemLabel: itemLabel,
          createLabel: createLabel,
          onCreate: onCreate,
        );
      },
    );
  }

  Future<void> _handleNext() async {
    if (_currentStep == 0) {
      if (_selectedType == null) {
        return;
      }

      setState(() {
        _currentStep = 1;
      });
      return;
    }

    if (_currentStep == 1) {
      final selectedBrand = _selectedBrand;
      final selectedModel = _selectedModel;

      if (selectedBrand == null || selectedModel == null) {
        return;
      }

      setState(() {
        _currentStep = 2;
      });
      return;
    }

    if (_currentStep == 2) {
      final yearError = _validateYear();
      final mileageError = _validateMileage();

      setState(() {
        _yearErrorText = yearError;
        _mileageErrorText = mileageError;
      });

      if (yearError != null || mileageError != null) {
        return;
      }

      setState(() {
        _currentStep = 3;
      });
      return;
    }

    if (_currentStep == 3) {
      setState(() {
        if (_nicknameController.text.trim().isEmpty) {
          _nicknameController.text = _generatedNickname;
        }
        _currentStep = 4;
      });
      return;
    }

    await _finishOnboarding();
  }

  Future<void> _finishOnboarding() async {
    final selectedType = _selectedType;
    final selectedBrand = _selectedBrand;
    final selectedModel = _selectedModel;
    final year = _parseYear();
    final currentOdometerKm = _parseMileageInKm();

    final yearError = _validateYear();
    final mileageError = _validateMileage();

    setState(() {
      _yearErrorText = yearError;
      _mileageErrorText = mileageError;
    });

    if (selectedType == null ||
        selectedBrand == null ||
        selectedModel == null ||
        year == null ||
        currentOdometerKm == null) {
      return;
    }

    setState(() {
      _isSaving = true;
    });

    await widget.database.createVehicleProfile(
      vehicleTypeId: selectedType.id,
      vehicleBrandId: selectedBrand.id,
      vehicleModelId: selectedModel.id,
      year: year,
      currentOdometerKm: currentOdometerKm,
      odometerUnit: _odometerUnit,
      nickname: _trimToNull(_nicknameController.text),
      vehicleColor: _trimToNull(_colorController.text),
      vin: _trimToNull(_identificationController.text),
      plateNumber: _trimToNull(_plateNumberController.text),
    );

    if (!mounted) {
      return;
    }

    widget.onCompleted();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      _titleForStep(),
                      style: theme.textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _subtitleForStep(),
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: _currentStep == 0
                            ? _VehicleTypeStep(
                                key: const ValueKey('vehicle-type-step'),
                                vehicleTypes: _vehicleTypes,
                                selectedType: _selectedType,
                                onSelected: (type) {
                                  setState(() {
                                    _selectedType = type;
                                    _selectedBrand = null;
                                    _selectedModel = null;
                                    _identificationController.clear();
                                    _plateNumberController.clear();
                                    _nicknameController.clear();
                                    _colorController.clear();
                                  });
                                },
                              )
                            : _currentStep == 1
                            ? _VehicleCatalogStep(
                                key: const ValueKey('vehicle-catalog-step'),
                                selectedType: _selectedType,
                                selectedBrand: _selectedBrand,
                                selectedModel: _selectedModel,
                                onBack: () {
                                  setState(() {
                                    _currentStep = 0;
                                  });
                                },
                                onPickBrand: _pickBrand,
                                onPickModel: _pickModel,
                              )
                            : _currentStep == 2
                            ? _VehicleDetailsStep(
                                key: const ValueKey('vehicle-details-step'),
                                selectedBrand: _selectedBrand,
                                selectedModel: _selectedModel,
                                yearController: _yearController,
                                mileageController: _mileageController,
                                selectedUnit: _odometerUnit,
                                yearErrorText: _yearErrorText,
                                mileageErrorText: _mileageErrorText,
                                onBack: () {
                                  setState(() {
                                    _currentStep = 1;
                                  });
                                },
                                onUnitChanged: (unit) {
                                  setState(() {
                                    _odometerUnit = unit;
                                  });
                                },
                                onYearChanged: (_) {
                                  if (_yearErrorText != null) {
                                    setState(() {
                                      _yearErrorText = null;
                                    });
                                  }
                                },
                                onMileageChanged: (_) {
                                  if (_mileageErrorText != null) {
                                    setState(() {
                                      _mileageErrorText = null;
                                    });
                                  }
                                },
                              )
                            : _currentStep == 3
                            ? _VehicleIdentificationStep(
                                key: const ValueKey(
                                  'vehicle-identification-step',
                                ),
                                selectedType: _selectedType,
                                identificationController:
                                    _identificationController,
                                plateNumberController: _plateNumberController,
                                onBack: () {
                                  setState(() {
                                    _currentStep = 2;
                                  });
                                },
                                onSkip: _isSaving
                                    ? null
                                    : () {
                                        setState(() {
                                          if (_nicknameController.text
                                              .trim()
                                              .isEmpty) {
                                            _nicknameController.text =
                                                _generatedNickname;
                                          }
                                          _currentStep = 4;
                                        });
                                      },
                              )
                            : _VehiclePersonalizationStep(
                                key: const ValueKey(
                                  'vehicle-personalization-step',
                                ),
                                generatedNickname: _generatedNickname,
                                nicknameController: _nicknameController,
                                colorController: _colorController,
                                onBack: () {
                                  setState(() {
                                    _currentStep = 3;
                                  });
                                },
                                onSkip: _isSaving
                                    ? null
                                    : () {
                                        _finishOnboarding();
                                      },
                                onUseGeneratedNickname: () {
                                  setState(() {
                                    _nicknameController.text =
                                        _generatedNickname;
                                  });
                                },
                              ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: _currentStep == index ? 24 : 8,
                          decoration: BoxDecoration(
                            color: _currentStep == index
                                ? theme.colorScheme.primary
                                : AppColors.border,
                            borderRadius: BorderRadius.circular(999),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: _isSaving || !_canContinue
                            ? null
                            : _handleNext,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: _isSaving
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(_currentStep < 4 ? 'Next' : 'Finish'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  bool get _canContinue {
    if (_currentStep == 0) {
      return _selectedType != null;
    }

    if (_currentStep == 1) {
      return _selectedBrand != null && _selectedModel != null;
    }

    if (_currentStep == 2) {
      return _validateYear() == null && _validateMileage() == null;
    }

    return true;
  }

  String _titleForStep() {
    switch (_currentStep) {
      case 0:
        return 'What do you want to track?';
      case 1:
        return 'Choose your vehicle';
      case 2:
        return 'Add current details';
      case 3:
        return 'Add identification';
      case 4:
        return 'Personalize vehicle';
    }

    return 'Onboarding';
  }

  String _subtitleForStep() {
    switch (_currentStep) {
      case 0:
        return 'Select the vehicle type to start your setup.';
      case 1:
        return 'Pick the brand and model. Add a new one if it is missing.';
      case 2:
        return 'Set the year, current mileage, and unit for this vehicle.';
      case 3:
        return 'Add VIN, frame number, or plate number. You can skip this step.';
      case 4:
        return 'Add a nickname and color. You can skip this step.';
    }

    return '';
  }

  int? _parseYear() {
    return int.tryParse(_yearController.text.trim());
  }

  int? _parseMileageInKm() {
    final rawMileage = double.tryParse(_mileageController.text.trim());

    if (rawMileage == null || rawMileage <= 0) {
      return null;
    }

    if (_odometerUnit == 'miles') {
      return (rawMileage * 1.60934).round();
    }

    return rawMileage.round();
  }

  String? _validateYear() {
    final year = _parseYear();

    if (year == null) {
      return 'Enter a valid year';
    }

    final latestYear = DateTime.now().year + 1;
    if (year < 1886 || year > latestYear) {
      return 'Year must be between 1886 and $latestYear';
    }

    return null;
  }

  String? _validateMileage() {
    final rawMileage = double.tryParse(_mileageController.text.trim());

    if (rawMileage == null) {
      return 'Enter current mileage';
    }

    if (rawMileage <= 0) {
      return 'Mileage must be greater than 0';
    }

    return null;
  }

  String? _trimToNull(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  String get _generatedNickname {
    final brand = _selectedBrand?.name ?? '';
    final model = _selectedModel?.name ?? '';
    return '$brand $model'.trim();
  }
}

class _VehicleTypeStep extends StatelessWidget {
  const _VehicleTypeStep({
    super.key,
    required this.vehicleTypes,
    required this.selectedType,
    required this.onSelected,
  });

  final List<VehicleType> vehicleTypes;
  final VehicleType? selectedType;
  final ValueChanged<VehicleType> onSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: vehicleTypes.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final type = vehicleTypes[index];
        final isSelected = selectedType?.id == type.id;

        return Card(
          color: isSelected ? AppColors.accentSoft : AppColors.card,
          child: InkWell(
            borderRadius: BorderRadius.circular(AppRadius.lg),
            onTap: () => onSelected(type),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: isSelected
                        ? Colors.white
                        : AppColors.backgroundSoft,
                    child: Icon(
                      _iconForType(type.code),
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      type.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  if (isSelected)
                    Icon(Icons.check_circle, color: AppColors.accent),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  IconData _iconForType(String code) {
    switch (code) {
      case 'motorcycle':
        return Icons.two_wheeler;
      case 'bicycle':
        return Icons.pedal_bike;
      case 'car':
      default:
        return Icons.directions_car_filled_outlined;
    }
  }
}

class _VehicleCatalogStep extends StatelessWidget {
  const _VehicleCatalogStep({
    super.key,
    required this.selectedType,
    required this.selectedBrand,
    required this.selectedModel,
    required this.onBack,
    required this.onPickBrand,
    required this.onPickModel,
  });

  final VehicleType? selectedType;
  final VehicleBrand? selectedBrand;
  final VehicleModel? selectedModel;
  final VoidCallback onBack;
  final VoidCallback onPickBrand;
  final VoidCallback onPickModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton.icon(
          onPressed: onBack,
          style: TextButton.styleFrom(
            foregroundColor: AppColors.textPrimary,
            padding: EdgeInsets.zero,
          ),
          icon: const Icon(Icons.arrow_back),
          label: const Text('Back'),
        ),
        const SizedBox(height: 8),
        Chip(label: Text(selectedType?.name ?? 'Vehicle')),
        const SizedBox(height: 24),
        _SelectionField(
          label: 'Brand',
          value: selectedBrand?.name,
          hintText: 'Search and select brand',
          onTap: onPickBrand,
        ),
        const SizedBox(height: 16),
        _SelectionField(
          label: 'Model',
          value: selectedModel?.name,
          hintText: selectedBrand == null
              ? 'Select a brand first'
              : 'Search and select model',
          onTap: selectedBrand == null ? null : onPickModel,
        ),
      ],
    );
  }
}

class _VehicleDetailsStep extends StatelessWidget {
  const _VehicleDetailsStep({
    super.key,
    required this.selectedBrand,
    required this.selectedModel,
    required this.yearController,
    required this.mileageController,
    required this.selectedUnit,
    required this.yearErrorText,
    required this.mileageErrorText,
    required this.onBack,
    required this.onUnitChanged,
    required this.onYearChanged,
    required this.onMileageChanged,
  });

  final VehicleBrand? selectedBrand;
  final VehicleModel? selectedModel;
  final TextEditingController yearController;
  final TextEditingController mileageController;
  final String selectedUnit;
  final String? yearErrorText;
  final String? mileageErrorText;
  final VoidCallback onBack;
  final ValueChanged<String> onUnitChanged;
  final ValueChanged<String> onYearChanged;
  final ValueChanged<String> onMileageChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextButton.icon(
          onPressed: onBack,
          style: TextButton.styleFrom(
            foregroundColor: AppColors.textPrimary,
            padding: EdgeInsets.zero,
          ),
          icon: const Icon(Icons.arrow_back),
          label: const Text('Back'),
        ),
        const SizedBox(height: AppSpacing.xs),
        Chip(
          label: Text(
            '${selectedBrand?.name ?? ''} ${selectedModel?.name ?? ''}'.trim(),
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        TextField(
          controller: yearController,
          keyboardType: TextInputType.number,
          onChanged: onYearChanged,
          decoration: InputDecoration(
            labelText: 'Year ⭐️',
            hintText: 'e.g. 2022',
            errorText: yearErrorText,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          'Current mileage ⭐️',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: AppSpacing.xs),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                controller: mileageController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onChanged: onMileageChanged,
                decoration: InputDecoration(
                  hintText: 'Enter mileage',
                  errorText: mileageErrorText,
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'km', label: Text('km')),
                ButtonSegment(value: 'miles', label: Text('miles')),
              ],
              selected: {selectedUnit},
              onSelectionChanged: (selection) {
                onUnitChanged(selection.first);
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _VehicleIdentificationStep extends StatelessWidget {
  const _VehicleIdentificationStep({
    super.key,
    required this.selectedType,
    required this.identificationController,
    required this.plateNumberController,
    required this.onBack,
    required this.onSkip,
  });

  final VehicleType? selectedType;
  final TextEditingController identificationController;
  final TextEditingController plateNumberController;
  final VoidCallback onBack;
  final VoidCallback? onSkip;

  @override
  Widget build(BuildContext context) {
    final identificationLabel = selectedType?.code == 'car'
        ? 'VIN'
        : 'Frame number';

    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: onBack,
              style: TextButton.styleFrom(
                foregroundColor: AppColors.textPrimary,
                padding: EdgeInsets.zero,
              ),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back'),
            ),
            TextButton(onPressed: onSkip, child: const Text('Skip')),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        TextField(
          controller: identificationController,
          decoration: InputDecoration(
            labelText: '$identificationLabel (optional)',
            hintText: selectedType?.code == 'car'
                ? 'Enter VIN'
                : 'Enter frame number',
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        TextField(
          controller: plateNumberController,
          decoration: const InputDecoration(
            labelText: 'Plate number',
            hintText: 'Enter plate number',
          ),
        ),
      ],
    );
  }
}

class _VehiclePersonalizationStep extends StatelessWidget {
  const _VehiclePersonalizationStep({
    super.key,
    required this.generatedNickname,
    required this.nicknameController,
    required this.colorController,
    required this.onBack,
    required this.onSkip,
    required this.onUseGeneratedNickname,
  });

  final String generatedNickname;
  final TextEditingController nicknameController;
  final TextEditingController colorController;
  final VoidCallback onBack;
  final VoidCallback? onSkip;
  final VoidCallback onUseGeneratedNickname;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: onBack,
              style: TextButton.styleFrom(
                foregroundColor: AppColors.textPrimary,
                padding: EdgeInsets.zero,
              ),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back'),
            ),
            TextButton(onPressed: onSkip, child: const Text('Skip')),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        TextField(
          controller: nicknameController,
          decoration: const InputDecoration(
            labelText: 'Nickname',
            hintText: 'My car, Work bike',
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Align(
          alignment: Alignment.centerLeft,
          child: OutlinedButton.icon(
            onPressed: generatedNickname.isEmpty
                ? null
                : onUseGeneratedNickname,
            icon: const Icon(Icons.auto_awesome),
            label: Text('Use "$generatedNickname"'),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        TextField(
          controller: colorController,
          decoration: const InputDecoration(
            labelText: 'Color',
            hintText: 'White, Black, Blue',
          ),
        ),
      ],
    );
  }
}

class _SelectionField extends StatelessWidget {
  const _SelectionField({
    required this.label,
    required this.value,
    required this.hintText,
    required this.onTap,
  });

  final String label;
  final String? value;
  final String hintText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        InkWell(
          borderRadius: BorderRadius.circular(AppRadius.md),
          onTap: onTap,
          child: InputDecorator(
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: const Icon(Icons.expand_more),
            ),
            child: Text(
              value ?? hintText,
              style: value == null
                  ? Theme.of(context).textTheme.bodyMedium
                  : Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ],
    );
  }
}

class _SearchPickerSheet<T> extends StatefulWidget {
  const _SearchPickerSheet({
    required this.title,
    required this.search,
    required this.itemLabel,
    required this.createLabel,
    required this.onCreate,
  });

  final String title;
  final Future<List<T>> Function(String query) search;
  final String Function(T item) itemLabel;
  final String Function(String value) createLabel;
  final Future<T> Function(String value) onCreate;

  @override
  State<_SearchPickerSheet<T>> createState() => _SearchPickerSheetState<T>();
}

class _SearchPickerSheetState<T> extends State<_SearchPickerSheet<T>> {
  final TextEditingController _searchController = TextEditingController();

  bool _isLoading = true;
  bool _isCreating = false;
  List<T> _items = const [];

  @override
  void initState() {
    super.initState();
    _loadItems();
    _searchController.addListener(_loadItems);
  }

  @override
  void dispose() {
    _searchController.removeListener(_loadItems);
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadItems() async {
    final items = await widget.search(_searchController.text);

    if (!mounted) {
      return;
    }

    setState(() {
      _items = items;
      _isLoading = false;
    });
  }

  Future<void> _createItem() async {
    final value = _searchController.text.trim();

    if (value.isEmpty) {
      return;
    }

    setState(() {
      _isCreating = true;
    });

    final item = await widget.onCreate(value);

    if (!mounted) {
      return;
    }

    Navigator.of(context).pop(item);
  }

  @override
  Widget build(BuildContext context) {
    final query = _searchController.text.trim();

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.viewInsetsOf(context).bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 16),
          Flexible(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    shrinkWrap: true,
                    children: [
                      ..._items.map(
                        (item) => ListTile(
                          title: Text(widget.itemLabel(item)),
                          onTap: () => Navigator.of(context).pop(item),
                        ),
                      ),
                      if (query.isNotEmpty)
                        ListTile(
                          leading: _isCreating
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Icon(Icons.add_circle_outline),
                          title: Text(widget.createLabel(query)),
                          onTap: _isCreating ? null : _createItem,
                        ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
