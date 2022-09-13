import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/configuration/configuration_bloc.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';

class ConfigurationParentPage extends StatefulWidget {
  const ConfigurationParentPage({
    super.key,
  });

  @override
  State<ConfigurationParentPage> createState() => _ConfigurationParentPageState();
}

class _ConfigurationParentPageState extends BlocPageState<ConfigurationParentPage, ConfigurationBloc> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfigurationBloc, ConfigurationState>(
      builder: (context, state) {
        return Scaffold(
          body: _buildBody(),
        );
      },
    );
  }

  Widget _buildBody() {
    if (bloc.state is ConfigurationFamilyCreateNeeded) {
      return _buildCreateFamilyBody();
    } else {
      return _buildQRCodeBody();
    }
  }

  Widget _buildCreateFamilyBody() {
    return Container(
      child: Text('Utworzenie rodziny'),
    );
  }

  Widget _buildQRCodeBody() {
    return Container();
  }
}
