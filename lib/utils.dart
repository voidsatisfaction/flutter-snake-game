import 'package:collection/collection.dart';

bool listDeepEqual(list1, list2) {
  return ListEquality().equals(list1, list2);
}
