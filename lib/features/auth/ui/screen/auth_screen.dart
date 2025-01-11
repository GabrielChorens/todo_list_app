import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_app/core/exceptions/app_exceptions.dart';
import 'package:todo_list_app/core/routing/go_router.dart';
import 'package:todo_list_app/core/shared/domain/entities/user.dart';
import 'package:todo_list_app/core/shared/ui/my_scaffold/my_scaffold.dart';
import 'package:todo_list_app/features/auth/application/auth_cubit.dart';
import 'package:todo_list_app/features/auth/ui/widgets/app_title.dart';
import 'package:todo_list_app/features/auth/ui/widgets/auth_button.dart';
import 'package:todo_list_app/features/auth/ui/widgets/email_field.dart';
import 'package:todo_list_app/features/auth/ui/widgets/password_field.dart';
import 'package:todo_list_app/resources/l10n/l10n.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, this.authCubit});

  final AuthCubit? authCubit;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return AsyncScaffold<AuthCubit, AppExceptions, User>(
      useDefaultAppBar: false,
      bloc: widget.authCubit,
      onSuccess: (context, _) {
        context.goNamed(Routes.home);
      },
      onError: (context, error) {
        if (error is UserNotFound) {
          _formKey.currentState?.fields[EmailField.fieldName]?.invalidate(
            context.l10n.userNotFound,
          );
        }
        if (error is PasswordNotMatch) {
          _formKey.currentState?.fields[PasswordField.fieldName]?.invalidate(
            context.l10n.incorrectPassword,
          );
        }
        if (error is InvalidEmailToRegister) {
          _formKey.currentState?.fields[EmailField.fieldName]?.invalidate(
            context.l10n.invalidEmailToRegister,
          );
        }
      },
      bodyBlocBuilder: (context, _) => Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: AppTitle(),
          ),
          Flexible(
            flex: 2,
            child: FormBuilder(
              key: _formKey,
              child: const Column(
                spacing: 20,
                children: [
                  EmailField(),
                  PasswordField(),
                ],
              ),
            ),
          ),
          Flexible(
            child: Center(
              child: Column(
                children: [
                  AuthButton(
                    text: context.l10n.login,
                    onPressed: () {
                      _onLogin(context);
                    },
                  ),
                  const SizedBox(height: 20),
                  AuthButton(
                    text: context.l10n.register,
                    onPressed: () {
                      _onRegister(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  (String? email, String? password) get _formValues {
    _formKey.currentState?.saveAndValidate();
    final email =
        _formKey.currentState?.fields[EmailField.fieldName]?.value as String?;
    final password = _formKey
        .currentState?.fields[PasswordField.fieldName]?.value as String?;
    return (email, password);
  }

  void _onLogin(BuildContext context) {
    final (email, password) = _formValues;
    if (email != null && password != null) {
      context.read<AuthCubit>().login(email, password);
    }
  }

  void _onRegister(BuildContext context) {
    final (email, password) = _formValues;
    if (email != null && password != null) {
      context.read<AuthCubit>().register(email, password);
    }
  }
}
