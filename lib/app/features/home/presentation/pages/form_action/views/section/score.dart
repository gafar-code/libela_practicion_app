import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:libela_practition/app/config/theme/font.dart';
import 'package:libela_practition/app/config/theme/style.dart';
import 'package:libela_practition/app/config/theme/theme.dart';
import 'package:libela_practition/app/core/utils/screen_size.dart';
import 'package:libela_practition/app/features/home/presentation/pages/form_action/controllers/form_action_controller.dart';

import '../../../../../../../config/theme/colors.dart';

class ScoreSection extends StatelessWidget {
  const ScoreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormActionController>(builder: (controller) {
      return Padding(
        padding: theme.style.padding.bottomLarge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Silakan lengkapi form tindakan sebelum mengakhiri sesi.',
                style: theme.font.f14.semibold),
            Gap(12.h),
            Text('Hasil Penilaian Kemampuan Fungsional .',
                style: theme.font.f14),
            Gap(8.h),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  bool isSelectedFunctionalAbility = controller
                      .selectedFunctionalAbilities
                      .contains(controller.functionalAbilities[index]);
                  return GestureDetector(
                    onTap: () => controller.selectFunctionalAbilities(
                        controller.functionalAbilities[index], index),
                    child: Container(
                      width: getWidthScale(1),
                      color: Colors.transparent,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 18.r,
                              width: 18.r,
                              child: Transform.scale(
                                scale: 1,
                                child: Checkbox(
                                    value: isSelectedFunctionalAbility,
                                    activeColor: kInfoColor,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity.compact,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(3.r)),
                                    side: BorderSide(
                                        color: kSoftGrey, width: 1.2),
                                    onChanged: (value) =>
                                        controller.selectFunctionalAbilities(
                                            controller
                                                .functionalAbilities[index],
                                            index)),
                              ),
                            ),
                            Gap(12.h),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(controller.functionalAbilities[index],
                                      style: theme.font.f12),
                                  Gap(8.h),
                                  Text(
                                    'Pilih score 1-4',
                                    style: theme.font.f12
                                        .copyWith(color: kSoftGrey),
                                  ),
                                  Gap(8.h),
                                  Row(
                                      children: List.generate(4, (indexScore) {
                                    bool isScoreSelected =
                                        controller.selectedScors[index] != 0 &&
                                            controller.selectedScors[index] ==
                                                indexScore + 1;
                                    return Padding(
                                      padding: theme.style.padding.rightMedium,
                                      child: GestureDetector(
                                        onTap: isSelectedFunctionalAbility
                                            ? () => controller.selectScors(
                                                indexScore + 1, index)
                                            : null,
                                        child: Container(
                                          height: 22.r,
                                          width: 22.r,
                                          decoration: BoxDecoration(
                                              color: isScoreSelected
                                                  ? kInfoColorAccent
                                                  : kSofterGrey,
                                              border: Border.all(
                                                  color: isScoreSelected
                                                      ? kInfoColor
                                                      : Colors.transparent),
                                              shape: BoxShape.circle),
                                          child: Center(
                                            child: Text('${indexScore + 1}',
                                                style: theme.font.f10.copyWith(
                                                    color: isScoreSelected
                                                        ? kInfoColor
                                                        : kSoftGrey)),
                                          ),
                                        ),
                                      ),
                                    );
                                  }))
                                ])
                          ]),
                    ),
                  );
                },
                separatorBuilder: (_, i) => Gap(12.h),
                itemCount: controller.functionalAbilities.length)
          ],
        ),
      );
    });
  }
}
