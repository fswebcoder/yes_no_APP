import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message_entities.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer{
  final _dio = Dio(); 
  Future<MessageEntities> getAnswer()async {
        final response  = await  _dio.get('https://yesno.wtf/api');
        final YesNoModelInfraestructure responseJson = YesNoModelInfraestructure.fromJson(response.data);
        return responseJson.toMessageEntities();
  }
}