import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key, required this.height, required this.width});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final prefs = snapshot.data as SharedPreferences;
          final date = prefs.getString('date');
          final data = prefs.getStringList('data');
          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: CupertinoColors.darkBackgroundGray,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                healthText(data![1]),
                dateText(date!),
                bmiText(data[0]),
              ],
            ),
          );
        } else {
          return Center(child: CupertinoActivityIndicator());
        }
      },
    );
  }

  Widget healthText(String health) {
    return Text(
      health,
      style: TextStyle(
        fontSize: 30,
        color: CupertinoColors.black,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget dateText(String date) {
    return Text(
      date,
      style: TextStyle(
        fontSize: 15,
        color: CupertinoColors.black,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget bmiText(String bmi) {
    return Text(
      bmi,
      style: TextStyle(
        fontSize: 50,
        color: CupertinoColors.black,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
