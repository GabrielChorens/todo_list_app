import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:todo_list_app/core/exceptions/app_exceptions.dart';
import 'package:todo_list_app/core/shared/domain/entities/user.dart';
import 'package:todo_list_app/core/shared/ui/my_scaffold/my_scaffold.dart';
import 'package:todo_list_app/core/shared/ui/my_scaffold/scaffold_params.dart';
import 'package:todo_list_app/features/auth/ui/widgets/email_field.dart';
import 'package:todo_list_app/features/profile/application/update_profile_cubit.dart';
import 'package:todo_list_app/features/profile/ui/widgets/fields.dart';
import 'package:todo_list_app/features/profile/ui/widgets/profile_picture_circle_avatar.dart';
import 'package:todo_list_app/resources/l10n/l10n.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, this.updateProfileCubit});

  final UpdateProfileCubit? updateProfileCubit;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return AsyncScaffold<UpdateProfileCubit, AppExceptions, User>(
      bloc: widget.updateProfileCubit,
      scaffoldAdditionalParams: const ScaffoldParams(
        resizeToAvoidBottomInset: false,
      ),
      loadingSpinnerType: LoadingSpinnerType.fullSizeBody,
      defaultAppBarTitle: context.l10n.profile,
      bodyBlocBuilder: (context, state) {
        return FormBuilder(
          key: _formKey,
          child: Column(
            spacing: 16,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: ProfilePictureCircleAvatar(
                  imageUrl: state.data?.photoUrl,
                ),
              ),
              NameField(
                initialValue: state.data?.name,
              ),
              LastNameField(
                initialValue: state.data?.lastName,
              ),
              EmailField(
                initialValue: state.data?.email,
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                ),
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    final user = User(
                      id: state.data!.id,
                      name: _formKey.currentState!.fields[NameField.fieldName]
                          ?.value as String?,
                      lastName: _formKey.currentState!
                          .fields[LastNameField.fieldName]?.value as String?,
                      email: _formKey.currentState!
                          .fields[EmailField.fieldName]!.value as String,
                      photoUrl: state.data?.photoUrl,
                    );
                    context.read<UpdateProfileCubit>().updateUserProfile(user);
                  }
                },
                child: Text(context.l10n.save),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
