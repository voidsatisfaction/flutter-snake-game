import 'package:uuid/uuid.dart';
import 'package:collection/collection.dart';

bool listDeepEqual(list1, list2) {
  return ListEquality().equals(list1, list2);
}

final Uuid _uuid = Uuid();

String getUuid() {
  return _uuid.v4();
}
