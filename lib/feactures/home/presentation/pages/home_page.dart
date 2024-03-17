import 'package:amritha_ayurveda/core/constants/app_assets_constants.dart';
import 'package:amritha_ayurveda/core/constants/home_constatnts.dart';
import 'package:amritha_ayurveda/core/themes/app_theme.dart';
import 'package:amritha_ayurveda/core/widgets/button_widget.dart';
import 'package:amritha_ayurveda/feactures/home/presentation/pages/branch_page.dart';
import 'package:amritha_ayurveda/feactures/home/presentation/pages/registration_page.dart';
import 'package:amritha_ayurveda/feactures/home/presentation/pages/treatment_page.dart';
import 'package:amritha_ayurveda/feactures/home/presentation/provider/patient_provider.dart';
import 'package:amritha_ayurveda/feactures/home/presentation/widgets/container_widget.dart';
import 'package:amritha_ayurveda/feactures/home/presentation/widgets/home_page_shimmer_widget.dart';
import 'package:amritha_ayurveda/feactures/home/presentation/widgets/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final constants = HomeConstants();
    final appAssets = AppAssetsConstants();

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: theme.spaces.space_100),
          child: Text(
            constants.txtHome,
            style: theme.typography.h600.copyWith(fontSize: 24),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: theme.spaces.space_200),
            child: SvgPicture.asset(appAssets.icNotification),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContainerWidget(
              text: constants.txtShowBranches,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BranchPage(),
                  ),
                );
              },
            ),
            ContainerWidget(
              text: constants.txtShowTreatments,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TreatmentPage(),
                  ),
                );
              },
            ),
            SizedBox(
              height: theme.spaces.space_200,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.spaces.space_300),
              child: Text(
                constants.txtPatientDetails,
                style: theme.typography.h600.copyWith(
                  fontSize: theme.spaces.space_250,
                ),
              ),
            ),
            FutureBuilder(
              future: context.watch<PatientProvider>().getPatient(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListViewWidget(entity: snapshot.data!);
                } else if (snapshot.hasError) {
                  return Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colors.secondary),
                      onPressed: () {
                        context.read<PatientProvider>().getPatient();
                      },
                      child: const Text(
                        'Retry',
                      ),
                    ),
                  );
                }
                return
                    // Center(
                    //   child: CircularProgressIndicator(
                    //     color: theme.colors.primary,
                    //   ),
                    // );
                    const Column(
                  children: [
                    HomePageShimmer(),
                  ],
                );
              },
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonWidget(
          buttonName: constants.txtRegister,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegistrationPage(),
              ),
            );
          }),
    );
  }
}
