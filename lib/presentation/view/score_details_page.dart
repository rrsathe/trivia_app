import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/core/utils.dart';
import 'package:trivia_app/logic/bloc/score/score_bloc.dart';
import 'package:trivia_app/presentation/widgets/score/result_widget.dart';

class ScoreDetailsPage extends StatelessWidget {
  const ScoreDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Details',
          style: TextStyle(
              fontSize: 22,
              // color: Colors.black54,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child:
                  BlocBuilder<ScoreBloc, ScoreState>(builder: (context, state) {
                if (state is ShowScoreDetailsS) {
                  return ListView.builder(
                      itemCount: state.actualAnswerList.length,
                      itemBuilder: (context, index) {
                        return ResultWidget(
                          questionNumber: state.questionNumber[index],
                          question: decodeString(state.questionsList[index]),
                          wrongAnswer:
                              decodeString(state.userAnswerList[index]),
                          correctAnswer:
                              decodeString(state.actualAnswerList[index]),
                          isCorrect: state.userAnswerList[index] ==
                                  state.actualAnswerList[index]
                              ? true
                              : false,
                        );
                      });
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              }))),
    );
  }
}
