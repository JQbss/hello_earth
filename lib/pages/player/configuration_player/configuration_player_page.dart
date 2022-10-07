import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/configuration/configuration_bloc.dart';
import 'package:hello_earth/blocs/user_data/user_data_bloc.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';
import 'package:hello_earth/styles/app_dimensions.dart';
import 'package:hello_earth/ui/models/user_model.dart';
import 'package:hello_earth/utils/navigation_utils.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';

class ConfigurationPlayerPage extends StatefulWidget {
  const ConfigurationPlayerPage({
    super.key,
  });

  @override
  State<ConfigurationPlayerPage> createState() =>
      _ConfigurationPlayerPageState();
}

class _ConfigurationPlayerPageState
    extends BlocPageState<ConfigurationPlayerPage, ConfigurationBloc> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConfigurationBloc, ConfigurationState>(
      builder: (_, __) {
        return Scaffold(
          backgroundColor: AppColors.appBackground,
          body: _buildBody(),
        );
      },
      listener: _onStateChange,
    );
  }

  void _onStateChange(BuildContext context, ConfigurationState state) {
    if (state is ConfigurationCompleted) {
      NavigationUtils.moveToDashboard(context);
    }
  }

  Widget _buildBody() {
    return Column(
      children: [
          Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              child: Container(
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Jeszcze chwila...',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Kwestionariusz przez rodzica nie został jeszcze wypełniony',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: AppColors.textFieldBackground,
                  borderRadius:
                      BorderRadius.circular(AppDimensions.radius.input),
                ),
              ),
            ),
          ),
        ),
        _buildBodyRefreshButton(),
      ],
    );
  }

  Widget _buildBodyRefreshButton() {
    final UserModel? userModel =
        BlocProvider.of<UserDataBloc>(context).state.profile;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding:
            EdgeInsets.all(AppDimensions.padding.buttonHorizontal).copyWith(
          bottom: AppDimensions.padding.buttonBottom,
          top: 0.0,
        ),
        child: AdaptiveButton(
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppDimensions.radius.button),
          ),
          child: Text(
            'Odśwież',
            style: TextStyle(
              color: AppColors.buttonText,
            ),
          ),
          onPressed: () => bloc.add(
            ConfigurationCheckPlayerRequested(
              familyId: userModel?.familyId ?? '',
            ),
          ),
        ),
      ),
    );
  }
}
