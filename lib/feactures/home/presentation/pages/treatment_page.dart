import 'package:amritha_ayurveda/core/constants/home_constatnts.dart';
import 'package:amritha_ayurveda/core/themes/app_theme.dart';
import 'package:amritha_ayurveda/feactures/home/presentation/provider/treatment_provider.dart';
import 'package:amritha_ayurveda/feactures/home/presentation/widgets/treatment_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TreatmentPage extends StatelessWidget {
  const TreatmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final constants = HomeConstants();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          constants.txtTreatmnts,
          style: theme.typography.h600.copyWith(fontSize: 24),
        ),
      ),
      body: FutureBuilder(
        future: context.watch<TreatmentProvider>().getTreatment(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ShowTreatmentWidget(entity: snapshot.data!);
          } else if (snapshot.hasError) {
            return Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colors.secondary),
                onPressed: () {
                  context.read<TreatmentProvider>().getTreatment();
                },
                child: const Text(
                  'Retry',
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
