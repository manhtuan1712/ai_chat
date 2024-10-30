import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuei_ai_chat/core/base/widget/base_button_widget.dart';
import 'package:shuei_ai_chat/core/base/widget/base_text_field_widget.dart';
import 'package:shuei_ai_chat/core/helpers/app_utils.dart';
import 'package:shuei_ai_chat/feature/profile/data/model/request/request_update_profile_model.dart';
import 'package:shuei_ai_chat/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:shuei_ai_chat/generated/l10n.dart';

class UpdateProfileWidget extends StatefulWidget {
  const UpdateProfileWidget({super.key});

  @override
  UpdateProfileWidgetState createState() => UpdateProfileWidgetState();
}

class UpdateProfileWidgetState extends State<UpdateProfileWidget> {
  String _nickName = '';

  String _age = '';

  String _place = '';

  String _hobbies = '';

  String _description = '';

  final TextEditingController _nickNameController = TextEditingController();

  final TextEditingController _ageController = TextEditingController();

  final TextEditingController _placeController = TextEditingController();

  final TextEditingController _hobbiesController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  RequestUpdateProfileModel? _updateProfileModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<ProfileCubit>().getProfileAction();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is GetProfileSuccessState) {
            _updateProfileModel = state.updateProfileModel;
            _nickName = _updateProfileModel?.name ?? '';
            _age = '${_updateProfileModel?.age ?? 0}';
            _place = _updateProfileModel?.location ?? '';
            _description = _updateProfileModel?.description ?? '';
            _hobbies = _updateProfileModel?.hobbies ?? '';
            _nickNameController.text = _nickName;
            _ageController.text = _age;
            _placeController.text = _place;
            _descriptionController.text = _description;
            _hobbiesController.text = _hobbies;
            setState(() {});
          } else if (state is GetProfileFailureState) {
            AppUtils.showToastMessage(
              state.error ?? '',
              context,
            );
          } else if (state is UpdateProfileSuccessState) {
            AppUtils.showToastMessage(
              state.message ?? '',
              context,
            );
          } else if (state is UpdateProfileFailureState) {
            AppUtils.showToastMessage(
              state.error ?? '',
              context,
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24.0,
            horizontal: 16.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () => Navigator.pop(
                      context,
                    ),
                    icon: const Icon(
                      Icons.close,
                      size: 24.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                BaseTextFieldWidget(
                  height: 56.0,
                  hintText: S.of(context).nickName,
                  textEditingController: _nickNameController,
                  background: Colors.white,
                  padding: const EdgeInsets.only(
                    left: 16.0,
                  ),
                  colorText: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      _nickName = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                BaseTextFieldWidget(
                  height: 56.0,
                  hintText: S.of(context).age,
                  textEditingController: _ageController,
                  background: Colors.white,
                  padding: const EdgeInsets.only(
                    left: 16.0,
                  ),
                  colorText: Colors.black,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _age = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                BaseTextFieldWidget(
                  height: 56.0,
                  hintText: S.of(context).place,
                  textEditingController: _placeController,
                  background: Colors.white,
                  padding: const EdgeInsets.only(
                    left: 16.0,
                  ),
                  colorText: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      _place = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                BaseTextFieldWidget(
                  height: 56.0,
                  hintText: S.of(context).hobbies,
                  textEditingController: _hobbiesController,
                  background: Colors.white,
                  padding: const EdgeInsets.only(
                    left: 16.0,
                  ),
                  colorText: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      _hobbies = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                BaseTextFieldWidget(
                  height: MediaQuery.sizeOf(context).height * .95 - 432,
                  hintText: S.of(context).description,
                  textEditingController: _descriptionController,
                  background: Colors.white,
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    top: 8.0,
                  ),
                  textAlignVertical: TextAlignVertical.top,
                  alignment: Alignment.topLeft,
                  colorText: Colors.black,
                  maxLine: 10,
                  onChanged: (value) {
                    setState(() {
                      _description = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                BaseButtonWidget(
                  buttonState: ButtonState.normal,
                  text: S.of(context).update,
                  onClick: () =>
                      context.read<ProfileCubit>().updateProfileAction(
                            _nickName,
                            num.parse(_age),
                            _place,
                            _hobbies,
                            _description,
                          ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
