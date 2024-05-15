import 'package:fast_log/fast_log.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:serviced/serviced.dart';
import 'package:synchronized/synchronized.dart';

Box dataBox() => svc<HiveService>().dataBox;

class HiveService extends StatelessService implements AsyncStartupTasked {
  Box? _data;
  LazyBox? _cache;
  Box get dataBox => svc<HiveService>()._data!;
  LazyBox get cacheBox => svc<HiveService>()._cache!;

  final Lock _lock = Lock();

  @override
  Future<void> onStartupTask() async {
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory(),
    );

    if (!kIsWeb) {
      String path = (await getApplicationDocumentsDirectory()).path;
      Hive.init(path);
      info("Initialized Native Hive storage location: $path");
    }

    await Future.wait([
      _hive("data").then((value) => _data = value),
      _hiveLazy("cache").then((value) => _cache = value),
    ]);

    success("Storage Initialized");
  }

  Future<Box> _hive(String box) async {
    if (Hive.isBoxOpen("cr$box")) {
      return Hive.box("cr$box");
    }

    return Hive.openBox("cr$box").then((value) {
      info("Initialized Hive Box ${value.name} with ${value.keys.length} keys");
      return value;
    });
  }

  Future<LazyBox> _hiveLazy(String box) => _lock.synchronized(() async {
        if (Hive.isBoxOpen("cr$box")) {
          return Hive.lazyBox("cr$box");
        }

        return Hive.openLazyBox("cr$box").then((value) {
          info(
              "Initialized Lazy Hive Box ${value.name} with ${value.keys.length} keys");
          return value;
        });
      });
}
