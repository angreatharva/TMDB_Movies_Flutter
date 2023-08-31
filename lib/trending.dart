import 'package:flutter/material.dart';
import 'package:movies/description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key? key, required this.trending}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Trending Movies",style: TextStyle(fontSize: 20),),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trending.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(
                            name: trending[index]['title'],
                            description: trending[index]['overview'],
                            bannerurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'],
                            vote: trending[index]['vote_average'].toString(),
                            launce_date: trending[index]['release_date'])));
                      },
                      child:
                      trending[index]['title']!=null?Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          trending[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: Text(
                                trending[index]['title']??'Loading'
                              ),
                            )
                          ],
                        ),
                      ):Container(),
                    );
                  }))
        ],
      ),
    );
  }
}
