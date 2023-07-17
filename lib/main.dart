import 'package:flutter/material.dart';

class NewsFeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return ListView.builder(
            itemCount: newsArticles.length,
            itemBuilder: (context, index) {
              final article = newsArticles[index];
              return NewsArticleCard(article: article, orientation: orientation);
            },
          );
        },
      ),
    );
  }
}

class NewsArticleCard extends StatelessWidget {
  final NewsArticle article;
  final Orientation orientation;

  const NewsArticleCard({required this.article, required this.orientation});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: orientation == Orientation.portrait
            ? Image.network(article.thumbnailUrl, width: 80, height: 80)
            : Image.network(article.thumbnailUrl, width: 120, height: 120),
        title: Text(article.title),
        subtitle: Text(article.summary),
      ),
    );
  }
}

class NewsArticle {
  final String thumbnailUrl;
  final String title;
  final String summary;

  const NewsArticle({
    required this.thumbnailUrl,
    required this.title,
    required this.summary,
  });
}

// Sample data
final List<NewsArticle> newsArticles = [
  NewsArticle(
    thumbnailUrl: 'https://example.com/article1-thumbnail.jpg',
    title: 'Article 1',
    summary: 'Summary of article 1',
  ),
  NewsArticle(
    thumbnailUrl: 'https://example.com/article2-thumbnail.jpg',
    title: 'Article 2',
    summary: 'Summary of article 2',
  ),
  // Add more news articles here...
];

void main() {
  runApp(MaterialApp(
    home: NewsFeedPage(),
  ));
}
