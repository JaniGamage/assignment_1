import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'get_film_controller.dart';
import 'get_film_data_model.dart';
import 'movie_details.dart';
import 'search_list.dart';


class List_Movies extends StatefulWidget {
  const List_Movies({Key? key}) : super(key: key);

  @override
  State<List_Movies> createState() => _List_MoviesState();
}

class _List_MoviesState extends State<List_Movies> {

  final getFilmController = Get.put(GetFilmController());
  //final getDataController = Get.put(GetDataController());
  late GetFilmDataModel getFilmDataModel;

  @override
  void initState() {
    // TODO: implement initState
    getFilmController.getFilmDataFromApi();
    //getDataController.getDataFromApi();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor:Color.fromRGBO(0, 43, 91, 1),
          title: Center(child:Text('Movie List') ,),
          leading: IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (builder){
              return SearchList();
            }));
          },
            icon: Icon(Icons.search),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: !getFilmController.isLoading.value? ListView.builder(
                itemCount: getFilmController.getFilmDataModel.value.search?.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    color: Color.fromRGBO(0, 43, 91, 1),
                    child: ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieDetails(search: getFilmController.getFilmDataModel.value.search![index])));
                      },
                      title: Text(getFilmController.getFilmDataModel.value.search![index].title , style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),),),
                      leading: ClipRect(
                        child: Image.network(getFilmController.getFilmDataModel.value.search![index].poster,fit: BoxFit.fill,width: 50,height: 50,),
                      ),
                      subtitle: Text(getFilmController.getFilmDataModel.value.search![index].year  , style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),),),
                    ),
                  );
                },
              ): CircularProgressIndicator()
            ),
          ],
        ),
      backgroundColor: Color.fromRGBO(0, 43, 91, 1),
    )
    );
  }
}
