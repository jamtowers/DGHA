import 'package:dgha_brochure/components/dgha_star_rating.dart';
import 'package:dgha_brochure/components/review_count_container.dart';
import 'package:dgha_brochure/misc/styles.dart';
import 'package:dgha_brochure/screens/place_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:dgha_brochure/models/place.dart';

class PlaceCard extends StatelessWidget {
  final PlaceData placeData;

  PlaceCard({@required this.placeData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Semantics(
        label: "${placeData.name}",
        hint: "Double tap to view more details",
        excludeSemantics: true,
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.all(Radius.circular(Styles.normalRadius)),
            boxShadow: [
              BoxShadow(
                color: Styles.grey,
                blurRadius: 6,
                offset: Offset(1, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Builder(
                builder: (context) {
                  return this.placeData.numOfAllReviews > 0
                      ? stars()
                      : noRating();
                },
              ),
              Text(
                placeData.name,
                style: Styles.h3Style,
              ),
              Text(
                placeData.address,
                style: Styles.pStyle,
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, PlaceDetailsScreen.id,
            arguments: placeData);
      },
    );
  }

  Widget stars() {
    return Row(
      children: <Widget>[
        IgnorePointer(
          child: DghaStarRating(
            height: 30,
            rating: this.placeData.avgOverallRating,
            starCount: 5,
          ),
        ),
        SizedBox(
          width: Styles.spacing * 0.25,
        ),
        ReviewCount(
            numOfRating: this.placeData.numOfAllReviews,
            textStyle: Styles.boldPStyle)
      ],
    );
  }

  Widget noRating() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Styles.yellow,
          borderRadius: BorderRadius.all(
            Radius.circular(Styles.normalRadius),
          )),
      child: Text(
        "No Reviews",
        style: Styles.boldPStyle,
      ),
    );
  }
}
