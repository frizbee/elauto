import 'package:flutter/material.dart';

void main() {
  runApp(const ElAutoApp());
}

class ElAutoApp extends StatelessWidget {
  const ElAutoApp({super.key});

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

  late final Future<void> _initialization;

  @override
  void initState() {
    super.initState();
    _initialization = _loadApp();
  }

  Future<void> _loadApp() async {
    final startupWatch = Stopwatch()..start();

    await WidgetsBinding.instance.endOfFrame;

    if (!mounted) {
      return;
    }

    await precacheImage(
      const AssetImage('assets/images/logo.png'),
      context,
    );

    startupWatch.stop();

    final remainingSplashTime =
        _minimumSplashDuration - startupWatch.elapsed;

    if (remainingSplashTime > Duration.zero) {
      await Future<void>.delayed(remainingSplashTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const SplashScreen();
        }

        return const DashboardScreen();
      },
    );
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

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SizedBox.expand(
      child: Center(
        child: Text('Dashboard'),
      ),
    ));
  }
}
