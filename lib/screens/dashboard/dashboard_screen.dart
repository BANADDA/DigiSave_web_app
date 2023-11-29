import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/my_fields.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/header.dart';

import 'components/recent_files.dart';
import 'components/storage_details.dart';

class DashboardScreen extends StatefulWidget {
  final Map<String, dynamic> userStatistics;

  const DashboardScreen({Key? key, required this.userStatistics})
      : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Map<String, dynamic> _userStatistics;

  @override
  void initState() {
    super.initState();
    // _userStatistics = widget.userStatistics;
    // print('staticas: $_userStatistics');
  }

  @override
  Widget build(BuildContext context) {
    _userStatistics = widget.userStatistics;
    if (_userStatistics.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      MyFiles(),
                      SizedBox(height: defaultPadding),
                      RecentFiles(),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context))
                        StorageDetails(
                          userStatistics: _userStatistics,
                        ),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we don't want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: StorageDetails(
                      userStatistics: _userStatistics,
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
