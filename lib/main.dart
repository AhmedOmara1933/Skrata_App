import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skrata_app/shared/cubit/app_cubit.dart';
import 'modules/intro_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xff23481d),
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppCubit()..createDataBase(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
              scaffoldBackgroundColor: const Color(0xff23481d),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.black
              )
          ),
          debugShowCheckedModeBanner: false,
          home: const IntroPage(),
        ),
      ),
    );
  }
}
