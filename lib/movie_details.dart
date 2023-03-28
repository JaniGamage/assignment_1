import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'get_data_controller.dart';
import 'get_data_model.dart';
import 'get_film_controller.dart';
import 'get_film_data_model.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key, required this.search});
  final search;


  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {

  final getDataController = Get.put(GetDataController());
  final getFilmController = Get.put(GetFilmController());

  @override
  void initState() {
    // TODO: implement initState
    getDataController.getDataFromApi();
    getFilmController.getFilmDataFromApi();
    super.initState();
    //getData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 43, 91, 1),
        elevation: 0,
        title: Center(child: Text("Movie Details"),),
      ),
      body: ListView(
        children: [
          Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Center(
                    child: Text(
                      "Name: ${getDataController.getDataModel.value.title}" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20 , decoration: TextDecoration.underline,color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: Image.network("${getDataController.getDataModel.value.poster}"),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 300,
                    height: 25,
                    child: Text("Released Date:     ${getDataController.getDataModel.value.released}" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15 ,color: Colors.white),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 300,
                    height: 25,
                    child: Text("Category:     ${getDataController.getDataModel.value.genre}" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15 ,color: Colors.white),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 300,
                    height: 25,
                    child: Text("Directored by:     ${getDataController.getDataModel.value.director}" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15 ,color: Colors.white),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 300,
                    height: 40,
                    child: Text("Actors:     ${getDataController.getDataModel.value.actors}" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15 ,color: Colors.white),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 300,
                    height: 25,
                    child: Text("Written By:     ${getDataController.getDataModel.value.writer}" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15 ,color: Colors.white),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 300,
                    height: 80,
                    child: Text("Plot:     ${getDataController.getDataModel.value.plot}" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15 ,color: Colors.white),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 300,
                    height: 40,
                    child: Text("Awards:     ${getDataController.getDataModel.value.awards}" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15 ,color: Colors.white),),
                  ),
                  SizedBox(height: 20,),
                ],
              )
          )
        ],
      ),
      backgroundColor: Color.fromRGBO(0, 43, 91, 1),
    ));

  }
}

