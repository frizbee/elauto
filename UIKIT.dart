import 'package:flutter/material.dart';

void main() {
  runApp(const RepairTrackDemoApp());
}

class RepairTrackDemoApp extends StatelessWidget {
  const RepairTrackDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Repair & Track UI Kit',
      theme: RepairTrackTheme.light(),
      home: const DashboardDemoPage(),
    );
  }
}

class RepairTrackTheme {
  static ThemeData light() {
    const scheme = ColorScheme.light(
      primary: RTColors.accent,
      secondary: RTColors.accentSoft,
      surface: RTColors.card,
      error: RTColors.danger,
      onPrimary: Colors.white,
      onSecondary: RTColors.textPrimary,
      onSurface: RTColors.textPrimary,
      onError: Colors.white,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: RTColors.background,
      fontFamily: 'Inter',
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          color: RTColors.textPrimary,
          height: 1.05,
        ),
        headlineLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: RTColors.textPrimary,
        ),
        headlineMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: RTColors.textPrimary,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: RTColors.textPrimary,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: RTColors.textPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: RTColors.textPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: RTColors.textSecondary,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: RTColors.textMuted,
        ),
      ),
      cardTheme: CardThemeData(
        color: RTColors.card,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: RTColors.border),
        ),
        margin: EdgeInsets.zero,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: RTColors.card,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: RTColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: RTColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: RTColors.accent, width: 1.4),
        ),
        hintStyle: const TextStyle(
          color: RTColors.textMuted,
          fontSize: 14,
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: RTColors.backgroundSoft,
        selectedColor: RTColors.accentSoft,
        disabledColor: RTColors.border,
        side: const BorderSide(color: RTColors.border),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
        labelStyle: const TextStyle(
          color: RTColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: RTColors.border,
        thickness: 1,
        space: 1,
      ),
    );
  }
}

class RTColors {
  static const accent = Color(0xFFFF6A00);
  static const accentSoft = Color(0xFFFFE7D6);
  static const background = Color(0xFFF6F7F9);
  static const backgroundSoft = Color(0xFFF0F2F5);
  static const card = Colors.white;
  static const border = Color(0xFFE6E8EC);
  static const textPrimary = Color(0xFF121417);
  static const textSecondary = Color(0xFF5D6672);
  static const textMuted = Color(0xFF8C95A1);
  static const success = Color(0xFF16A34A);
  static const warning = Color(0xFFF59E0B);
  static const danger = Color(0xFFDC2626);
  static const info = Color(0xFF2563EB);
}

class RTSpacing {
  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 20;
  static const double xl = 24;
  static const double xxl = 32;
}

class RTRadius {
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 20;
  static const double xl = 24;
  static const double full = 999;
}

class RTShadows {
  static const List<BoxShadow> soft = [
    BoxShadow(
      color: Color(0x0F101828),
      blurRadius: 24,
      offset: Offset(0, 10),
    ),
  ];
}

class RTButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool secondary;
  final bool expanded;

  const RTButton({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
    this.secondary = false,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    final child = secondary
        ? OutlinedButton.icon(
            onPressed: onPressed,
            icon: icon == null ? const SizedBox.shrink() : Icon(icon, size: 18),
            label: Text(label),
            style: OutlinedButton.styleFrom(
              foregroundColor: RTColors.textPrimary,
              side: const BorderSide(color: RTColors.border),
              backgroundColor: Colors.white,
              minimumSize: const Size.fromHeight(52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(RTRadius.md),
              ),
              textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          )
        : FilledButton.icon(
            onPressed: onPressed,
            icon: icon == null ? const SizedBox.shrink() : Icon(icon, size: 18),
            label: Text(label),
            style: FilledButton.styleFrom(
              backgroundColor: RTColors.accent,
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(RTRadius.md),
              ),
              textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          );

    if (!expanded) return child;
    return SizedBox(width: double.infinity, child: child);
  }
}

class RTCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const RTCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(RTSpacing.lg),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: RTColors.card,
        borderRadius: BorderRadius.circular(RTRadius.xl),
        border: Border.all(color: RTColors.border),
        boxShadow: RTShadows.soft,
      ),
      child: child,
    );
  }
}

class RTSectionHeader extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  const RTSectionHeader({
    super.key,
    required this.title,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        if (actionLabel != null)
          TextButton(
            onPressed: onAction,
            child: Text(actionLabel!),
          ),
      ],
    );
  }
}

class RTStatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color tint;

  const RTStatCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    required this.tint,
  });

  @override
  Widget build(BuildContext context) {
    return RTCard(
      padding: const EdgeInsets.all(RTSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: tint.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: tint),
          ),
          const SizedBox(height: RTSpacing.md),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: RTSpacing.xs),
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class RTQuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool highlighted;
  final VoidCallback? onTap;

  const RTQuickAction({
    super.key,
    required this.icon,
    required this.label,
    this.highlighted = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          decoration: BoxDecoration(
            color: highlighted ? RTColors.accentSoft : Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: highlighted ? RTColors.accent.withOpacity(0.25) : RTColors.border,
            ),
          ),
          child: Column(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: highlighted ? RTColors.accent.withOpacity(0.3) : RTColors.border,
                  ),
                  boxShadow: RTShadows.soft,
                ),
                child: Icon(
                  icon,
                  color: highlighted ? RTColors.accent : RTColors.textPrimary,
                ),
              ),
              const SizedBox(height: RTSpacing.sm),
              Text(
                label,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RTRepairItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final IconData icon;

  const RTRepairItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return RTCard(
      padding: const EdgeInsets.all(RTSpacing.md),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: RTColors.accent,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: RTSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 4),
                Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: RTColors.accentSoft,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              price,
              style: const TextStyle(
                color: RTColors.accent,
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RTMileageCard extends StatelessWidget {
  const RTMileageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return RTCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sonata (DN8)', style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: RTSpacing.xs),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: RTColors.backgroundSoft,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        '2021 Model • Petrol',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: RTColors.textSecondary,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.notifications_none_rounded),
            ],
          ),
          const SizedBox(height: RTSpacing.lg),
          Container(
            height: 160,
            decoration: BoxDecoration(
              color: RTColors.background,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Icon(Icons.directions_car_filled_rounded, size: 84, color: RTColors.textMuted),
            ),
          ),
          const SizedBox(height: RTSpacing.lg),
          Row(
            children: [
              Expanded(
                child: _MetricBlock(
                  label: 'Current Mileage',
                  value: '45,680 km',
                  hint: '+1,230 km since last service',
                  hintColor: RTColors.success,
                ),
              ),
              const SizedBox(width: RTSpacing.md),
              SizedBox(
                width: 140,
                child: RTButton(
                  label: 'View Details',
                  secondary: true,
                  expanded: true,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MetricBlock extends StatelessWidget {
  final String label;
  final String value;
  final String hint;
  final Color hintColor;

  const _MetricBlock({
    required this.label,
    required this.value,
    required this.hint,
    required this.hintColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 8),
        Text(value, style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: 6),
        Text(
          hint,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: hintColor,
                fontWeight: FontWeight.w700,
              ),
        ),
      ],
    );
  }
}

class DashboardDemoPage extends StatelessWidget {
  const DashboardDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        backgroundColor: Colors.white,
        indicatorColor: RTColors.accentSoft,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_rounded), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.build_outlined), selectedIcon: Icon(Icons.build_rounded), label: 'Repairs'),
          NavigationDestination(icon: Icon(Icons.add_circle_outline_rounded), selectedIcon: Icon(Icons.add_circle_rounded), label: 'Add'),
          NavigationDestination(icon: Icon(Icons.bar_chart_outlined), selectedIcon: Icon(Icons.bar_chart_rounded), label: 'Stats'),
          NavigationDestination(icon: Icon(Icons.grid_view_outlined), selectedIcon: Icon(Icons.grid_view_rounded), label: 'More'),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(RTSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: RTSpacing.sm),
              Text('Hello.', style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(height: RTSpacing.xs),
              Text(
                'Your car, your repairs, all tracked.',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: RTColors.textSecondary,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const SizedBox(height: RTSpacing.lg),
              const RTMileageCard(),
              const SizedBox(height: RTSpacing.md),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: RTSpacing.md,
                mainAxisSpacing: RTSpacing.md,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1.2,
                children: const [
                  RTStatCard(
                    icon: Icons.build_circle_outlined,
                    value: '7',
                    label: 'Total Repairs',
                    tint: RTColors.accent,
                  ),
                  RTStatCard(
                    icon: Icons.route_outlined,
                    value: '12,340 km',
                    label: 'Tracked Distance',
                    tint: RTColors.info,
                  ),
                  RTStatCard(
                    icon: Icons.check_circle_outline_rounded,
                    value: '3',
                    label: 'Upcoming Services',
                    tint: RTColors.success,
                  ),
                  RTStatCard(
                    icon: Icons.account_balance_wallet_outlined,
                    value: '41,250',
                    label: 'Total Spent',
                    tint: Color(0xFF7C3AED),
                  ),
                ],
              ),
              const SizedBox(height: RTSpacing.xl),
              const RTSectionHeader(title: 'Quick Actions', actionLabel: 'See All'),
              const SizedBox(height: RTSpacing.md),
              Row(
                children: const [
                  RTQuickAction(icon: Icons.lock_outline_rounded, label: 'Lock/Unlock'),
                  SizedBox(width: RTSpacing.sm),
                  RTQuickAction(icon: Icons.play_arrow_rounded, label: 'Start Tracking', highlighted: true),
                  SizedBox(width: RTSpacing.sm),
                  RTQuickAction(icon: Icons.handyman_outlined, label: 'Add Repair'),
                ],
              ),
              const SizedBox(height: RTSpacing.xl),
              const RTSectionHeader(title: 'Recent Repairs', actionLabel: 'See All'),
              const SizedBox(height: RTSpacing.md),
              const RTRepairItem(
                title: 'Brake Pads Replaced',
                subtitle: 'Nov 10, 2021 • 44,450 km',
                price: '120',
                icon: Icons.car_repair_rounded,
              ),
              const SizedBox(height: RTSpacing.md),
              const RTRepairItem(
                title: 'Oil Change',
                subtitle: 'Oct 22, 2021 • 42,900 km',
                price: '75',
                icon: Icons.opacity_rounded,
              ),
              const SizedBox(height: RTSpacing.xl),
              RTCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('UI Kit Buttons', style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: RTSpacing.md),
                    const RTButton(label: 'Primary Action', icon
