import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_mangement_project/buisness_logic_layer/cubit/character_cubit/character_cubit.dart';
import 'package:state_mangement_project/buisness_logic_layer/cubit/characters_states/charaters_states.dart';

class SearchItem extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        buildRow(context),
        IconButton(
          onPressed: () {
            controller.clear();
            BlocProvider.of<CharactersCubit>(context).searchWhileTyping('');
          },
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  buildRow(BuildContext context) {
    return Container(
      height: 30,
      width: MediaQuery.of(context).size.width - 130,
      child: TextFormField(
        controller: controller,
        onChanged: (txt) {
          BlocProvider.of<CharactersCubit>(context).searchWhileTyping(txt);
        },
        onFieldSubmitted: (txt) {
          BlocProvider.of<CharactersCubit>(context).searchWhileTyping(txt);
        },
        decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2)),
            border: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white,
            ))),
      ),
    );
  }
}
