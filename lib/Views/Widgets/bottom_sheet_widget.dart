import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/Logic/Add%20Note%20Cubit/add_note_cubit.dart';
import 'package:notes/Logic/Read%20Notes%20Cubit/notes_cubit.dart';
import 'package:notes/Views/Widgets/bottom_shit_form.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, body;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailed) {
          } else if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchData();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
                child: BottomForm(formKey: widget.formKey)),
          );
        },
      ),
    );
  }
}
