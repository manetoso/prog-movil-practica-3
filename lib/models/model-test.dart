import 'package:flutter/material.dart';

class Product {
  int? idTask;
  String? titleTask, descTask, dateTask;
  bool? done;
  Product({
    this.idTask,
    this.titleTask,
    this.descTask,
    this.dateTask,
    this.done,
  });

  List<Product> products = [
    Product(
      idTask: 1,
      titleTask: 'Title-1',
      descTask: 'dummy test',
      dateTask: '07-10-2021',
      done: false
    ),
    Product(
      idTask: 2,
      titleTask: 'Title-2',
      descTask: 'dummy test',
      dateTask: '07-10-2021',
      done: false
    ),
    Product(
      idTask: 3,
      titleTask: 'Title-3',
      descTask: 'dummy test',
      dateTask: '07-10-2021',
      done: false
    ),
    Product(
      idTask: 4,
      titleTask: 'Title-4',
      descTask: 'dummy test',
      dateTask: '07-10-2021',
      done: false
    ),
    Product(
      idTask: 5,
      titleTask: 'Title-5',
      descTask: 'dummy test',
      dateTask: '07-10-2021',
      done: false
    ),
  ];
}