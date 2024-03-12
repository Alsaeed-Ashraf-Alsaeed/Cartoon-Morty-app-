import 'package:dio/dio.dart';
import 'package:state_mangement_project/constants/strings.dart';


// here at the webservices or the api file we create a class that is the one to fetch or get ..
// the data from the api ,this is done by creating a function that gets the data and  return it ,
//

class CharactersApi {
  late Dio dio;

//we did the options in the constructor as once an object is made from this class it will ...
// directly perform the codes and the options and pass the options to the dio attribute
  CharactersApi() {

    dio = Dio( BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
    ),);
  }


  Future<List<dynamic>> fetchCharactersFromApi() async {
// we will use the try and catch to hanlde the error that might occcur as a reuslt of any ..
//server failure
    Response res =await dio.get('character')  ;

//very important when you fetch data from the enter net useing the data key word ..
// specify just the list and the other set them as dynamic as the compiler know only ...
// that the type is alist not a list of things
//الداتا الجايه من ال api لما تيجي تخرزنها في متغير عرف اول نوع بس عشان ده ال كومبيلر عارفه
//غير كده الكومبيلر بيقلك ان الراجع ده هو النوع الاول والباقي dynamic ,
    List<dynamic> CharactersMap = res.data['results'];
    return CharactersMap;
  }

}
