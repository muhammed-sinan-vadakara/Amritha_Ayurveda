import 'package:amritha_ayurveda/core/constants/app_assets_constants.dart';
import 'package:amritha_ayurveda/feactures/authentication/presentation/provider/auth_redirection_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashSrceen extends StatefulWidget {
  const SplashSrceen({super.key});

  @override
  State<SplashSrceen> createState() => _SplashSrceenState();
}

class _SplashSrceenState extends State<SplashSrceen> {
  @override
  void initState() {
    context.read<AuthProvider>().authRedirect(context);
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => context.watch<AuthProvider>().initialWidget,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppAssetsConstants().imgSplash,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
