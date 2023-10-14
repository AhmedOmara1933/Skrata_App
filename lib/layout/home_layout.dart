import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../modules/player.dart';
import '../shared/components/textFormField.dart';
import '../shared/cubit/app_cubit.dart';
import '../shared/cubit/app_state.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is AppInsertIntoDatabase) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          key: cubit.scaffoldKey,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (cubit.isBottomSheetShown) {
                if (cubit.formKey.currentState!.validate()) {
                  cubit.insertToDatabase(name: cubit.playerName.text);
                  cubit.bottomSheetShown(icon: Icons.add, isBottom: false);
                }
              } else {
                cubit.scaffoldKey.currentState!
                    .showBottomSheet(
                      (context) => Form(
                        key: cubit.formKey,
                        child: Container(
                          color: const Color(0xff23481d),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                child: DefaultTextFormField(
                                    text: 'Player Name',
                                    prefixicon: Icons.person,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'playerName must be fill';
                                      }
                                      return null;
                                    },
                                    controller: cubit.playerName),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .closed
                    .then((value) {
                  cubit.bottomSheetShown(icon: Icons.add, isBottom: false);
                });
                cubit.bottomSheetShown(icon: Icons.edit, isBottom: true);
              }
            },
            child: Icon(cubit.fbiIcon),
          ),
          body: const Player(),
        );
      },
    );
  }
}
