import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'get_film_data_model.dart';

class GetFilmController extends GetxController{
  var isLoading = false.obs;
  var getFilmDataModel = GetFilmDataModel().obs;

  getFilmDataFromApi() async{
    isLoading.value = true;
    try{
      var response = await Dio().get('https://www.omdbapi.com/?i=tt3896198&apikey=7ba3b665&s=avengers');
      getFilmDataModel.value = GetFilmDataModel.fromJson(response.data);
      print(response);
      isLoading.value = false;
      //changed added
    }catch (e){
      print(e);
    }
  }
}