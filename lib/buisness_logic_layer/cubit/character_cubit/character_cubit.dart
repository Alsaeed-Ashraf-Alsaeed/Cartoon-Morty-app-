import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/characters_states/charaters_states.dart';
import 'package:state_mangement_project/data_layer/models/character_model.dart';
import 'package:state_mangement_project/data_layer/repositories/characters_repository.dart';
import 'package:state_mangement_project/data_layer/web_services_api/fetch_characters_api.dart';

//حط الجينيرك بتاع الكيوبيت هو الابستراكت كلاس وكده كده باقي الكلاسز البتمثل الاستيتس بيرثو ..
//منه يعني اعرف اعمل emit ليهم كحاله وكل كلاس بيمثل اstate
class CharactersCubit extends Cubit<CharactersStates> {
  bool searching = false;
  List<Character> characters = [];
  List<Character> searchedCharacters = [];
  CharactersRepository charactersRepository = CharactersRepository();

  CharactersCubit() : super(CharactersInitialStates());

  void getCharactersFromRepository() async {
//await is made to see the act of the ui in case the server is too slow
    await Future.delayed(Duration(seconds: 3));
//then function waits for the data to come and then it emits a new state ,
// that helped me in the home as i called this function in the build function in the ..
// homescreen and automatiaclly once the home screen is opened the build function of it will..
//be called and will call this function , but this function wont emit the state until the ..
//future data are completed , and after which the ui will be automatically ubdatd ,
//which means this cubit class emits states either automatically or by pressing a button..
//both of which the ui will be ubdated automatically ,
//يعني الكيوبيت كلاس بيبعت استريم من الاتستي وكل كما الاستيتن يتغير ال ui بيعتمل ليه ...
// ابديت او rebuild سواء التغير كان عن طريق زرار از كان حاله انا مستنيها تيجي في المستقبل
//thennnnnnnnnnnnnnn very important
    characters =await  charactersRepository.fetchDataFromApiClass();
    emit(CharactersLoadedStates(characters));
  }

  void searchWhileTyping(String searchText) {
    searchedCharacters = characters.where((character) {
// to lower case is very important so as all the names starts with capital and we want to match..
// them with some one who search in small letters
      if(character.name.toLowerCase().contains(searchText)){
        return true;
      }else{
        return false;
      }
    }).toList();
    emit(CharactersLoadedStates(searchedCharacters));
  }

  void isSearching(){
    searching==false?searching=true:searching=false;
    print(searching);
    emit(CharactersLoadedStates(characters,isSearching:searching ));
  }

}
