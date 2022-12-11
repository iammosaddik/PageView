


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pageview/Repository/news_repo.dart';

final getLatestNews = FutureProvider((ref) => NewsRepo().getNews());
final getDetailsNewsProvider = FutureProvider.family((ref,newsid) => NewsRepo().getDetails(newsid.toString()));