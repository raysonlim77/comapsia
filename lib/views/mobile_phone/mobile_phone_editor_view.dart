import 'package:compasia/models/mobile_phone.dart';
import 'package:compasia/repositories/mobile_phone_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/string_validator.dart';
import '../../view_models/mobile_phone_editor_view_model.dart';
import '../../widgets/app_button.dart';
import '../../widgets/custom_formfield.dart';

class MobilePhoneEditorView extends StatefulWidget {
  final MobilePhone? mobilePhone;
  const MobilePhoneEditorView({
    Key? key,
    this.mobilePhone,
  }) : super(key: key);

  @override
  _MobilePhoneEditorViewState createState() => _MobilePhoneEditorViewState();
}

class _MobilePhoneEditorViewState extends State<MobilePhoneEditorView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      MobilePhoneEditorViewModel viewModel =
          Provider.of<MobilePhoneEditorViewModel>(context, listen: false);
      viewModel.setInit(mobilePhone: widget.mobilePhone);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MobilePhoneEditorViewModel>(
        builder: (context, viewModel, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Mobile Phone List'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: viewModel.formKey,
            child: Column(children: [
              CustomFormField(
                headingText: "Name",
                hintText: "Name",
                obsecureText: false,
                controller: viewModel.nameController,
                maxLines: 1,
                textInputType: TextInputType.emailAddress,
                validator: (value) =>
                    StringValidator.fieldValidator(value: value),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomFormField(
                headingText: "Variant",
                maxLines: 1,
                hintText: "Variant",
                obsecureText: false,
                controller: viewModel.variantController,
                validator: (value) =>
                    StringValidator.fieldValidator(value: value),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomFormField(
                headingText: "Imei",
                maxLines: 1,
                hintText: "Imei",
                obsecureText: false,
                controller: viewModel.imeiController,
                validator: (value) =>
                    StringValidator.fieldValidator(value: value),
              ),
              const SizedBox(
                height: 16,
              ),
              AppButton(
                onTap: () async {
                  widget.mobilePhone != null
                      ? viewModel.onEdit(
                          context,
                        )
                      : viewModel.onCreate(context);
                },
                isLoading: viewModel.isSubmitting,
                text: widget.mobilePhone != null ? "Edit" : "Create",
              ),
            ]),
          ),
        ),
      );
    });
  }
}
