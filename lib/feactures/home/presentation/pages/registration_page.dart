import 'package:amritha_ayurveda/core/constants/app_assets_constants.dart';
import 'package:amritha_ayurveda/core/constants/home_constatnts.dart';
import 'package:amritha_ayurveda/core/themes/app_theme.dart';
import 'package:amritha_ayurveda/core/widgets/button_widget.dart';
import 'package:amritha_ayurveda/core/widgets/subtitle_widget.dart';
import 'package:amritha_ayurveda/core/widgets/textfield_widget.dart';
import 'package:amritha_ayurveda/feactures/home/presentation/widgets/payment_otion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

class RegistrationPage extends HookWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final whatsappController = useTextEditingController();
    final addressController = useTextEditingController();
    final locationController = useTextEditingController();
    final branchController = useTextEditingController();
    final totalamountController = useTextEditingController();
    final discountamountController = useTextEditingController();
    final advanceamountController = useTextEditingController();
    final balanceamountController = useTextEditingController();
    final treatmentdateController = useTextEditingController();
    final theme = AppTheme.of(context);
    final constants = HomeConstants();
    final appAssets = AppAssetsConstants();

    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            appBar: AppBar(
              title: Text(constants.txtRegister),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: theme.spaces.space_200),
                  child: SvgPicture.asset(appAssets.icNotification),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: theme.spaces.space_400),
                child: Column(
                  children: [
                    SubTitleWidget(
                      title: constants.txtName,
                    ),
                    SizedBox(
                      height: theme.spaces.space_100,
                    ),
                    TextFieldWidget(
                      labelText: constants.txtEnter + constants.txtfulName,
                      controller: nameController,
                    ),
                    SizedBox(
                      height: theme.spaces.space_200,
                    ),
                    SubTitleWidget(
                      title: constants.txtNumber,
                    ),
                    SizedBox(
                      height: theme.spaces.space_100,
                    ),
                    TextFieldWidget(
                      labelText:
                          constants.txtEnter + constants.txtWhatsappNumber,
                      controller: whatsappController,
                    ),
                    SizedBox(
                      height: theme.spaces.space_200,
                    ),
                    SubTitleWidget(
                      title: constants.txtAddress,
                    ),
                    SizedBox(
                      height: theme.spaces.space_100,
                    ),
                    TextFieldWidget(
                      labelText: constants.txtEnter + constants.txtfullAddress,
                      controller: addressController,
                    ),
                    SizedBox(
                      height: theme.spaces.space_200,
                    ),
                    SubTitleWidget(
                      title: constants.txtLocation,
                    ),
                    SizedBox(
                      height: theme.spaces.space_100,
                    ),
                    TextFieldWidget(
                      labelText: constants.txtEnter + constants.txtLocation,
                      icon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_drop_down),
                      ),
                      controller: locationController,
                    ),
                    SizedBox(
                      height: theme.spaces.space_200,
                    ),
                    SubTitleWidget(
                      title: constants.txtBranch,
                    ),
                    SizedBox(
                      height: theme.spaces.space_100,
                    ),
                    TextFieldWidget(
                      icon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_drop_down),
                      ),
                      labelText: constants.txtEnter + constants.txtBranch,
                      controller: branchController,
                    ),
                    SizedBox(
                      height: theme.spaces.space_200,
                    ),
                    SubTitleWidget(
                      title: constants.txtTotalAmount,
                    ),
                    SizedBox(
                      height: theme.spaces.space_100,
                    ),
                    TextFieldWidget(
                      labelText: constants.txtEnter + constants.txtTotalAmount,
                      controller: totalamountController,
                    ),
                    SizedBox(
                      height: theme.spaces.space_200,
                    ),
                    SubTitleWidget(
                      title: constants.txtDiscountAmount,
                    ),
                    SizedBox(
                      height: theme.spaces.space_100,
                    ),
                    TextFieldWidget(
                      labelText:
                          constants.txtEnter + constants.txtDiscountAmount,
                      controller: discountamountController,
                    ),
                    SizedBox(
                      height: theme.spaces.space_200,
                    ),
                    SubTitleWidget(
                      title: constants.txtPaymentoption,
                    ),
                    SizedBox(
                      height: theme.spaces.space_100,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: theme.spaces.space_200),
                      child: SizedBox(
                        height: theme.spaces.space_400,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            PaymentOptionWidget(options: constants.txtCash),
                            PaymentOptionWidget(options: constants.txtCard),
                            PaymentOptionWidget(options: constants.txtUpi),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: theme.spaces.space_200,
                    ),
                    SubTitleWidget(
                      title: constants.txtAdvanceAmount,
                    ),
                    SizedBox(
                      height: theme.spaces.space_100,
                    ),
                    TextFieldWidget(
                      labelText:
                          constants.txtEnter + constants.txtAdvanceAmount,
                      controller: advanceamountController,
                    ),
                    SizedBox(
                      height: theme.spaces.space_200,
                    ),
                    SubTitleWidget(
                      title: constants.txtBalnceAmount,
                    ),
                    SizedBox(
                      height: theme.spaces.space_100,
                    ),
                    TextFieldWidget(
                      labelText: constants.txtEnter + constants.txtBalnceAmount,
                      controller: balanceamountController,
                    ),
                    SizedBox(
                      height: theme.spaces.space_200,
                    ),
                    SubTitleWidget(
                      title: constants.txtDate,
                    ),
                    SizedBox(
                      height: theme.spaces.space_100,
                    ),
                    TextFieldWidget(
                      labelText: constants.txtEnter + constants.txtDate,
                      controller: treatmentdateController,
                      icon: const Icon(Icons.calendar_month),
                    ),
                    SizedBox(
                      height: theme.spaces.space_400,
                    ),
                  ],
                ),
              ),
            ),
            extendBody: true,
            bottomNavigationBar: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: ButtonWidget(
                  buttonName: constants.txtSave,
                  onPressed: () async {
                    // await context.read<PatientProvider>().addPatient(nameController.text, phone, whatsappController.text, addressController.text, locationController.text,totalamountController.text, discountAmount, payment, balanceAmount, advanceAmount, treatmentDate, treatmentTime)
                  }),
            )),
      ),
    );
  }
}
