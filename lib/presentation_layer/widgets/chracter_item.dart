import 'package:flutter/material.dart';
import 'package:state_mangement_project/buisness_logic_layer/cubit/characters_states/charaters_states.dart';

class CharacterItem extends StatelessWidget {

  final int id;
  final String name;
  final String image;
  const CharacterItem({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black54, width: 3),
              borderRadius: BorderRadius.circular(10)),
          child: FadeInImage(
              placeholder: AssetImage('assets/images/gif2.gif'),
              image: NetworkImage(image)),
        ),
        Positioned(
          bottom: 3,
          left: 1,
          child: Container(
            height: 24,
            width: 190,
            color: Colors.black54,
            child: Text(
              name,
              style: TextStyle(color: Colors.white, fontSize: 20),
            textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
