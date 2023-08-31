
import 'package:flutter/material.dart';
import 'package:movies/TvShows.dart';
import 'package:movies/topRated.dart';
import 'package:movies/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     theme: ThemeData(brightness: Brightness.dark,primaryColor: Colors.cyan),
     debugShowCheckedModeBanner: false,
      home:  MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadmovies();
  }

  final String apikey = '1761443eed3b5759e585651fa2475583';
  final String readaccesstoken ='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxNzYxNDQzZWVkM2I1NzU5ZTU4NTY1MWZhMjQ3NTU4MyIsInN1YiI6IjY0ZGM1MjI2MzcxMDk3MDBmZmI4MzZhYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.5a1vwjLPuzuzfhW_0bRg0pX6pOWzePs2f6gW6kNQHdA';
  List trendingmovies = [];
  List topratedmovies = [];
  List tvshows = [];




  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();
    print(tvresult);
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tvshows = tvresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        title:  Text("Crystal Movies")
      ),
      body: ListView(
        children: [
          TvShows(tvshows: tvshows ),
          TopRated(toprated: topratedmovies),
          TrendingMovies(trending: trendingmovies),

        ],

      ),
    );
  }
}
