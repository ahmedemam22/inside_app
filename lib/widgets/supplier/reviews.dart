import 'package:flutter/material.dart';
import 'package:insideapp/util/const.dart';

import '../smooth_star_rating.dart';

class Reviews extends StatefulWidget {
  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Overall Ranking'),
                      SmoothStarRating(
                        starCount: 3,
                        color: Constants.ratingBG,
                        allowHalfRating: true,
                        rating: 5.0,
                        size: 12.0,
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 10,
                child: ListTile(
                  title: Text('Johny depp'),
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/mock/person1.jpg'),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('What a great work, keep it up'),
                      SmoothStarRating(
                        starCount: 5,
                        color: Constants.ratingBG,
                        allowHalfRating: true,
                        rating: 5.0,
                        size: 12.0,
                      ),
                    ],
                  ),
                  isThreeLine: true,
                  trailing: Text('2 weeks ago'),
                ),
              ),
              Card(
                elevation: 10,
                child: ListTile(
                  title: Text('Elon mask'),
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/mock/person2.jpg'),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Not bad, but still needs more of work'),
                      SmoothStarRating(
                        starCount: 4,
                        color: Constants.ratingBG,
                        allowHalfRating: true,
                        rating: 5.0,
                        size: 12.0,
                      ),
                    ],
                  ),
                  isThreeLine: true,
                  trailing: Text('1 week ago'),
                ),
              ),
              Card(
                elevation: 10,
                child: ListTile(
                  title: Text('Mike Tyson'),
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/mock/person3.jpg'),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Cannot be worst !!'),
                      SmoothStarRating(
                        starCount: 1,
                        color: Constants.ratingBG,
                        allowHalfRating: true,
                        rating: 5.0,
                        size: 12.0,
                      ),
                    ],
                  ),
                  isThreeLine: true,
                  trailing: Text('4 months ago'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
