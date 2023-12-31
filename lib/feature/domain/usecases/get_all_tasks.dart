import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo/core/error/failure.dart';
import 'package:todo/feature/data/model/task.dart';
import 'package:todo/feature/domain/repositories/sql_repository.dart';

class GetAllTasks {
  final SqlRepository sqlRepository;

  GetAllTasks(this.sqlRepository);

  Future<Either<Failure, List<Tasks>>> getAllTasks() async {
    return await sqlRepository.getAllTasks();
  }

  Future<void> createTask({
    required String title,
    required String details,
    required DateTimeRange range,
    required XFile? image,
  }) async {
    return await sqlRepository.createTask(
      title: title,
      details: details,
      image: image,
      start: range.start,
      end: range.end,
    );
  }

  Future<void> editTask(
    int id,
    String title,
    String details,
    XFile? image,
    DateTimeRange range,
  ) async {
    return await sqlRepository.editTask(
      id,
      title,
      details,
      image,
      range.start,
      range.end,
    );
  }

  Future<void> deleteTask(int id) async {
    return await sqlRepository.deleteTask(id);
  }

  Future<void> checkTask(int id, bool checked) async {
    return await sqlRepository.checkTask(id, checked);
  }
}
