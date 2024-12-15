import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/core/bloc_observer/bloc_observer.dart';
import 'package:project1/core/data/global/dio_helper.dart';
import 'package:project1/features/auth/data/repository/auth_repository.dart';
import 'package:project1/features/auth/data/web_services/auth_web_services.dart';
import 'package:project1/features/auth/logic/auth_cubit.dart';
import 'package:project1/features/auth/ui/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SharedPreferenceHelper.initSharedPreferenceHelper();
  await DioHelper.initDioHelper();

  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
            create: (BuildContext context) =>
                AuthCubit(AuthRepository(AuthWebServices()))),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
