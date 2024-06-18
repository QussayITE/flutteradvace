import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteradvace/core/helpers/spacing.dart';
import 'package:flutteradvace/core/theming/styles.dart';
import 'package:flutteradvace/features/home/data/models/specializations_response_model.dart';
import 'package:flutteradvace/features/home/ui/widgets/doctor_list_view_item.dart';

class DoctorListView extends StatelessWidget {
  final List<Doctors?>? doctorsList;

  const DoctorListView({super.key, this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsList?.length,
        itemBuilder: (context, index) { 
          return DoctorListViewItem(doctorModel: doctorsList?[index]);
        },
      ),
    );
  }
}
