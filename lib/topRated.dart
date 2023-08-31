import 'package:flutter/material.dart';

import 'description.dart';

class TopRated extends StatelessWidget {
  final List toprated;

  const TopRated({Key? key, required this.toprated}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("TopRated Movies",style: TextStyle(fontSize: 20),),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: toprated.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(
                            name: toprated[index]['title'],
                            description: toprated[index]['overview'],
                            bannerurl: 'https://image.tmdb.org/t/p/w500'+toprated[index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path'],
                            vote: toprated[index]['vote_average'].toString(),
                            launce_date: toprated[index]['release_date'])));

                      },
                      child:
                      toprated[index]['title']!=null?Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          toprated[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: Text(
                                  toprated[index]['title']??'Loading'
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
