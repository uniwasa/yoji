import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';
import 'data/local_data_source.dart';

void main() async {
  await LocalDataSource.init();

  runApp(const ProviderScope(child: App()));
}
