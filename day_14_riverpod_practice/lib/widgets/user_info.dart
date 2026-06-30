import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_practice/providers/user_provider.dart';

class UserInfo extends ConsumerWidget {
  final int id;
  const UserInfo({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Since passing different IDs to the same provider creates a different instance, it means each provider has its own state, cache, lifecycle, and listeners.
    // But if I use the same ID in different places/widgets, it means I'm using the same instance because Provider will say: I've already created the provider for parameter '5'. I'll reuse it.
    // This caching behavior is one of the biggest reasons Families are so powerful in production apps.
    final user = ref.watch(userProvider(id));
    return Text('User = $user');
  }
}
