import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/core/bloc_observer/bloc_observer.dart';
import 'package:project1/core/network/global/dio_helper.dart';
import 'package:project1/core/network/local/shared_preference.dart';
import 'package:project1/core/services/services_locator.dart';
import 'package:project1/features/auth/logic/auth_cubit.dart';
import 'package:project1/features/auth/ui/login_screen.dart';
import 'package:project1/features/home/logic/home_cubit.dart';
import 'package:project1/features/home/ui/list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initGetIt();
  await CacheHelper.init();
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
        BlocProvider(create: (BuildContext context) => sl<AuthCubit>()),
        BlocProvider(
            create: (BuildContext context) => sl<HomeCubit>()..paginationFun()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: CacheHelper.getData(key: "token") == null
            ? LoginScreen()
            : ListScreen(),
      ),
    );
  }
}
