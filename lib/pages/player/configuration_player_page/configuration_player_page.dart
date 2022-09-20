import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/configuration/configuration_bloc.dart';
import 'package:hello_earth/blocs/user_data/user_data_bloc.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/ui/models/user_model.dart';
import 'package:hello_earth/utils/navigation_utils.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';

class ConfigurationPlayerPage extends StatefulWidget {
  const ConfigurationPlayerPage({
    super.key,
  });

  @override
  State<ConfigurationPlayerPage> createState() => _ConfigurationPlayerPageState();
}

class _ConfigurationPlayerPageState extends BlocPageState<ConfigurationPlayerPage, ConfigurationBloc> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConfigurationBloc, ConfigurationState>(
      builder: (_, __) {
        return Scaffold(
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
    final UserModel? userModel = BlocProvider.of<UserDataBloc>(context).state.profile;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Kwestionariusz przez rodzica nie został jeszcze wypełniony.'),
        AdaptiveButton(
          child: Text('Odśwież'),
          onPressed: () => bloc.add(
            ConfigurationCheckPlayerRequested(
              familyId: userModel?.familyId ?? '',
            ),
          ),
        ),
      ],
    );
  }
}
