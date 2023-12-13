import 'package:compasia/config/db_constants.dart';

import '../helpers/http_client/http_client.dart';
import '../models/mobile_phone.dart';
import '../services/auth_service.dart';

class MobilePhoneRepository {
  static Future<void> createOne(
      {required MobilePhone mobilePhone,
      Function(String)? onError,
      required Function(MobilePhone) onSuccess,
     
}) async {
    await HttpClient.post(
      
      endpoint: DbConstants.mobilePhone(),
      headers: {
        'Authorization': 'Bearer ${AuthService().currentUser!.authToken}',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: mobilePhone.toMap(),
      onError: onError,
      onSuccess: (data) async {
        MobilePhone mobilePhone = MobilePhone.fromMap(data["data"]);
        onSuccess(mobilePhone);
      },
    );
  }

  static Future<void> createMany(
      {required List<MobilePhone> mobilePhones,
      Function(String)? onError,
      required Function(List<MobilePhone>) onSuccess,
     
}) async {
    List<Map<String, dynamic>> jsonList =
        mobilePhones.map((model) => model.toMap()).toList();
    await HttpClient.post(
        
        endpoint: DbConstants.mobilePhoneCreateMany,
        headers: {
          'Authorization': 'Bearer ${AuthService().currentUser!.authToken}',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonList,
        onSuccess: (data) async {
          var extractedListData = data['data'] as List;
          List<MobilePhone> list = extractedListData
              .map<MobilePhone>((json) => MobilePhone.fromMap(json))
              .toList();
          onSuccess(list);
        },
        onError: onError);
  }

  static Future<MobilePhone?> getOne(
      {String? id,
      Map<String, Object>? filter,
      List<String>? popOptions,
      Function(String)? onError,
       Function(MobilePhone)? onSuccess,
      bool showLoadingDialog = false,
}) async {
   MobilePhone? mobilePhone;
    var body = {
          if (popOptions != null) 'popOptions': popOptions,
          if (filter != null) 'filter': filter,
    };
    await HttpClient.get(
        
        endpoint: DbConstants.mobilePhone(id: id ??"null"),
        headers: {
          'Authorization': 'Bearer ${AuthService().currentUser!.authToken}',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body,
        onSuccess: (data) async {
           mobilePhone = MobilePhone.fromMap(data["data"]);
          if (onSuccess != null) {
             onSuccess(mobilePhone!);
          }
        },
        onError: onError
       );
      return  mobilePhone;
  }

  static Future<List<MobilePhone>> getMany(
      {Function(String)? onError,
      Map<String, Object>? filter,
      List<String>? popOptions,
      int? page,
      int? limit,
       Function(List<MobilePhone>)? onSuccess,
      bool showLoadingDialog = false,
}) async {
     List<MobilePhone> mobilePhones = [];
    await HttpClient.post(
        
        endpoint: DbConstants.mobilePhoneGetMany,
        headers: {
          'Authorization': 'Bearer ${AuthService().currentUser!.authToken}',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: {
          if (popOptions != null) 'popOptions': popOptions,
          if (filter != null) 'filter': filter,
          if (page != null) 'page': page,
          if (limit != null) 'limit': limit,
        },
        onSuccess: (data) async {
          var extractedListData = data['data'] as List;
         mobilePhones = extractedListData
              .map<MobilePhone>((json) => MobilePhone.fromMap(json))
              .toList();
          if (onSuccess != null) {
            onSuccess(mobilePhones);
          }
        },
        onError: onError);
         return mobilePhones;
  }

  static Future<void> updateOne(
      {required MobilePhone mobilePhone,
      Function(String)? onError,
      required Function(MobilePhone) onSuccess,
      bool showLoadingDialog = false,
}) async {
    await HttpClient.put(
        
        endpoint: DbConstants.mobilePhone(id: mobilePhone.id),
        headers: {
          'Authorization': 'Bearer ${AuthService().currentUser!.authToken}',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: mobilePhone.toMap(),
        onSuccess: (data) async {
          MobilePhone mobilePhone = MobilePhone.fromMap(data["data"]);
          onSuccess(mobilePhone);
        },
        onError: onError);
  }

  static Future<void> updateMany(
      {required List<MobilePhone> mobilePhones,
      Function(String)? onError,
      required Function(List<MobilePhone>) onSuccess,
      bool showLoadingDialog = false,
}) async {
    List<Map<String, dynamic>> jsonList =
        mobilePhones.map((model) => model.toMap()).toList();
    await HttpClient.put(
        
        endpoint: DbConstants.mobilePhone(),
        headers: {
          'Authorization': 'Bearer ${AuthService().currentUser!.authToken}',
          'Content-Type': 'application/json',
        },
        body: jsonList,
        onSuccess: (data) async {
          var extractedListData = data['data'] as List;
          List<MobilePhone> list = extractedListData
              .map<MobilePhone>((json) => MobilePhone.fromMap(json))
              .toList();
          onSuccess(list);
        },
        onError: onError);
  }

  static Future<void> deleteOne(
      {required String id,
      Function(String)? onError,
      required Function() onSuccess,
      bool showLoadingDialog = false,
}) async {
    await HttpClient.delete(
        
        endpoint: DbConstants.mobilePhone(id: id),
        headers: {
          'Authorization': 'Bearer ${AuthService().currentUser!.authToken}',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: {},
        onSuccess: (data) async {
          onSuccess();
        },
        onError: onError);
  }
  static Future<void> deleteMany(
      {required List<MobilePhone> mobilePhones,
      Function(String)? onError,
      required Function() onSuccess,
      bool showLoadingDialog = false,
}) async {
    List<Map<String, dynamic>> jsonList =
        mobilePhones.map((model) => model.toMap()).toList();
    await HttpClient.delete(
        
        endpoint: DbConstants.mobilePhone(),
        headers: {
          'Authorization': 'Bearer ${AuthService().currentUser!.authToken}',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonList,
        onSuccess: (data) async {
          onSuccess();
        },
        onError: onError);
  }
}