import 'package:flutter/material.dart';
import 'package:ivorypay/models/auth_model.dart';
import 'package:ivorypay/repository/auth_repository.dart';
import 'package:ivorypay/services/dialog_service.dart';
import 'package:ivorypay/services/navigation/navigator_service.dart';
import 'package:ivorypay/services/navigation/route_names.dart';
import 'package:ivorypay/utils/base_model.dart';
import 'package:ivorypay/utils/enums.dart';
import 'package:ivorypay/utils/locator.dart';
import 'package:ivorypay/utils/storage_util.dart';

class AccountProvider extends BaseModel {
  final NavigatorService _navigation = locator<NavigatorService>();
  final AuthRepository _authRepository = locator<AuthRepository>();
  final DialogService dialogService = locator<DialogService>();

  ScrollController? controller;
  LoadingState _loadingState = LoadingState.idle;
  LoadingState get loadingState => _loadingState;
  LoadingState _fetchState = LoadingState.loading;
  LoadingState get fetchState => _fetchState;
  setFetchState(LoadingState value) {
    _fetchState = value;
    notifyListeners();
  }

  setLoadingState(LoadingState value) {
    _loadingState = value;
    notifyListeners();
  }

  //
  // late SignInResponse _currentUser;
  // SignInResponse get currentUser => _currentUser;

  late AuthModel _token;
  AuthModel get token => _token;

  late String _role;
  String get role => _role;

  bool isLoading = false;

  // Setters
  setRole(String value) async {
    _role = value;
    notifyListeners();
  }

  // Setters
  setLoading(bool value) async {
    isLoading = value;
    notifyListeners();
  }

  alreadyLoggedIn() async {
    var d = await StorageUtil.getData('profile');
    // SignInResponse user = SignInResponse.fromJson(json.decode(d!));
    // _currentUser = user;
    var t = await StorageUtil.getData('token');
    final AuthModel auth = AuthModel.fromJson(t!);
    _token = auth;
    _navigation.navigateReplacementTo(entryLoginScreenRoute);
    return "Success";
  }
}
