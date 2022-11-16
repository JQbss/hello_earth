import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/commons/text_field_data.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/pages/parent/mission_questionnaire/mission_questionnaire_bloc.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';
import 'package:hello_earth/styles/app_dimensions.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';
import 'package:hello_earth/widgets/app_progress_indicator.dart';
import 'package:hello_earth/widgets/data_text_field.dart';

class MissionQuestionnairePage extends StatefulWidget {
  const MissionQuestionnairePage();

  @override
  State<MissionQuestionnairePage> createState() =>
      _MissionQuestionnairePageState();
}

class _MissionQuestionnairePageState
    extends BlocPageState<MissionQuestionnairePage, MissionQuestionnaireBloc> {
  late final TextFieldData questionnaireDescriptionTextField;

  @override
  void initState() {
    super.initState();
    bloc.add(
      const MissionQuestionnaireFetchData(),
    );
    questionnaireDescriptionTextField = bloc.questionnaireDescriptionTextField;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MissionQuestionnaireBloc, MissionQuestionnaireState>(
      builder: (_, state) {
        Widget child;
        if (state is MissionQuestionnaireLoading) {
          child = AppProgressIndicator();
        } else if (state is MissionQuestionnaireSuccess) {
          child = _buildBody();
        } else {
          child = const SizedBox.shrink();
        }
        return SafeArea(
          child: AnimatedSwitcher(
            duration: const Duration(
              milliseconds: 250,
            ),
            child: Scaffold(
              backgroundColor: AppColors.appBackground,
              body: child,
              bottomNavigationBar: state is MissionQuestionnaireSuccess ? _buildSaveButton() : null,
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _missionQuestionnaireTitle(),
          _missionQuestionnaireForm(),
        ],
      ),
    );
  }

  Widget _missionQuestionnaireTitle() {
    final String title = bloc.state.missionQuestionnaire?.missionName ?? '';
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          'Kwestionariusz do zadania "$title"',
        ),
      ),
    );
  }

  Widget _missionQuestionnaireForm() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          DataTextField(
            questionnaireDescriptionTextField,
            maxLines: 8,
            hintText: '...',
            labelText: 'Wpisz swoję uwagi odnośnie wykonanego zadania',
            onSubmitted: () => FocusScope.of(context)
                .requestFocus(questionnaireDescriptionTextField.focusNode),
          ),
          SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
              'Wstaw graczowi ocenę za wykonane zadanie',
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: _buildDropDownButton(),
          )
        ],
      ),
    );
  }

  Widget _buildDropDownButton() {
    return DropdownButton<int>(
      value: bloc.dropdownValue,
      icon: const Icon(Icons.star),
      elevation: 30,
      style: TextStyle(color: AppColors.primary),
      underline: Container(
        height: 2,
        color: AppColors.primary,
      ),
      onChanged: (int? value) {
        // This is called when the user selects an item.
        setState(() {
          bloc.add(
            MissionQuestionnaireRatingChangeRequested(
              newRating: value ?? 1,
            ),
          );
        });
      },
      items: bloc.list.map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
    );
  }

  Widget _buildSaveButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom:20.0),
      child: AdaptiveButton(
        child: Container(

          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppDimensions.radius.button),
          ),
          child: Center(
            child: Text(
              'Zapisz kwestionariusz',
              style: TextStyle(color: AppColors.buttonText),
            ),
          ),
          width: double.infinity,
          height: AppDimensions.height.button,
        ),


        onPressed: () => {
          // bloc.add(
          // // SignInViewChangeRequested(
          // //   isFormEnabled: true,
          // // ),
          // ),
        },
      ),
    );
  }
}
