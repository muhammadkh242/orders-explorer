import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension ContextHelper on BuildContext {
  T read<T>(Refreshable<T> provider) {
    return ProviderScope.containerOf(this, listen: false).read(provider);
  }
}
