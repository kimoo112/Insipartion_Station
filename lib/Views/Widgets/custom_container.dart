import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes/Helpers/colors.dart';
import 'package:notes/Logic/App%20Theme%20cubit/app_theme_cubit.dart';
import 'package:notes/Logic/Read%20Notes%20Cubit/notes_cubit.dart';

import '../../Model/note_model.dart';

class CustomContainer extends StatefulWidget {
  const CustomContainer({
    super.key,
    required this.note,
  });
  final NoteModel note;
  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  var dateform = DateFormat.yMEd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        if (state is AppThemeDark) {
          return DarkCustomContainer(
            dateform: dateform,
            note: widget.note,
          );
        } else {
          return LightCustomContainer(
            dateform: dateform,
            note: widget.note,
          );
        }
      },
    );
  }
}

class LightCustomContainer extends StatelessWidget {
  const LightCustomContainer({
    super.key,
    required this.dateform,
    required this.note,
  });

  final String dateform;
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 250,
      decoration: BoxDecoration(
          color: cLightC,
          boxShadow: [
            BoxShadow(
              offset: const Offset(1, 1),
              color: Colors.black.withOpacity(.5),
              spreadRadius: 0,
              blurRadius: 5,
            )
          ],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        note.delete();
                        BlocProvider.of<NotesCubit>(context).fetchData();
                      },
                      icon: const Icon(
                        Icons.delete_forever,
                        color: cDark,
                      ),
                    ),
                    Text(
                      note.title.toUpperCase(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          fontFamily: "Poppins",
                          letterSpacing: .4),
                    ),
                    Opacity(
                      opacity: .8,
                      child: Text(
                        note.date,
                        style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontFamily: "Poppins",
                            letterSpacing: .4),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  note.body,
                  style:
                      const TextStyle(fontFamily: "Poppins", letterSpacing: .2),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DarkCustomContainer extends StatelessWidget {
  const DarkCustomContainer({
    super.key,
    required this.dateform,
    required this.note,
  });

  final String dateform;
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 250,
      decoration: BoxDecoration(
          color: cDarkC,
          boxShadow: [
            BoxShadow(
              offset: const Offset(1, 3),
              color: cGrey.withOpacity(.2),
              spreadRadius: 0,
              blurRadius: 5,
            )
          ],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        note.delete();
                        BlocProvider.of<NotesCubit>(context).fetchData();
                      },
                      icon: const Icon(Icons.delete_forever, color: cLight),
                    ),
                    Text(
                      note.title.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          letterSpacing: .4),
                    ),
                    Opacity(
                      opacity: .8,
                      child: Text(
                        note.date,
                        style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontFamily: "Poppins",
                            letterSpacing: .4),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  note.body,
                  style:
                      const TextStyle(fontFamily: "Poppins", letterSpacing: .2),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
