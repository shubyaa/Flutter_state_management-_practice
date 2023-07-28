import 'package:flutter/material.dart';
import 'package:live_db_streamer/Models/user_model.dart';

class UserCard extends StatefulWidget {
  const UserCard({super.key, required this.user});

  final Users user;

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
      height: MediaQuery.of(context).size.height * .1,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[50],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage:
                      NetworkImage(widget.user.imageUrl!, scale: 1.0),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.user.name.toString()),
                  Text(widget.user.phone != null
                      ? '${widget.user.phone}'
                      : "NAN"),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: widget.user.isLogin! ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
