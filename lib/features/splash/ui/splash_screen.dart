import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_app/core/di/app_injection.dart';
import 'package:todo_list_app/core/routing/go_router.dart';
import 'package:todo_list_app/core/shared/application/core_controller_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, this.coreControllerCubit});

  final CoreControllerCubit? coreControllerCubit;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  CoreControllerCubit get coreControllerCubit =>
      widget.coreControllerCubit ?? getIt<CoreControllerCubit>();
  @override
  void initState() {
    super.initState();
    if (coreControllerCubit.state is Authenticated) {
      //To avoid the splash screen to be shown when the user is already authenticated
      //on app rebuilding
      return context.goNamed(Routes.home);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      coreControllerCubit.initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CoreControllerCubit, CoreControllerState>(
        bloc: coreControllerCubit,
        listener: (context, state) {
          if (state.isAuthenticated) {
            context.goNamed(Routes.home);
          } else {
            context.goNamed(Routes.auth);
          }
        },
        child: Center(
          child: Image.asset('assets/icons/todo_icon.png', width: 200),
        ),
      ),
    );
  }
}
