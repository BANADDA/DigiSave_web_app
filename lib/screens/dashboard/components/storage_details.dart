import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'chart.dart';
import 'storage_info_card.dart';

class StorageDetails extends StatefulWidget {
  final Map<String, dynamic> userStatistics;

  const StorageDetails({Key? key, required this.userStatistics})
      : super(key: key);

  @override
  _StorageDetailsState createState() => _StorageDetailsState();
}

class _StorageDetailsState extends State<StorageDetails> {
  late Map<String, dynamic> _userStatistics = {};

  @override
  void initState() {
    super.initState();
    _userStatistics = widget.userStatistics;
  }

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
                amountOfFiles: _userStatistics['maleUsers'].toString(),
              ),
              StorageInfoCard(
                svgSrc: "assets/images/female.png",
                title: "Female",
                amountOfFiles: _userStatistics['femaleUsers'].toString(),
              ),
              StorageInfoCard(
                svgSrc: "assets/images/others.png",
                title: "Others",
                amountOfFiles: _userStatistics['otherGenderUsers'].toString(),
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
              LayoutBuilder(
                builder: (context, constraints) {
                  final isDesktop = constraints.maxWidth > 768;
                  return Row(
                    mainAxisAlignment: isDesktop
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 0,
                          color: Color.fromARGB(255, 99, 98, 98),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.group_add_rounded,
                                  size: 20,
                                  color: Colors.blueAccent,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Number of youths',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: isDesktop ? 12 : 10,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        _userStatistics['numberOfYouths']
                                            .toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey,
                                          fontSize: isDesktop ? 14 : 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: isDesktop ? 16 : 0,
                      ),
                      Expanded(
                        child: Card(
                          elevation: 0,
                          color: Color.fromARGB(255, 99, 98, 98),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.wheelchair_pickup_sharp,
                                  size: 20,
                                  color: Colors.amber,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Number of PWDs',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: isDesktop ? 12 : 10,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        _userStatistics['pwdYesUsers']
                                            .toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey,
                                          fontSize: isDesktop ? 14 : 12,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
