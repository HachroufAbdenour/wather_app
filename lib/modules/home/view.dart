import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/modules/home/widgets/current_wather_widget.dart';
import '../../modules/home/controller.dart';
import '../../widget/widgets.dart';

import '../../modules/home/widgets/header_widget.dart';

class HomeScreen extends StatelessWidget {
  final HomeController weatherController = Get.put(HomeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            child: _buildContent(context),
          ),
        ),
      ),
    );
  }


  Widget _buildContent(BuildContext context) {
    if (weatherController.checkLoading().value) {
      return buildLoadingIndicator();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          Divider(height: 20, thickness: 2),

          CurrentWatherWidget(),
        ],
      );
    }
  }

  

  Widget _buildHeader(BuildContext context) {
    return HeaderWidget(
      cityName: weatherController.wather.value.cityName!,
      formattedDateTime: weatherController.getFormattedDateTime(),
      onPressedRefresh: () => _onRefreshPressed(context),
    );
  }


  void _onRefreshPressed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blueGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Row(
          children: [
            SizedBox(width: 8),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            SizedBox(width: 16),
            Text(
              'Refreshing data...',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
    weatherController.refreshData();
  }
}
