import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'get_data_model.dart';

class GetDataController extends GetxController{
  var isLoading = false.obs;
  var getDataModel = Search().obs;

  getDataFromApi() async{
    isLoading.value = true;
    try{
      var response = await Dio().get('https://www.omdbapi.com/?i=tt3896198&apikey=7ba3b665&t=The Avengers');
      getDataModel.value = Search.fromJson(response.data);
      print(response);
      isLoading.value = false;
    }catch (e){
      print(e);
    }
  }
}