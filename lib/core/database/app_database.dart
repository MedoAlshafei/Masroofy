import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get amount => real()();
  TextColumn get description => text().withLength(max: 500).nullable()();
  TextColumn get category => text().withLength(max: 100)();
  TextColumn get type => text().withLength(max: 10)();
  DateTimeColumn get date => dateTime()();
  TextColumn get rawAiInput => text().nullable()();
}

@DriftDatabase(tables: [Transactions])
@lazySingleton
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

QueryExecutor _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'masroofy.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
