import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/extensions/list_extensions.dart';
import 'package:hello_earth/generated/assets.gen.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/pages/player/player_mission/player_mission_bloc.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';
import 'package:hello_earth/styles/app_dimensions.dart';
import 'package:hello_earth/ui/models/mission_model.dart';
import 'package:hello_earth/ui/models/step_model.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';
import 'package:hello_earth/widgets/app_progress_indicator.dart';
import 'package:hello_earth/widgets/app_youtub_video.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PlayerMissionPage extends StatefulWidget {
  const PlayerMissionPage();

  @override
  State<PlayerMissionPage> createState() => _PlayerMissionPageState();
}

class _PlayerMissionPageState extends BlocPageState<PlayerMissionPage, PlayerMissionBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(
      const PlayerMissionFetchData(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayerMissionBloc, PlayerMissionState>(
      listener: (_, state) {
        if (state is PlayerMissionCompleted) {
          Navigator.of(context).pop();
        }
      },
      builder: (_, state) {
        Widget child;
        if (state is PlayerMissionInitial) {
          child = AppProgressIndicator();
        } else if (state is PlayerMissionSuccess) {
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
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody() {
    MissionModel? mission = bloc.state.mission;
    final int currentStep = bloc.playerModel?.currentMission?.currentStep ?? 0;
    if (mission == null) return SizedBox.shrink();
    final int missionStep = mission.steps?.length ?? 0;
    return SingleChildScrollView(
      child: Column(
        children: [
          _progressBar(mission, currentStep),
          _buildMissionSteps(mission, currentStep),
          _finishedButton(missionStep, currentStep)
        ],
      ),
    );
  }

  Widget _progressBar(MissionModel mission, int currentStep) {
    final int numberMissionSteps = mission.steps?.length ?? 1;

    final double percent = (currentStep.toDouble()) / numberMissionSteps.toDouble();
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: LinearPercentIndicator(
        width: MediaQuery.of(context).size.width - 50,
        animation: true,
        lineHeight: 25.0,
        percent: percent,
        center: Text('${currentStep}/${numberMissionSteps.toString()}'),
        barRadius: const Radius.circular(16),
        progressColor: AppColors.secondary,
        backgroundColor: AppColors.disabled,
      ),
    );
  }

  Widget _buildMissionSteps(MissionModel mission, int currentStep) {
    final List<StepModel> steps = mission.steps.filterNotNull() ?? [];
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (_, index) => _missionStep(steps[index], currentStep, index),
      itemCount: steps.length,
    );
  }

  Widget _missionStep(StepModel step, int currentStep, int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0).copyWith(right: 0.0),
          child: Row(
            children: [
              Text(
                'Krok ${index + 1}',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              AdaptiveButton(
                child: Assets.svgIcons.checkboxCircle.svg(
                  color: index >= currentStep ? AppColors.disabledMission : AppColors.secondary,
                ),
                onPressed: () => {
                  bloc.add(
                    PlayerMissionChangeRequested(currentStep: index + 1),
                  )
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 10.0,
            bottom: 10.0,
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.textFieldBackground.withOpacity(0.4),
              borderRadius: BorderRadius.circular(AppDimensions.radius.button).copyWith(
                topRight: Radius.circular(0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                style: TextStyle(
                  fontSize: 14.0,
                ),
                step.name ?? '',
              ),
            ),
          ),
        ),
        _youtubVideo(step.video),
        _stepImage(step.image),
      ],
    );
  }

  Widget _youtubVideo(String? url) {
    if (url == null || url.isEmpty) return SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 10.0,
        bottom: 10.0,
      ),
      child: AppYoutubeVideo(url),
    );
  }

  Widget _stepImage(String? url) {
    if (url == null || url.isEmpty) return SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 10.0,
        bottom: 10.0,
      ),
      child: Image.network(url),
    );
  }

  Widget _finishedButton(int missionStep, int currentStep) {
    if (missionStep != currentStep) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 10.0,
        bottom: 10.0,
      ),
      child: AdaptiveButton(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(AppDimensions.radius.button),
        ),
        child: Text(
          'Zakończ zadanie',
          style: TextStyle(
            color: AppColors.buttonText,
          ),
        ),
        onPressed: () {
          bloc.add(
            const PlayerMissionFinishRequested(),
          );
        },
      ),
    );
  }
}
