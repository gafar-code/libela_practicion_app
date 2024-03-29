import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/features/home/presentation/pages/visit_is_over/views/section/app_bar.dart';
import 'package:libela_practition/app/features/home/presentation/pages/visit_is_over/views/section/filter.dart';

import '../controllers/visit_is_over_controller.dart';
import 'section/visit.dart';

class VisitIsOverView extends GetView<VisitIsOverController> {
  const VisitIsOverView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarVisitOver(),
        body: ListView(
            padding: theme.style.padding.allLarge,
            children: const [FilterSection(), VisitSection()]));
  }
}
