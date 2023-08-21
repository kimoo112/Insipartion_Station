import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:notes/Helpers/colors.dart';
import 'package:notes/Logic/App%20Theme%20cubit/app_theme_cubit.dart';

import '../../Logic/Read Notes Cubit/notes_cubit.dart';
import '../../Model/note_model.dart';
import 'custom_container.dart';

class HomeListView extends StatefulWidget {
  const HomeListView({
    super.key,
  });

  @override
  State<HomeListView> createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
  bool isEmpty = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        isEmpty = notes.isEmpty;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 28),
          child: isEmpty
              ? BlocBuilder<AppThemeCubit, AppThemeState>(
                  builder: (context, state) {
                    if (state is AppThemeLight) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Lottie.asset('assets/images/Empty Notes.json',
                                width: 250.w),
                            Text(
                              'No Notes Added You Can add Your Notes',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: cDark,
                                  fontFamily: 'Poppins'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Lottie.asset('assets/images/Empty Notes.json',
                              width: 250.w),
                          Center(
                            child: Text(
                              'No Notes Added You Can add Your Notes',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: cLight,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                )
              : ListView.builder(
                  itemCount: notes.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomContainer(
                        note: notes[index],
                      ),
                    );
                  }),
        );
      },
    );
  }
}
