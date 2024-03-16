import 'package:amritha_ayurveda/core/dependencies/setup_dependencies.dart';
import 'package:amritha_ayurveda/feactures/authentication/presentation/provider/auth_redirection_provider.dart';
import 'package:amritha_ayurveda/feactures/authentication/presentation/provider/login_provider.dart';
import 'package:amritha_ayurveda/feactures/home/presentation/provider/branch_provider.dart';
import 'package:amritha_ayurveda/feactures/home/presentation/provider/patient_provider.dart';
import 'package:amritha_ayurveda/feactures/home/presentation/provider/treatment_provider.dart';
import 'package:amritha_ayurveda/feactures/splash_screen/splash_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupDependencies();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => LoginProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => AuthProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => BranchProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => TreatmentProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => PatientProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthProvider>().authRedirect(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: GetIt.I.get<ThemeData>(),
        home: const SplashSrceen());
  }
}
