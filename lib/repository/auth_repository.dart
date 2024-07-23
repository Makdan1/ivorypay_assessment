import 'package:ivorypay/models/util_model.dart';
import 'package:ivorypay/repository/network_helper.dart';
import 'package:ivorypay/utils/enums.dart';

class AuthRepository {
  final NetworkHelper _networkHelper = NetworkHelper();

  Future<HTTPResponseModel> login(Map<String, dynamic> body) async {
    return await _networkHelper.runApi(
      type: ApiRequestType.post,
      url: "auth/login",
      body: body,
    );
  }

  Future<HTTPResponseModel> sentOtpUser(Map<String, dynamic> body) async {
    return await _networkHelper.runApi(
        type: ApiRequestType.post,
        url: "auth/phone/send-sms",
        body: body,
        showError: true);
  }

  Future<HTTPResponseModel> verifyOtp(Map<String, dynamic> body) async {
    return await _networkHelper.runApi(
      type: ApiRequestType.post,
      url: "auth/phone/verify",
      body: body,
    );
  }

  Future<HTTPResponseModel> getProfile(Map<String, dynamic> body) async {
    return await _networkHelper.runApi(
      type: ApiRequestType.get,
      url: "profile",
      body: body,
    );
  }

  Future<HTTPResponseModel> riderSignUp(
      Map<String, dynamic> body, String type) async {
    return await _networkHelper.runApi(
      type: ApiRequestType.formData,
      url: type == "rider"
          ? "auth/rider/signup"
          : type == "driver"
              ? "auth/driver/signup"
              : "auth/both/signup",
      body: body,
    );
  }

  Future<HTTPResponseModel> setEmergencyContact(
      Map<String, dynamic> body) async {
    return await _networkHelper.runApi(
      type: ApiRequestType.patch,
      url: "user/set-emergency-contact",
      body: body,
    );
  }

  Future<HTTPResponseModel> pictureSetup(Map<String, dynamic> body) async {
    return await _networkHelper.runApi(
      type: ApiRequestType.formDataPatch,
      url: "user/set-profile-picture",
      body: body,
    );
  }

  Future<HTTPResponseModel> setUpDriverLicense(
      Map<String, dynamic> body) async {
    return await _networkHelper.runApi(
      type: ApiRequestType.formData,
      url: "user/driver/license",
      body: body,
    );
  }

  Future<HTTPResponseModel> setUpVehicle(Map<String, dynamic> body) async {
    return await _networkHelper.runApi(
      type: ApiRequestType.post,
      url: "vehicle",
      body: body,
    );
  }

  Future<HTTPResponseModel> setUpVehicleDocs(Map<String, dynamic> body) async {
    return await _networkHelper.runApi(
      type: ApiRequestType.formData,
      url: "vehicle/documents",
      body: body,
    );
  }

  Future<HTTPResponseModel> setUpPayment(Map<String, dynamic> body) async {
    return await _networkHelper.runApi(
      type: ApiRequestType.post,
      url: "bank",
      body: body,
    );
  }

  Future<HTTPResponseModel> getBankName(
      String accountNumber, String bankCode) async {
    return await _networkHelper.runApi(
      type: ApiRequestType.get,
      url: "bank/resolve?accountNumber=$accountNumber&bankCode=$bankCode",
    );
  }

  Future<HTTPResponseModel> getBanks() async {
    return await _networkHelper.runApi(
      type: ApiRequestType.get,
      url: "bank",
    );
  }

  Future<HTTPResponseModel> updatePreferences(Map<String, dynamic> body) async {
    return await _networkHelper.runApi(
      type: ApiRequestType.post,
      url: "preferences",
      body: body,
    );
  }

  Future<HTTPResponseModel> getCards() async {
    return await _networkHelper.runApi(
      type: ApiRequestType.get,
      url: "card/get-cards",
    );
  }

  Future<HTTPResponseModel> deleteCards(String id) async {
    return await _networkHelper.runApi(
      type: ApiRequestType.delete,
      url: "card/$id",
    );
  }

  Future<HTTPResponseModel> notifications({int page = 1}) async {
    return await _networkHelper.runApi(
      type: ApiRequestType.get,
      url: "notification/user?page=$page",
    );
  }

  Future<HTTPResponseModel> notiCount() async {
    return await _networkHelper.runApi(
      type: ApiRequestType.get,
      url: "notification/count",
    );
  }

  Future<HTTPResponseModel> readNotification() async {
    return await _networkHelper.runApi(
      type: ApiRequestType.get,
      url: "notification/read",
    );
  }

  Future<HTTPResponseModel> readOne(String id) async {
    return await _networkHelper.runApi(
      type: ApiRequestType.put,
      url: "notification/read/$id",
    );
  }
}
