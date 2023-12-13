import 'package:compasia/helpers/utils.dart';
import 'package:compasia/models/mobile_phone.dart';
import 'package:compasia/repositories/mobile_phone_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mobile_phone_view_model.dart';

class MobilePhoneEditorViewModel extends ChangeNotifier {
  MobilePhone _mobilePhone = MobilePhone.create();
  MobilePhone get mobilePhone => _mobilePhone;
  bool _isSubmitting = false;
  bool get isSubmitting => _isSubmitting;
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController variantController = TextEditingController();
  TextEditingController imeiController = TextEditingController();

  void clearForm() {
    nameController.clear();
    variantController.clear();
    imeiController.clear();
  }

  Future<void> setInit({MobilePhone? mobilePhone}) async {
    if (mobilePhone != null) {
      _mobilePhone = mobilePhone;
      nameController.text = mobilePhone.name;
      variantController.text = mobilePhone.variant;
      imeiController.text = mobilePhone.imei;
    }
  }

  Future<void> onCreate(
    BuildContext context,
  ) async {
    FocusScope.of(context).unfocus();
    formKey.currentState?.save();
    if (formKey.currentState != null && !formKey.currentState!.validate()) {
      return;
    }
    _mobilePhone.name = nameController.text;
    _mobilePhone.variant = variantController.text;
    _mobilePhone.imei = imeiController.text;

    _isSubmitting = true;
    notifyListeners();
    await MobilePhoneRepository.createOne(
        mobilePhone: mobilePhone,
        onError: (error) {
          Utils.toast(error);
        },
        onSuccess: (data) {
          MobilePhoneViewModel viewModel =
              Provider.of<MobilePhoneViewModel>(context, listen: false);

          List<MobilePhone> list = viewModel.mobilePhones;
          list.insert(0, data);
          viewModel.mobilePhones = list;
          Navigator.of(context).pop();

          Utils.toast("data created successfully!");
          clearForm();
        });
    _isSubmitting = false;
    notifyListeners();
  }

  Future<void> onEdit(
    BuildContext context,
  ) async {
    FocusScope.of(context).unfocus();
    formKey.currentState?.save();
    if (formKey.currentState != null && !formKey.currentState!.validate()) {
      return;
    }
    _mobilePhone.name = nameController.text;
    _mobilePhone.variant = variantController.text;
    _mobilePhone.imei = imeiController.text;

    _isSubmitting = true;
    notifyListeners();
    await MobilePhoneRepository.updateOne(
        mobilePhone: mobilePhone,
        onError: (error) {
          Utils.toast(error);
        },
        onSuccess: (data) {
          MobilePhoneViewModel viewModel =
              Provider.of<MobilePhoneViewModel>(context, listen: false);
          viewModel.onRefresh();
          Navigator.of(context).pop();

          Utils.toast("data created successfully!");
          clearForm();
        });
    _isSubmitting = false;
    notifyListeners();
  }
}
