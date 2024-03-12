//المودل هو كلاس فيه متغيرات ببيتخزن فيها الداتا الجايه من ال والهي بتمثل عنصر واحد بس
// when we want to display for example posts or commnets , the posts data(photosurl, content , id , time ..)..
// that comes from the api are the same for multiple posts , for ex there  is a key called id is the sane for ...
//all posts but its value changes from post to another amd  so the time key in the json map is the same for all...
// posts but the value changes from on to another , so the modeel must have  all the fixed keys in the map....
//and using these keys we can make lost of objrct of these models that each one has its own values so we ..
// so we use the model to store the data of each post(for ex ) and display it , not directly fron the api to ui ,
// to make models we dont have to do this we just can copy the api response and past it in the website..
//called json to dart
//note, the api data is a list of maps , each map is representing an element so we  design the ..
//model to take all the data by crating vars that has the same name as the keys as these kesy ...
// does not change from map to another , and then store the values of each map which are ...
// diffrrent from each other ...
class Character {
  late int id;
  late String name;
  late String image;
  late String Status;
  late String species;
  late String type;
  late String gender;
  late List<dynamic> episodes;

//we created a special constructor that takes data from json and pass it for ...
// each object attributes,
// the data coming is a list of maps each map has specific data describing each elemnet ,<====
// so we will reach to each map and pass it in the constructor and give its values to ...
//the arrtibutes above as shown,
  Character.fromJson({required Map json}) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    Status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    episodes = json["episode"];
  }
}


// using the postman we entered  the list of map and took a sample of a single map as shown ..
// to take from it the wanted data ,
Map X = {
  "id": 1,
  "name": "Rick Sanchez",
  "status": "Alive",
  "species": "Human",
  "type": "",
  "gender": "Male",
  "origin": {
    "name": "Earth (C-137)",
    "url": "https://rickandmortyapi.com/api/location/1"
  },
  "location": {
    "name": "Citadel of Ricks",
    "url": "https://rickandmortyapi.com/api/location/3"
  },
  "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
  "episode": [
    "https://rickandmortyapi.com/api/episode/1",
    "https://rickandmortyapi.com/api/episode/2",
    "https://rickandmortyapi.com/api/episode/3",
    "https://rickandmortyapi.com/api/episode/4",
    "https://rickandmortyapi.com/api/episode/5",
    "https://rickandmortyapi.com/api/episode/6",
    "https://rickandmortyapi.com/api/episode/7",
    "https://rickandmortyapi.com/api/episode/8",
    "https://rickandmortyapi.com/api/episode/9",
    "https://rickandmortyapi.com/api/episode/10",
    "https://rickandmortyapi.com/api/episode/11",
    "https://rickandmortyapi.com/api/episode/12",
    "https://rickandmortyapi.com/api/episode/13",
    "https://rickandmortyapi.com/api/episode/14",
    "https://rickandmortyapi.com/api/episode/15",
    "https://rickandmortyapi.com/api/episode/16",
    "https://rickandmortyapi.com/api/episode/17",
    "https://rickandmortyapi.com/api/episode/18",
    "https://rickandmortyapi.com/api/episode/19",
    "https://rickandmortyapi.com/api/episode/20",
    "https://rickandmortyapi.com/api/episode/21",
    "https://rickandmortyapi.com/api/episode/22",
    "https://rickandmortyapi.com/api/episode/23",
    "https://rickandmortyapi.com/api/episode/24",
    "https://rickandmortyapi.com/api/episode/25",
    "https://rickandmortyapi.com/api/episode/26",
    "https://rickandmortyapi.com/api/episode/27",
    "https://rickandmortyapi.com/api/episode/28",
    "https://rickandmortyapi.com/api/episode/29",
    "https://rickandmortyapi.com/api/episode/30",
    "https://rickandmortyapi.com/api/episode/31",
    "https://rickandmortyapi.com/api/episode/32",
    "https://rickandmortyapi.com/api/episode/33",
    "https://rickandmortyapi.com/api/episode/34",
    "https://rickandmortyapi.com/api/episode/35",
    "https://rickandmortyapi.com/api/episode/36",
    "https://rickandmortyapi.com/api/episode/37",
    "https://rickandmortyapi.com/api/episode/38",
    "https://rickandmortyapi.com/api/episode/39",
    "https://rickandmortyapi.com/api/episode/40",
    "https://rickandmortyapi.com/api/episode/41",
    "https://rickandmortyapi.com/api/episode/42",
    "https://rickandmortyapi.com/api/episode/43",
    "https://rickandmortyapi.com/api/episode/44",
    "https://rickandmortyapi.com/api/episode/45",
    "https://rickandmortyapi.com/api/episode/46",
    "https://rickandmortyapi.com/api/episode/47",
    "https://rickandmortyapi.com/api/episode/48",
    "https://rickandmortyapi.com/api/episode/49",
    "https://rickandmortyapi.com/api/episode/50",
    "https://rickandmortyapi.com/api/episode/51"
  ],
  "url": "https://rickandmortyapi.com/api/character/1",
  "created": "2017-11-04T18:48:46.250Z"
};
