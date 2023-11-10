import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'chart.dart';
import 'storage_info_card.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Gender Categories",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: defaultPadding),
              Chart(),
              StorageInfoCard(
                svgSrc: "assets/images/male.png",
                title: "Male",
                amountOfFiles: "1328",
              ),
              StorageInfoCard(
                svgSrc: "assets/images/female.png",
                title: "Female",
                amountOfFiles: "1328",
              ),
              StorageInfoCard(
                svgSrc: "assets/images/others.png",
                title: "Others",
                amountOfFiles: "1328",
              ),
            ],
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Youths & PWDs",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: defaultPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Card(
                      elevation: 0,
                      color: Color.fromARGB(255, 99, 98, 98),
                      child: SizedBox(
                        width: 150,
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.group_add_rounded,
                                size: 25,
                                color: Colors
                                    .blueAccent, // Set the icon color based on the title
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Number of youths',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text('2000',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey,
                                          fontSize: 12)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      width:
                          16), // Adjust the width to control the space between the cards
                  Expanded(
                    child: Card(
                      elevation: 0,
                      color: Color.fromARGB(255, 99, 98, 98),
                      child: SizedBox(
                        width: 150,
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.wheelchair_pickup_sharp,
                                size: 25,
                                color: Colors.amber,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Number of PWDs',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    '300',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey,
                                        fontSize: 14),
                                    maxLines:
                                        1, // Set the maximum number of lines
                                    overflow: TextOverflow
                                        .ellipsis, // Add ellipsis for overflow
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
