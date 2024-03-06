import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:libela_practition/app/config/theme/colors.dart';
import 'package:libela_practition/app/config/theme/theme.dart';

class LineChartIncome extends StatefulWidget {
  const LineChartIncome({super.key});

  @override
  State<LineChartIncome> createState() => _LineChartIncomeState();
}

class _LineChartIncomeState extends State<LineChartIncome> {
  List<Color> gradientColors = [
    kPrimaryAccentColor,
    kPrimaryAccentColor2,
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: theme.style.fullWidth / 1.2,
      child: LineChart(
        mainData(),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = theme.font.f12.copyWith(color: kSoftGrey);
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = Text('Sen', style: style);
        break;
      case 3:
        text = Text('Sel', style: style);
        break;
      case 4:
        text = Text('Rab', style: style);
        break;
      case 5:
        text = Text('Kam', style: style);
        break;
      case 6:
        text = Text('Jum', style: style);
        break;
      case 7:
        text = Text('Sab', style: style);
        break;
      case 8:
        text = Text('Ming', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = theme.font.f12.copyWith(color: kSoftGrey);
    String text;
    switch (value.toInt()) {
      case 1:
        text = '0';
        break;
      case 2:
        text = '200rb';
        break;
      case 3:
        text = '400rb';
        break;
      case 4:
        text = '600rb';
        break;
      case 5:
        text = '800rb';
        break;
      case 6:
        text = '1jt';
        break;
      case 7:
        text = '1,2jt';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: const FlGridData(
        show: false,
        drawVerticalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 26,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border(
            bottom: BorderSide(color: kSofterGrey),
            left: BorderSide(color: kSofterGrey)),
      ),
      minX: 0,
      maxX: 10.2,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
            // FlSpot(15, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                gradientColors[0].withOpacity(0.3),
                gradientColors[1].withOpacity(0.04)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}
