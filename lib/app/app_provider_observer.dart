import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProviderLogger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? newValue) {
    log('[${provider.name ?? provider.runtimeType}] value: $newValue');
    super.didUpdateProvider(provider, newValue);
  }
}
