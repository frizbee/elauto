import 'package:drift/drift.dart';

import 'service_types.dart';

class ReminderRules extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get serviceTypeId =>
      integer().references(ServiceTypes, #id, onDelete: KeyAction.cascade)();

  IntColumn get intervalKm => integer().nullable()();

  IntColumn get intervalMonths => integer().nullable()();

  IntColumn get advanceNoticeKm => integer().withDefault(const Constant(500))();

  IntColumn get advanceNoticeDays =>
      integer().withDefault(const Constant(14))();

  BoolColumn get isEnabled => boolean().withDefault(const Constant(true))();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();
}
