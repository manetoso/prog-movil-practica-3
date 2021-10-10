// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';
import 'package:meta/meta.dart';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
    TaskModel({
        this.id,
        @required this.titleTask,
        @required this.descTask,
        @required this.dateTask,
        @required this.doneTask,
    });

    int? id;
    String? titleTask;
    String? descTask;
    String? dateTask;
    int? doneTask;

    factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        titleTask: json["titleTask"],
        descTask: json["descTask"],
        dateTask: json["dateTask"],
        doneTask: json["doneTask"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "titleTask": titleTask,
        "descTask": descTask,
        "dateTask": dateTask,
        "doneTask": doneTask,
    };

    String toString() {
      return '{ id: ${this.id}, title: ${this.titleTask}, desc: ${this.descTask}, date: ${this.dateTask}, done: ${this.doneTask} }';
    }
}
