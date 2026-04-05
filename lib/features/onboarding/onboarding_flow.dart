import 'package:flutter/material.dart';

import '../../data/local/app_database.dart';

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

  @override
  void initState() {
    super.initState();
    _loadVehicleTypes();
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

    final selectedType = _selectedType;
    final selectedBrand = _selectedBrand;
    final selectedModel = _selectedModel;

    if (selectedType == null ||
        selectedBrand == null ||
        selectedModel == null) {
      return;
    }

    setState(() {
      _isSaving = true;
    });

    await widget.database.createVehicleProfile(
      vehicleTypeId: selectedType.id,
      vehicleBrandId: selectedBrand.id,
      vehicleModelId: selectedModel.id,
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
                      _currentStep == 0
                          ? 'What do you want to track?'
                          : 'Choose your vehicle',
                      style: theme.textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _currentStep == 0
                          ? 'Select the vehicle type to start your setup.'
                          : 'Pick the brand and model. Add a new one if it is missing.',
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
                                  });
                                },
                              )
                            : _VehicleCatalogStep(
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
                              ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        2,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: _currentStep == index ? 24 : 8,
                          decoration: BoxDecoration(
                            color: _currentStep == index
                                ? theme.colorScheme.primary
                                : theme.colorScheme.outlineVariant,
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
                              : Text(_currentStep == 0 ? 'Next' : 'Finish'),
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

    return _selectedBrand != null && _selectedModel != null;
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
          color: isSelected
              ? Theme.of(context).colorScheme.primaryContainer
              : null,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => onSelected(type),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    child: Icon(_iconForType(type.code)),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      type.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  if (isSelected)
                    Icon(
                      Icons.check_circle,
                      color: Theme.of(context).colorScheme.primary,
                    ),
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
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: InputDecorator(
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              suffixIcon: const Icon(Icons.expand_more),
            ),
            child: Text(value ?? hintText),
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
              border: OutlineInputBorder(),
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
