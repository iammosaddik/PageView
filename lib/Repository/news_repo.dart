import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pageview/Repository/server_config.dart';

import '../Model/Letest_news_model.dart';
import '../Model/News_details_model.dart';

class NewsRepo{

  // latest News Repo...........

  Future<LetestNewsModel> getNews()async{
    var respons= await http.get(Uri.parse(Config.serverNewsUrl+Config.latestNewsUrl));
    if(respons.statusCode==200){
      return LetestNewsModel.fromJson(jsonDecode(respons.body));
    }else{
      throw Exception('Error Occurred');
    }
  }

  // News Details Repo ...............
  Future<NewsDetailsModel> getDetails (String id)async{
    var respons = await http.get(Uri.parse('${Config.serverNewsUrl+Config.detailsNewsUrl}/$id'));
    var data = jsonDecode(respons.body);
    if(respons.statusCode==200){
      return NewsDetailsModel.fromJson(data);
    }else{
      throw Exception('Error Occurred');
    }
  }

}