import 'package:flutter/material.dart';
import 'package:wisatabandung/model/tourism_place.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen', color: Colors.white);
var webInformationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  const DetailScreen({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 800) {
            return DetailWebPage(place: place,);
          } else {
            return DetailMobilePage(place: place);
          }
        },
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  final TourismPlace place;

  const DetailMobilePage({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image.asset(place.imageAsset),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(onPressed: (){
                            Navigator.pop(context);
                          }, icon: Icon(Icons.arrow_back, color: Colors.white,)),
                        ),
                        FavoriteButton(),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Text(
                  place.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Staatliches',
                      color: Colors.white
                  ),
                )
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                      ),
                      SizedBox(height: 8.0,),
                      Text(
                        place.openDays,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                          Icons.access_time,
                          color: Colors.white
                      ),
                      SizedBox(height: 8.0,),
                      Text(
                        place.openTime,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                          Icons.monetization_on,
                          color: Colors.white
                      ),
                      SizedBox(height: 8.0,),
                      Text(
                        place.ticketPrice,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.00),
              child: Text(
                place.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Oxygen',
                    color: Colors.white
                ),
              ),
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailWebPage extends StatefulWidget {
  final TourismPlace place;

  DetailWebPage({Key? key, required this.place}) : super(key: key);

  @override
  State<DetailWebPage> createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 64,
        ),
        child: Center(
          child: SizedBox(
            width: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wisata Bandung',
                  style: TextStyle(
                    fontFamily: 'Staatliches',
                    fontSize: 32,
                  ),
                ),
                SizedBox(height: 32,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Column(
                          children: [
                            ClipRRect(
                              child: Image.asset(widget.place.imageAsset),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            SizedBox(height: 16,),
                            Container(
                              height: 150,
                              padding: EdgeInsets.only(bottom: 16),
                              child: Scrollbar(
                                controller: _scrollController,
                                child: Container(
                                  height: 150,
                                  padding: EdgeInsets.only(bottom: 16),
                                  child: ListView(
                                    controller: _scrollController,
                                    scrollDirection: Axis.horizontal,
                                    children: widget.place.imageUrls.map((url) {
                                      return Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.network(url),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                    SizedBox(width: 32,),
                    Expanded(
                        child: Card(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  child: Text(
                                    widget.place.name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'Staatliches'
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.calendar_today),
                                        SizedBox(width: 8.0,),
                                        Text(
                                          widget.place.openDays,
                                          style: webInformationTextStyle,
                                        )
                                      ],
                                    ),
                                    FavoriteButton(),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.access_time),
                                    SizedBox(width: 8.0,),
                                    Text(
                                      widget.place.openTime,
                                      style: webInformationTextStyle,
                                    )
                                  ],
                                ),
                                SizedBox(height: 8.0,),
                                Row(
                                  children: [
                                    Icon(Icons.monetization_on),
                                    SizedBox(width: 8.0,),
                                    Text(
                                      widget.place.ticketPrice,
                                      style: webInformationTextStyle,
                                    )
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 16.0),
                                  child: Text(
                                    widget.place.description,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'Oxygen'
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}



class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      setState((){
        isFavorite = !isFavorite;
      });
    }, icon: Icon(
      isFavorite ? Icons.favorite : Icons.favorite_border,
      color: Colors.red,
    ));
  }
}

