import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/admin_auth_model.dart';
import 'admin_auth_notifier.dart';

final adminAuthProvider = NotifierProvider<AdminAuthNotifier, AdminAuthModel?>(
  () {
    return AdminAuthNotifier();
  },
);
