import 'package:admin/models/HelloContainer.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class RecentFiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth > 768;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "DigiSave VSLA Accounts Summary",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 20),
              Wrap(
                alignment:
                    isDesktop ? WrapAlignment.start : WrapAlignment.center,
                spacing: 30,
                runSpacing: 25,
                children: [
                  HelloContainer(
                    icon: Icons.woman_outlined,
                    title: 'Women Savings',
                    text: 'UGX 2,000,000',
                    isDesktop: isDesktop,
                  ),
                  HelloContainer(
                    icon: Icons.man_2_outlined,
                    title: 'Men Savings',
                    text: 'UGX 2,000,000',
                    isDesktop: isDesktop,
                  ),
                  HelloContainer(
                    icon: Icons.woman_outlined,
                    title: 'Women Loans',
                    text: 'UGX 5,000,000',
                    isDesktop: isDesktop,
                  ),
                  HelloContainer(
                    icon: Icons.man_2_outlined,
                    title: 'Men Loans',
                    text: 'UGX 2000,000',
                    isDesktop: isDesktop,
                  ),
                  HelloContainer(
                    icon: Icons.group,
                    title: 'Youth Savings',
                    text: 'UGX 2,000,000',
                    isDesktop: isDesktop,
                  ),
                  HelloContainer(
                    icon: Icons.wheelchair_pickup_sharp,
                    title: 'PWDs Savings',
                    text: 'UGX 2,000,000',
                    isDesktop: isDesktop,
                  ),
                  HelloContainer(
                    icon: Icons.group,
                    title: 'Youth Loans',
                    text: 'UGX 5,000,000',
                    isDesktop: isDesktop,
                  ),
                  HelloContainer(
                    icon: Icons.wheelchair_pickup_sharp,
                    title: 'PWDs Loans',
                    text: 'UGX 100,000',
                    isDesktop: isDesktop,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
