import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/logic/cubit/difficulty_cubit/difficulty_cubit.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.title,
    required this.index,
    required this.difficultyIndex,
    required this.questionTypeIndex,
    required this.numberOfQuestions,
  });

  final String title;
  final int index;
  final int difficultyIndex;
  final int questionTypeIndex;
  final int numberOfQuestions;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<DifficultyCubit>().changeDifficulty(
            difficulty: index,
            type: questionTypeIndex,
            numberOfQuestions: numberOfQuestions);
      },
      child: Container(
        margin: const EdgeInsets.all(6),
        height: 60,
        width: MediaQuery.sizeOf(context).width * 0.27,
        decoration: BoxDecoration(
            color: difficultyIndex == index
                ? const Color(0xff424045)
                : const Color(0xffFCFAFF),
            border: Border.all(color: const Color.fromARGB(255, 233, 233, 233)),
            borderRadius: BorderRadius.circular(25)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: difficultyIndex == index
                    ? const Color(0xffFCFAFF)
                    : const Color(0xff424045)),
          ),
        ),
      ),
    );
  }
}
