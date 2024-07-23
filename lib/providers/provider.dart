import 'package:ivorypay/providers/account_provider.dart';
import 'package:ivorypay/providers/app_nav_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodProvider {
  static final appNavNotifier =
      ChangeNotifierProvider.autoDispose<AppNavNotifier>(
    (ref) => AppNavNotifier(),
  );

  static final accountProvider =
      ChangeNotifierProvider<AccountProvider>((ref) => AccountProvider());
}
