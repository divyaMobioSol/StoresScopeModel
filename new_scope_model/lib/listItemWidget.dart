import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ListItem extends StatelessWidget {
  String imageString;
  String title;
  String description;
  String price;
  double rating;
  ListItem(
      {required this.description,
      required this.title,
      required this.imageString,
      required this.price,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(imageString),
        titleMethod(context),
        priceMethiod(),
        ratingMethod()
      ],
    );
  }

  Positioned titleMethod(BuildContext context) {
    return Positioned(
        bottom: 10,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black45, borderRadius: BorderRadius.circular(10)),
            //height: 60,
            width: MediaQuery.of(context).size.width * 0.9,

            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description,
                    maxLines: 3,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Positioned ratingMethod() {
    return Positioned(
        right: 10,
        child: RatingBar.builder(
          itemSize: 20,
          initialRating: rating,
          // minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,

          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {},
        ));
  }

  Positioned priceMethiod() {
    return Positioned(
        child: Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          '\$ ${price}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    ));
  }
}
