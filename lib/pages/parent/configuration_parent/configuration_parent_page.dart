import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/configuration/configuration_bloc.dart';
import 'package:hello_earth/blocs/user_data/user_data_bloc.dart';
import 'package:hello_earth/mappers/contraindication_mappers.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/ui/models/contraindication_model.dart';
import 'package:hello_earth/ui/models/user_model.dart';
import 'package:hello_earth/utils/navigation_utils.dart';
import 'package:hello_earth/widgets/adaptive_button.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ConfigurationParentPage extends StatefulWidget {
  const ConfigurationParentPage({
    super.key,
  });

  @override
  State<ConfigurationParentPage> createState() => _ConfigurationParentPageState();
}

class _ConfigurationParentPageState extends BlocPageState<ConfigurationParentPage, ConfigurationBloc> {
  final List<ContraindicationModel> selectedContraindications = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConfigurationBloc, ConfigurationState>(
      listener: _onStateChange,
      builder: (context, state) {
        return Scaffold(
          body: _buildBody(),
        );
      },
    );
  }

  void _onStateChange(BuildContext context, ConfigurationState state) {
    if (state is ConfigurationCompleted) {
      NavigationUtils.moveToDashboard(context);
    }
  }

  Widget _buildBody() {
    if (bloc.state is ConfigurationFamilyCreateNeeded) {
      return _buildCreateFamilyBody();
    } else if (bloc.state is ConfigurationPlayerCreateNeeded) {
      return _buildQRCodeBody();
    } else {
      return _buildQuestionnaireBody();
    }
  }

  Widget _buildCreateFamilyBody() {
    final UserModel? userModel = BlocProvider.of<UserDataBloc>(context).state.profile;
    return Center(
      child: AdaptiveButton(
        child: Text('Utworzenie rodziny'),
        onPressed: () => {
          bloc.add(
            ConfigurationCreateFamilyRequested(
              parent: userModel,
            ),
          )
        },
      ),
    );
  }

  Widget _buildQRCodeBody() {
    final UserModel? userModel = BlocProvider.of<UserDataBloc>(context).state.profile;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            child: QrImage(
              data: userModel?.familyId ?? '',
            ),
          ),
          AdaptiveButton(
            child: Text(
              'Odśwież',
            ),
            onPressed: () => {},
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionnaireBody() {
    final UserModel? userModel = BlocProvider.of<UserDataBloc>(context).state.profile;
    final List<ContraindicationModel> listOfContraindications = ContraindicationModel.values.map((e) => e).toList();
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: listOfContraindications.length,
            itemBuilder: (_, index) {
              return CheckboxListTile(
                title: Text(listOfContraindications[index].getDescription(context)),
                value: selectedContraindications.contains(listOfContraindications[index]),
                onChanged: (_) {
                  setState(() {
                    if (selectedContraindications.contains(listOfContraindications[index])) {
                      selectedContraindications.remove(listOfContraindications[index]);
                    } else {
                      selectedContraindications.add(listOfContraindications[index]);
                    }
                  });
                },
              );
            },
          ),
        ),
        AdaptiveButton(
          child: Text('Zapisz'),
          onPressed: () => bloc.add(
            SaveQuestionnaireRequested(
              familyUid: userModel?.familyId ?? '',
              listOfContraindications: selectedContraindications.mapToContraindications(),
            ),
          ),
        ),
      ],
    );
  }
}
