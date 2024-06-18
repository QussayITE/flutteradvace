import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteradvace/core/helpers/spacing.dart';
import 'package:flutteradvace/features/home/logic/home_cubit.dart';
import 'package:flutteradvace/features/home/logic/home_state.dart';
import 'package:flutteradvace/features/home/ui/widgets/doctor_list_view.dart';
import 'package:flutteradvace/features/home/ui/widgets/doctors_speciality_list_view.dart';

class SpecializationsAndDoctorsBloc extends StatelessWidget {
  const SpecializationsAndDoctorsBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationsLoading ||
          current is SpecializationsSuccess ||
          current is SpecializationsError,
      builder: (context, state) {
        return state.maybeWhen(
            specializationsLoading: () {
              return setUpLoading();
            },
            specializationsSuccess: (specializationsResponseModel) {
              var specializationsList =
                  specializationsResponseModel.specializationDataList;
              return setUpSuccess(specializationsList);
            },
            specializationsError: (errorHandler) => setUpError(),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }

  Widget setUpLoading() {
    return SizedBox(
      height: 100.h,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget setUpSuccess(specializationsList) {
    return Expanded(
      child: Column(
        children: [
          DoctorsSpecialityListView(
            specializationsData: specializationsList ?? [],
          ),
          verticalSpace(8.h),
          DoctorListView(
            doctorsList: specializationsList?[0]?.doctorsList,
          ),
        ],
      ),
    );
  }

  Widget setUpError() {
    return const SizedBox.shrink();
  }
}
