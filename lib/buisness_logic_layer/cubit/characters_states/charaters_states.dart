import 'package:flutter/cupertino.dart';

import '../../../data_layer/models/character_model.dart';

//this file contains a lot of classes each class indicating a state
//هعمل الكلاس ده ابستراكت عشان اقول هنا ان اي كلاس هيرثه هو عباره عن  كلاس بيمثل state
//وده عشان انا ممكن بكون عندي اكتر من  state فهخلي كل state عباره عن كلاس وكل كلاس بيرث ال كلاس
// التحتج ده الهو ايميوتيبل /يعني الكلاس ده كل البيعمله انه بيعرفني ان الكلاس البيرث منه هو ..
//بيمثل state للcharacters
@immutable
abstract class CharactersStates {}

class CharactersInitialStates extends CharactersStates {}

class CharactersErorrStates extends CharactersStates {
  final String error;
  CharactersErorrStates(this.error);
}

class CharactersLoadedStates extends CharactersStates {
  final List<Character> characters;
  bool? isSearching ;

  CharactersLoadedStates(this.characters, {this.isSearching});
}
