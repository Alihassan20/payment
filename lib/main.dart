import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'const/bloc_observer.dart';
import 'core/business_logic/payment_cubit.dart';
import 'core/data/network/Dio_helper.dart';
import 'feature/payment_view.dart';

void main() async{
  await DioHelper.init();
  BlocOverrides.runZoned(
        () {
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider<PaymentCubit>(create: (context) => PaymentCubit()),
          ],
          child: const MyApp(),
        ),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  PaymentPaymop(),
    );
  }
}
