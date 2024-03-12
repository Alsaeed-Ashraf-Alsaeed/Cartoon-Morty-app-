import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:state_mangement_project/buisness_logic_layer/cubit/character_cubit/character_cubit.dart';
import 'package:state_mangement_project/buisness_logic_layer/cubit/characters_states/charaters_states.dart';
import 'package:state_mangement_project/presentation_layer/widgets/chracter_item.dart';
import 'package:state_mangement_project/presentation_layer/widgets/search_widget.dart';
import '../../data_layer/repositories/characters_repository.dart';
import '../../data_layer/web_services_api/fetch_characters_api.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//مكان الكود ده مهم جدا لانه يتنفذ مع بدايه التطبيق مع داله البيلد البتتعمل لوحدها
// الكود ده بيستدعي داله الداتا البتعمل شويه حجات مكتوبه هناك
//الفكره ان الداله الهناك بتعمل get للداتا من الapi فبيكون في مده كام ملي ثاينه تحميل..
//في الفتره دي انا مستخدم await لما يخلص هيعمل emit ل state علي طول هيحصل rebuilf هنا للBB
//this function is getting data from the api this takes milli secends using thennnnnnn,
// after this it emits a new state (characterLoadedState) and pass a list of the revieved..
//list to the sub state called characters which contains data from repositors ..
// this characters list we will use it as a state to diplay its elemnts by taking its ..
// objects attributes to display them in listview
    BlocProvider.of<CharactersCubit>(context, listen: false)
        .getCharactersFromRepository();
    return Scaffold(
      appBar: AppBar(
        title: SearchItem(),
        toolbarHeight: 50,
      ),
      body: buildBlocBuilder(),
    );
  }

//for clean code we use  build functions instead of putting all of it in the build funcyion,
  BlocBuilder<CharactersCubit, CharactersStates> buildBlocBuilder() {
    return BlocBuilder<CharactersCubit, CharactersStates>(
      builder: (context, states) {
// this if has to be done so we can say that the states = charactersloadedstates
// is keyword is used to compare between types
        if (states is CharactersLoadedStates) {
          return Container(
            margin: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height - 50,
            child: GridView.builder(
              itemCount: states.characters.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return CharacterItem(
                    id: states.characters[index].id,
                    name: states.characters[index].name,
                    image: states.characters[index].image);
              },
            ),
          );
        } else if (states is CharactersInitialStates) {
          return Center(
            child: Image.asset('assets/images/gif1.gif'),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
