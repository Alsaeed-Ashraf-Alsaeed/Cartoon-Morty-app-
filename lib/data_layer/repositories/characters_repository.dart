import 'package:flutter/cupertino.dart';
import 'package:state_mangement_project/data_layer/models/character_model.dart';
import 'package:state_mangement_project/data_layer/web_services_api/fetch_characters_api.dart';

// creating alist of model that each model has the data recieved from api in their...
// attributes ,
// we want to pass the data in each map to the special constructor in thw model class..
//as we kow that the special constructor takes a map and pass its values to the class..
// attribures, so we want to make a list of models each model has their own data ..
//so to pass all the maps inside the list<map> (returned by the function )...
//we can use the Map function
// here we recived an object from api class using constructor and using this object..
//we can reach the fucntion that use dio to get data from the api...
// in this class
class CharactersRepository {

  final CharactersApi charactersApi = CharactersApi();


//  this function calls the function  in the api class to get the list<map> and ...
// use it to make a list of the model each of which will be taking data from ..
// maps inside the list .
  Future<List<Character>> fetchDataFromApiClass() async {
     List<dynamic> charactersMaps = await charactersApi.fetchCharactersFromApi();
    return charactersMaps
        .map((eachMap) => Character.fromJson(json: eachMap))
        .toList();
  }
}
