import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_earth/blocs/configuration/configuration_bloc.dart';
import 'package:hello_earth/blocs/user_data/user_data_bloc.dart';
import 'package:hello_earth/mappers/contraindication_mappers.dart';
import 'package:hello_earth/pages/bloc_page_state.dart';
import 'package:hello_earth/styles/app_colors/app_colors.dart';
import 'package:hello_earth/styles/app_dimensions.dart';
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
  State<ConfigurationParentPage> createState() =>
      _ConfigurationParentPageState();
}

class _ConfigurationParentPageState
    extends BlocPageState<ConfigurationParentPage, ConfigurationBloc> {
  final List<ContraindicationModel> selectedContraindications = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConfigurationBloc, ConfigurationState>(
      listener: _onStateChange,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.appBackground,
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
      final UserModel? userModel =
          BlocProvider.of<UserDataBloc>(context).state.profile;
      bloc.add(
        ConfigurationCreateFamilyRequested(
          parent: userModel,
        ),
      );
      return _buildCreateFamilyBody();
    } else if (bloc.state is ConfigurationPlayerCreateNeeded) {
      return _buildQRCodeWithOnBoardTextBody();
    } else {
      return _buildQuestionnaireBody();
    }
  }

  Widget _buildCreateFamilyBody() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildQRCodeWithOnBoardTextBody() {
    return Center(
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: SizedBox.shrink(),
            ),
            _buildOnBoardTextBody(),
            _buildQRCodeBody(),
            _buildRefreshButtonBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildOnBoardTextBody() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Center(
            child: Text(
              'Witamy na pokładzie',
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
            '\tZaczynasz właśnie przygodę z Cooking planet!\n\n\tŻeby zarejestrować się musisz zeskanować kod QR u rodzica, jeżeli twój rodzic/opiekun jeszcze nie założył konto to sam czas to zrobić!\n\n\tPo zeskanowaniu kodu QR pojawi się formularz który należy wypełnić i powitamy Ci w naszym gronie',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQRCodeBody() {
    final UserModel? userModel =
        BlocProvider.of<UserDataBloc>(context).state.profile;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.radius.input),
        color: AppColors.textFieldBackground,
      ),
      width: 250,
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.padding.container),
        child: QrImage(
          data: userModel?.familyId ?? '',
        ),
      ),
    );
  }

  Widget _buildRefreshButtonBody() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.padding.buttonHorizontal),
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
          onPressed: () => {},
        ),
      ),
    );
  }

  Widget _buildQuestionnaireBody() {
    final UserModel? userModel =
        BlocProvider.of<UserDataBloc>(context).state.profile;
    final List<ContraindicationModel> listOfContraindications =
        ContraindicationModel.values.map((e) => e).toList();
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: listOfContraindications.length,
            itemBuilder: (_, index) {
              return CheckboxListTile(
                title: Text(
                    listOfContraindications[index].getDescription(context)),
                value: selectedContraindications
                    .contains(listOfContraindications[index]),
                onChanged: (_) {
                  setState(() {
                    if (selectedContraindications
                        .contains(listOfContraindications[index])) {
                      selectedContraindications
                          .remove(listOfContraindications[index]);
                    } else {
                      selectedContraindications
                          .add(listOfContraindications[index]);
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
              listOfContraindications:
                  selectedContraindications.mapToContraindications(),
            ),
          ),
        ),
      ],
    );
  }
}
