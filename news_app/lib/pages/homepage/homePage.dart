import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/newsController.dart';
import 'package:news_app/pages/homepage/widgets/newsTile.dart';
import 'package:news_app/pages/homepage/widgets/trendingCart.dart';
import 'package:news_app/pages/newsDetail/newsDetail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final newsController = Get.put(NewsController());
    return Scaffold(
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(100)),
                      child: const Icon(Icons.dashboard),
                    ),
                    const Text(
                      "NEWS APP",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        newsController.getNewsForYou();
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(100)),
                        child: const Icon(Icons.person),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hottest News",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "See All",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: newsController.isTrendingLoading.value
                      ? const CircularProgressIndicator()
                      : Row(
                          children: newsController.trendingNews
                              .map((news) => TrendingCard(
                                    ontap: () {
                                      Get.to((NewsDetailPage(
                                        news: news,
                                      )));
                                    },
                                    imageUrl: news.urlToImage!,
                                    title: news.title ?? "Untitled",
                                    author: news.author ?? "Unknown",
                                    tag: "Trending no 1",
                                    time: news.publishedAt!,
                                  ))
                              .toList(),
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "News for you",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "See All",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                newsController.isNewsForYouLoading.value
                    ? const CircularProgressIndicator()
                    : Column(
                        children: newsController.newsForYou5
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
                      ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Apple News",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "See All",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                newsController.isAppleNewsLoading.value
                    ? const CircularProgressIndicator()
                    : Column(
                        children: newsController.apple5News
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
                      ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tesla News",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "See All",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                newsController.isTeslaNewsLoading.value
                    ? const CircularProgressIndicator()
                    : Column(
                        children: newsController.tesla5News
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
                      ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Business News",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "See All",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                newsController.isBusinessNewsLoading.value
                    ? const CircularProgressIndicator()
                    : Column(
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
      ),
    );
  }
}
