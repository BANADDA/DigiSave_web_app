import 'package:admin/models/HelloContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';

class RecentFiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 768;

    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "DigiSave VSLA Accounts Summary",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (isDesktop)
                            HelloContainer(
                              icon: Icons.woman_outlined,
                              title: 'Women Savings',
                              text: 'UGX 2,000,000',
                            ),
                          if (isDesktop)
                            SizedBox(
                              width: 30,
                            ),
                          HelloContainer(
                              icon: Icons.man_2_outlined,
                              title: 'Men Savings',
                              text: 'UGX 2,000,000'),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HelloContainer(
                            icon: Icons.woman_outlined,
                            title: 'Women Loans',
                            text: 'UGX 5,000,000',
                          ),
                          if (isDesktop)
                            SizedBox(
                              width: 30,
                            ),
                          HelloContainer(
                              icon: Icons.man_2_outlined,
                              title: 'Men Loans',
                              text: 'UGX 2000,000'),
                        ],
                      ),
                    ],
                  ),
                  if (isDesktop)
                    SizedBox(
                      width: 30,
                    ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (isDesktop)
                            HelloContainer(
                              icon: Icons.group,
                              title: 'Youth Savings',
                              text: 'UGX 2,000,000',
                            ),
                          if (isDesktop)
                            SizedBox(
                              width: 30,
                            ),
                          HelloContainer(
                              icon: Icons.wheelchair_pickup_sharp,
                              title: 'PWDs Savings',
                              text: 'UGX 2,000,000'),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HelloContainer(
                            icon: Icons.group,
                            title: 'Youth Loans',
                            text: 'UGX 5,000,000',
                          ),
                          if (isDesktop)
                            SizedBox(
                              width: 30,
                            ),
                          HelloContainer(
                              icon: Icons.wheelchair_pickup_sharp,
                              title: 'PWDs Loans',
                              text: 'UGX 100,000'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
