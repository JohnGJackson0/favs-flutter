import 'package:equatable/equatable.dart';

/* 
  Person("Bob") == Person("Bob") is normally false
  override == and hashCode to compare objects 
  by value or extend equatable, requires final properties
*/
class Task extends Equatable {
  final String title;
  final bool? isDone;
  final bool? isDeleted;

  Task({required this.title, required this.isDone, required this.isDeleted}) {
    // ??   return isDone if null then false
    // isDone = isDone ?? false;
    // isDeleted = isDeleted ?? false;
  }

  // recreate obj instead of mutate
  Task copyWith({
    String? title,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Task(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  /* 
    point:
    transfers non-primitive of obj to map as 
    it can be serialized, Map<String, dynamic> =
    {String: anything, ... }
  */
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  /*
    factory type has return but never uses 'this' :
    turns map back into instantiated class, therefor
    alows us to save objects and re-hydrate
  */

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  @override
  List<Object?> get props => [title, isDone, isDeleted];
}
