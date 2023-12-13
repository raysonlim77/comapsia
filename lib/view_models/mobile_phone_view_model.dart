import 'package:compasia/helpers/utils.dart';
import 'package:compasia/models/mobile_phone.dart';
import 'package:compasia/repositories/mobile_phone_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class MobilePhoneViewModel extends ChangeNotifier {
  bool _isSubmitting = false;
  bool get isSubmitting => _isSubmitting;

  set isSubmitting(bool val) {
    _isSubmitting = val;
    notifyListeners();
  }

  bool _connection = true;
  bool get connection => _connection;
  Future connectionChecker() async {
    _connection = await InternetConnectionChecker().hasConnection;
  }

  List<MobilePhone> _mobilePhones = [];
  List<MobilePhone> get mobilePhones => _mobilePhones;

  set mobilePhones(List<MobilePhone> val) {
    _mobilePhones = val;
    notifyListeners();
  }

  bool _hasMore = true;
  bool get hasMore => _hasMore;

  int _page = 1;
  int get page => _page;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final int _limit = 10;
  int get limit => _limit;

  ScrollController scrollController = ScrollController();
  SwipeActionController swipeActionController = SwipeActionController();
  setInit() {
    fetchData();

    scrollController.addListener(() {
      if (((scrollController.offset /
                  scrollController.position.maxScrollExtent) *
              100) >=
          40) {
        fetchData();
      }
    });
  }

  Future<void> fetchData() async {
    if (isLoading || !hasMore) return;
    _isLoading = true;
    notifyListeners();
    List<MobilePhone> newData =
        await MobilePhoneRepository.getMany(page: page, limit: limit);
    if (newData.length < limit) {
      _hasMore = false;
    }

    if (mobilePhones.isNotEmpty) {
      _mobilePhones.addAll(newData);
    } else {
      _mobilePhones = newData;
    }
    _page++;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> onRefresh() async {
    _isLoading = false;
    _hasMore = true;
    _page = 1;
    _mobilePhones.clear();
    notifyListeners();
    await fetchData();
  }

  Future<void> onRemove(int index) async {
    isSubmitting = true;
    await MobilePhoneRepository.deleteOne(
        id: _mobilePhones[index].id,
        onError: (error) {
          Utils.toast(error);
        },
        onSuccess: () {
          _mobilePhones.removeAt(index);

          notifyListeners();
          Utils.toast("data deleted successfully!");
        });
    isSubmitting = false;

  }
}
