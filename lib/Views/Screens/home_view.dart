import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/Logic/Read%20Notes%20Cubit/notes_cubit.dart';
import 'package:notes/Model/note_model.dart';
import 'package:notes/Views/Widgets/dark_light_icon.dart';

import '../Widgets/bottom_sheet_widget.dart';
import '../Widgets/home_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool switcher = false;
  final formKey = GlobalKey<FormState>();

  List<NoteModel>? notes;
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Your Notes",
          style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 1),
        ),
        actions: const [DarkAndLight()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext cxt) {
                return BottomSheetWidget(formKey: formKey);
              });
        },
        child: Icon(
          CupertinoIcons.pencil_outline,
          size: 22.sp,
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 40.h),
          const Expanded(child: HomeListView()),
        ],
      ),
    );
  }
}
