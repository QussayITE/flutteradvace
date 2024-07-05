import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteradvace/core/helpers/spacing.dart';
import 'package:flutteradvace/features/home/logic/home_cubit.dart';
import 'package:flutteradvace/features/home/logic/home_state.dart';
import 'package:flutteradvace/features/home/ui/widgets/doctor_blue_container.dart';
import 'package:flutteradvace/features/home/ui/widgets/doctors_list/doctor_list_view.dart';
import 'package:flutteradvace/features/home/ui/widgets/doctors_list/doctors_bloc_builder.dart';
import 'package:flutteradvace/features/home/ui/widgets/doctors_specialit_see_all.dart';
import 'package:flutteradvace/features/home/ui/widgets/specializaations_list/speciality_list_view.dart';
import 'package:flutteradvace/features/home/ui/widgets/home_top_bar.dart';
import 'package:flutteradvace/features/home/ui/widgets/specializaations_list/specializations_bloc_builder.dart';

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
              verticalSpace(24),
              const DoctorsSpecialitySeeAll(),
              verticalSpace(18),
              const SpecializationsBlocBuilder(),
              verticalSpace(8),
              const DoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
