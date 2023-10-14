import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skrata_app/shared/cubit/app_cubit.dart';
import 'package:skrata_app/shared/cubit/app_state.dart';
import '../shared/components/card_player.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var list = AppCubit.get(context).cards;
        return ConditionalBuilder(
          condition: list.isNotEmpty,
          builder: (context) => Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      CardPlayer(model: list[index]),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10.0,
                      ),
                  itemCount: list.length)),
          fallback: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No Players\n Found',
                  style: GoogleFonts.bebasNeue(
                      color: Colors.white, fontSize: 75.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
