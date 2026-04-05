import 'package:flutter/material.dart';

import 'data/local/app_database.dart';
import 'features/dashboard/dashboard_screen.dart';
import 'features/onboarding/onboarding_flow.dart';

void main() {
  runApp(const RepackApp());
}

class RepackApp extends StatelessWidget {
  const RepackApp({super.key});

  @override
  Widget build(BuildContext context) {
    const splashBackgroundColor = Color(0xFFF7F7F7);
    const brandOrange = Color(0xFFFF7A00);

    return MaterialApp(
      title: 'Repack',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: brandOrange,
          surface: splashBackgroundColor,
        ),
        scaffoldBackgroundColor: splashBackgroundColor,
        useMaterial3: true,
      ),
      home: const AppStartupGate(),
    );
  }
}

class AppStartupGate extends StatefulWidget {
  const AppStartupGate({super.key});

  @override
  State<AppStartupGate> createState() => _AppStartupGateState();
}

class _AppStartupGateState extends State<AppStartupGate> {
  static const _minimumSplashDuration = Duration(milliseconds: 1200);

  late final AppDatabase _database;
  _AppView _currentView = _AppView.loading;

  @override
  void initState() {
    super.initState();
    _database = AppDatabase();
    _initializeApp();
  }

  @override
  void dispose() {
    _database.close();
    super.dispose();
  }

  Future<void> _initializeApp() async {
    final startupWatch = Stopwatch()..start();

    await WidgetsBinding.instance.endOfFrame;

    if (mounted) {
      await precacheImage(const AssetImage('assets/images/logo.png'), context);
    }

    final hasVehicleProfile = await _database.getPrimaryVehicle() != null;

    startupWatch.stop();
    final remainingSplashTime = _minimumSplashDuration - startupWatch.elapsed;

    if (remainingSplashTime > Duration.zero) {
      await Future<void>.delayed(remainingSplashTime);
    }

    if (!mounted) {
      return;
    }

    setState(() {
      _currentView = hasVehicleProfile
          ? _AppView.dashboard
          : _AppView.onboarding;
    });
  }

  void _handleOnboardingCompleted() {
    setState(() {
      _currentView = _AppView.dashboard;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_currentView) {
      case _AppView.loading:
        return const SplashScreen();
      case _AppView.onboarding:
        return OnboardingFlow(
          database: _database,
          onCompleted: _handleOnboardingCompleted,
        );
      case _AppView.dashboard:
        return DashboardScreen(database: _database);
    }
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Image(
            image: AssetImage('assets/images/logo.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

enum _AppView { loading, onboarding, dashboard }
