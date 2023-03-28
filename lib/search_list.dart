import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'get_film_controller.dart';
import 'get_data_controller.dart';
import 'get_film_data_model.dart';
import 'movie_details.dart';

class SearchList extends StatefulWidget {
  const SearchList({Key? key}) : super(key: key);

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  final getFilmController = Get.put(GetFilmController());
  //final getDataController = Get.put(GetDataController());
  late GetFilmDataModel getFilmDataModel;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   getFilmController.getFilmDataFromApi();
  //   //getDataController.getDataFromApi();
  //   super.initState();
  // }

  List<Map<String, dynamic>> _allMovies = [
    {
      "Title": "The Avengers",
      "Year": "2012",
      "imdbID": "tt0848228",
      "Type": "movie",
      "Poster": "https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg"
    },
    {
      "Title": "Avengers: Endgame",
      "Year": "2019",
      "imdbID": "tt4154796",
      "Type": "movie",
      "Poster": "https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_SX300.jpg"
    },
    {
      "Title": "Avengers: Infinity War",
      "Year": "2018",
      "imdbID": "tt4154756",
      "Type": "movie",
      "Poster": "https://m.media-amazon.com/images/M/MV5BMjMxNjY2MDU1OV5BMl5BanBnXkFtZTgwNzY1MTUwNTM@._V1_SX300.jpg"
    },
    {
      "Title": "Avengers: Age of Ultron",
      "Year": "2015",
      "imdbID": "tt2395427",
      "Type": "movie",
      "Poster": "https://m.media-amazon.com/images/M/MV5BMTM4OGJmNWMtOTM4Ni00NTE3LTg3MDItZmQxYjc4N2JhNmUxXkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_SX300.jpg"
    },
    {
      "Title": "The Avengers",
      "Year": "1998",
      "imdbID": "tt0118661",
      "Type": "movie",
      "Poster": "https://m.media-amazon.com/images/M/MV5BYWE1NTdjOWQtYTQ2Ny00Nzc5LWExYzMtNmRlOThmOTE2N2I4XkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_SX300.jpg"
    },
    {
      "Title": "The Avengers: Earth's Mightiest Heroes",
      "Year": "2010–2012",
      "imdbID": "tt1626038",
      "Type": "series",
      "Poster": "https://m.media-amazon.com/images/M/MV5BYzA4ZjVhYzctZmI0NC00ZmIxLWFmYTgtOGIxMDYxODhmMGQ2XkEyXkFqcGdeQXVyNjExODE1MDc@._V1_SX300.jpg"
    },
    {
      "Title": "Ultimate Avengers: The Movie",
      "Year": "2006",
      "imdbID": "tt0491703",
      "Type": "movie",
      "Poster": "https://m.media-amazon.com/images/M/MV5BMTYyMjk0NTMwMl5BMl5BanBnXkFtZTgwNzY0NjAwNzE@._V1_SX300.jpg"
    },
    {
      "Title": "Ultimate Avengers II",
      "Year": "2006",
      "imdbID": "tt0803093",
      "Type": "movie",
      "Poster": "https://m.media-amazon.com/images/M/MV5BZjI3MTI5ZTYtZmNmNy00OGZmLTlhNWMtNjZiYmYzNDhlOGRkL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg"
    },
    {
      "Title": "The Avengers",
      "Year": "1961–1969",
      "imdbID": "tt0054518",
      "Type": "series",
      "Poster": "https://m.media-amazon.com/images/M/MV5BZWQwZTdjMDUtNTY1YS00MDI0LWFkNjYtZDA4MDdmZjdlMDRlXkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_SX300.jpg"
    },
    {
      "Title": "Avengers Assemble",
      "Year": "2012–2019",
      "imdbID": "tt2455546",
      "Type": "series",
      "Poster": "https://m.media-amazon.com/images/M/MV5BMTY0NTUyMDQwOV5BMl5BanBnXkFtZTgwNjAwMTA0MDE@._V1_SX300.jpg"
    }
  ];
  List<Map<String, dynamic>> _foundMovies = [];

  @override
  void initState() {
    _foundMovies = _allMovies;
    // TODO: implement initState
    super.initState();
  }

  void filterMovies(String enteredKeyword){
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty){
      results = _allMovies;
    }else{
      results = _allMovies.where((element) => element['Title'].toString()
          .toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }
    setState(() {
      _foundMovies = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 43, 91, 1),
        elevation: 0,
        title: Text("Search Movies"),
      ),
      body: Column(
        children: [
          TextFormField(
            onChanged: (value) => filterMovies(value),
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(0, 43, 91, 1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: "Search here",
              hintStyle: TextStyle(color: Colors.white),
              prefixIcon: Icon(Icons.search , color: Colors.white,),
              prefixIconColor: Colors.white,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index){
                return Card(
                  color: Color.fromRGBO(0, 43, 91, 1),
                  key: ValueKey(_foundMovies[index]["imdbID"]),
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieDetails(search: getFilmController.getFilmDataModel.value.search![index])));
                    },
                    leading: ClipRect(
                      child: Image.network(_foundMovies[index]['Poster'],fit: BoxFit.fill,width: 50,height: 50,),
                    ),
                    title: Text(_foundMovies[index]["Title"] , style: TextStyle(color: Colors.white),),
                    subtitle: Text(_foundMovies[index]["Year"] , style: TextStyle(color: Colors.white),),
                  ),
                );
              },
              itemCount: _foundMovies.length,
            ),
          )
        ],
      ) ,
      backgroundColor: Color.fromRGBO(0, 43, 91, 1),
    );
  }
}
