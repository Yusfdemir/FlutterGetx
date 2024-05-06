import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/newsModel.dart';

class NewsController extends GetxController {
  var trendingNews = <NewsModel>[].obs;
  var newsForYou = <NewsModel>[].obs;
  var newsForYou5 = <NewsModel>[].obs;
  var appleNews = <NewsModel>[].obs;
  var apple5News = <NewsModel>[].obs;
  var teslaNews = <NewsModel>[].obs;
  var tesla5News = <NewsModel>[].obs;
  var businessNews = <NewsModel>[].obs;
  var business5News = <NewsModel>[].obs;
  var isTrendingLoading = false.obs;
  var isNewsForYouLoading = false.obs;
  var isAppleNewsLoading = false.obs;
  var isTeslaNewsLoading = false.obs;
  var isBusinessNewsLoading = false.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    getNewsForYou();
    getTrandingNews();
    getAppleNews();
    getTeslaNews();
    getBusinessNews();
  }

  Future<void> getTrandingNews() async {
    isTrendingLoading(true);
    var baseUrl =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=60e8972b53f245199e0301ad533afd5d";
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          trendingNews.add(NewsModel.fromJson(news));
        }
      } else {
        print("Something went wrong in Trending News");
      }
    } catch (e) {
      print(e);
    } finally {
      isTrendingLoading(false);
    }
  }

  Future<void> getNewsForYou() async {
    isNewsForYouLoading(true);
    var baseUrl =
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=60e8972b53f245199e0301ad533afd5d";
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          newsForYou.add(NewsModel.fromJson(news));
        }
        newsForYou5(newsForYou.sublist(0, 5));
      } else {
        print("Something went wrong in News For You");
      }
    } catch (e) {
      print(e);
    } finally {
      isNewsForYouLoading(false);
    }
  }

  Future<void> getAppleNews() async {
    isAppleNewsLoading(true);
    var baseUrl =
        "https://newsapi.org/v2/everything?q=apple&from=2024-05-04&to=2024-05-04&sortBy=popularity&apiKey=60e8972b53f245199e0301ad533afd5d";
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          appleNews.add(NewsModel.fromJson(news));
        }
        apple5News(appleNews.sublist(0, 5));
      } else {
        print("Something went wrong in Apple News");
      }
    } catch (e) {
      print(e);
    } finally {
      isAppleNewsLoading(false);
    }
  }

  Future<void> getTeslaNews() async {
    isTeslaNewsLoading(true);
    var baseUrl =
        "https://newsapi.org/v2/everything?q=tesla&from=2024-04-05&sortBy=publishedAt&apiKey=60e8972b53f245199e0301ad533afd5d";
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          teslaNews.add(NewsModel.fromJson(news));
        }
        tesla5News(teslaNews.sublist(0, 5));
      } else {
        print("Something went wrong in Tesla News");
      }
    } catch (e) {
      print(e);
    } finally {
      isTeslaNewsLoading(false);
    }
  }

  Future<void> getBusinessNews() async {
    isBusinessNewsLoading(true);
    var baseUrl =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=60e8972b53f245199e0301ad533afd5d";
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          businessNews.add(NewsModel.fromJson(news));
        }
        business5News(businessNews.sublist(0, 5));
      } else {
        print("Something went wrong in Business News");
      }
    } catch (e) {
      print(e);
    } finally {
      isBusinessNewsLoading(false);
    }
  }
}
