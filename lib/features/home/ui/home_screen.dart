import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteradvace/core/helpers/spacing.dart';
import 'package:flutteradvace/features/home/ui/widgets/doctor_blue_container.dart';
import 'package:flutteradvace/features/home/ui/widgets/doctor_list_view.dart';
import 'package:flutteradvace/features/home/ui/widgets/doctors_specialit_see_all.dart';
import 'package:flutteradvace/features/home/ui/widgets/doctors_speciality_list_view.dart';
import 'package:flutteradvace/features/home/ui/widgets/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20, 16, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorBlueContainer(),
              verticalSpace(24.h),
              const DoctorsSpecialitySeeAll(),
              verticalSpace(18.h),
              const DoctorsSpecialityListView(),
              verticalSpace(8.h),
              const DoctorListView(),
            ],
          ),
        ),
      ),
    );
  }
}
