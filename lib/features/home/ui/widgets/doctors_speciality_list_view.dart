import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutteradvace/core/helpers/spacing.dart';
import 'package:flutteradvace/core/theming/colors.dart';
import 'package:flutteradvace/core/theming/styles.dart';
import 'package:flutteradvace/features/home/data/models/specializations_response_model.dart';
import 'package:flutteradvace/features/home/ui/widgets/doctors_speciality_list_view_item.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  final List<SpecializationsData?> specializationsData;

  const DoctorsSpecialityListView(
      {super.key, required this.specializationsData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationsData.length ,
        itemBuilder: (context, index) {
          return DoctorsSpecialityListViewItem(
            specializationsData: specializationsData[index]!,
            itemIndex: index,
          );
        },
      ),
    );
  }
}
