import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:state_mangement_project/data_layer/web_services_api/fetch_characters_api.dart';
import '../presentation_layer/screens/home_screen.dart';
import 'buisness_logic_layer/cubit/character_cubit/character_cubit.dart';
import 'data_layer/repositories/characters_repository.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<CharactersCubit>(
        create: (context) => CharactersCubit(),
        child: HomeScreen(),
      ),
    );
  }
}
