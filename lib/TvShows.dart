import 'package:flutter/material.dart';

import 'description.dart';

class TvShows extends StatelessWidget {
  final List tvshows;

  const TvShows({Key? key, required this.tvshows}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Popular TV Shows",style: TextStyle(fontSize: 20),),
          SizedBox(height: 10),
          Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tvshows.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(
                            name: tvshows[index]['original_name'],
                            description: tvshows[index]['overview'],
                            bannerurl: 'https://image.tmdb.org/t/p/w500'+tvshows[index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500'+tvshows[index]['poster_path'],
                            vote: tvshows[index]['vote_average'].toString(),
                            launce_date: tvshows[index]['first_air_date'])));

                      },
                      child:
                      tvshows[index]['original_name']!=null?Container(
                        padding: EdgeInsets.all(4),
                        width: 250,
                        child: Column(
                          children: [
                            tvshows[index]['original_name']!=null?Container(
                              decoration: BoxDecoration(
                                borderRadius:BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          tvshows[index]['backdrop_path']),fit: BoxFit.cover
                                ),
                              ),
                              
                              width: 250,
                              height: 140,
                            ):Container(),
                            SizedBox(height: 8),
                            Container(
                              child: Text(
                                  tvshows[index]['original_name']??'Loading'
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
