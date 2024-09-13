import 'dart:convert';

import 'package:yes_no_app/domain/entities/message_entities.dart';

class YesNoModelInfraestructure {
   final String answer;
    final bool forced;
    final String image;

    YesNoModelInfraestructure({
        required this.answer,
        required this.forced,
        required this.image,
    });

    factory YesNoModelInfraestructure.fromRawJson(String str) => YesNoModelInfraestructure.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory YesNoModelInfraestructure.fromJson(Map<String, dynamic> json) => YesNoModelInfraestructure(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
    };

    MessageEntities toMessageEntities() => MessageEntities(text: answer, fromWho: FromWho.hers, imageUrl: image);
}
