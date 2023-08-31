import 'package:flutter/material.dart';

class Description extends StatelessWidget {

  final String name,description,bannerurl,posterurl,vote,launce_date;

  const Description({Key? key, required this.name, required this.description, required this.bannerurl, required this.posterurl, required this.vote, required this.launce_date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(bannerurl,fit: BoxFit.cover,),

                      )
                  ),
                  Positioned(
                    bottom: 10,
                      child: Text(" ⭐ Average Rating - "+vote,style: TextStyle(fontSize: 18),)
                  )
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(name!=null ? name : "Not Loaded",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text("Releasing On - "+launce_date,style: TextStyle(fontSize: 18),),
            ),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(
                    child: Text(description,style: TextStyle(fontSize: 18),),
                  ),
                )
              ],
            ),

            
          ],
        ),
      ),
    );
  }
}
