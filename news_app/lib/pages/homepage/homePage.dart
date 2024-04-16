import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/pages/homepage/widgets/newsTile.dart';
import 'package:news_app/pages/homepage/widgets/trendingCart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NEWSEEKERS",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TrendingCard(
                      imageUrl:
                          "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1lHhrS.img?w=730&h=410&m=6",
                      title:
                          "Arda Güler'in hayalleri yıkıldı! Ancelotti artık güvenmiyor, ayrılığı açıkladı, işte yeni takımı",
                      author: "Adam Smith",
                      tag: "Trending no 1",
                      time: "2 days ago",
                    ),
                    TrendingCard(
                      imageUrl:
                          "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1lHhrS.img?w=730&h=410&m=6",
                      title:
                          "Arda Güler'in hayalleri yıkıldı! Ancelotti artık güvenmiyor, ayrılığı açıkladı, işte yeni takımı",
                      author: "Adam Smith",
                      tag: "Trending no 1",
                      time: "2 days ago",
                    )
                  ],
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
              Column(
                children: [
                  NewsTile(
                    imageUrl:
                        "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1lHhrS.img?w=730&h=410&m=6",
                    title:
                        "Arda Güler'in hayalleri yıkıldı! Ancelotti artık güvenmiyor, ayrılığı açıkladı, işte yeni takımı",
                    time: "2 days ago",
                    author: "Adam Smith",
                  ),
                  NewsTile(
                    imageUrl:
                        "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1lHhrS.img?w=730&h=410&m=6",
                    title:
                        "Arda Güler'in hayalleri yıkıldı! Ancelotti artık güvenmiyor, ayrılığı açıkladı, işte yeni takımı",
                    time: "2 days ago",
                    author: "Adam Smith",
                  ),
                  NewsTile(
                    imageUrl:
                        "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1lHhrS.img?w=730&h=410&m=6",
                    title:
                        "Arda Güler'in hayalleri yıkıldı! Ancelotti artık güvenmiyor, ayrılığı açıkladı, işte yeni takımı",
                    time: "2 days ago",
                    author: "Adam Smith",
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
