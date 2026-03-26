// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:internet_connection_checker/internet_connection_checker.dart';

// Project imports:
import 'package:translatorx/constants/enums.dart';
import 'package:translatorx/features/home_screen/presentation/widgets/no_network.dart';
import 'package:translatorx/features/home_screen/presentation/widgets/split_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StreamSubscription<InternetConnectionStatus>? _internetSubscription;
  bool hasInternet = true;

  @override
  void initState() {
    super.initState();

    if (!kIsWeb) {
      _internetSubscription =
          InternetConnectionChecker().onStatusChange.listen((status) {
        if (!mounted) return;

        setState(() {
          hasInternet = status != InternetConnectionStatus.disconnected;
        });
      });
    }
  }

  @override
  void dispose() {
    _internetSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          final bool? exitResult = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Please confirm'),
              content: const Text('Do you want to exit the app?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text(
                    'No',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          );
          return exitResult ?? false;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              const Column(
                children: [
                  SplitScreen(
                    userScreen: User.guest,
                  ),
                  Divider(
                    color: Color.fromARGB(255, 213, 210, 210),
                    height: 2,
                    thickness: 8,
                  ),
                  SplitScreen(
                    userScreen: User.host,
                  ),
                ],
              ),
              if (!hasInternet) const NoNetwork(),
            ],
          ),
        ),
      ),
    );
  }
}
