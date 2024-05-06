import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/newsController.dart';
import 'package:news_app/pages/articalpage/widgets/searchInput.dart';
import 'package:news_app/pages/homepage/widgets/newsTile.dart';
import 'package:news_app/pages/newsDetail/newsDetail.dart';

class ArticalPage extends StatelessWidget {
  const ArticalPage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              const SearchInput(),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: newsController.business5News
                    .map(
                      (news) => NewsTile(
                        ontap: () {
                          Get.to(NewsDetailPage(news: news));
                        },
                        imageUrl: news.urlToImage ??
                            "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1lHhrS.img?w=730&h=410&m=6",
                        title: news.title ?? "Untitled",
                        time: news.publishedAt!,
                        author: news.author ?? "Unknown",
                      ),
                    )
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
