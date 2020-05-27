import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_hero/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:healthy_hero/src/bloc/authentication_bloc/authentication_event.dart';
import 'package:healthy_hero/src/bloc/authentication_bloc/authentication_state.dart';
import 'package:healthy_hero/src/repository/user_repository.dart';

import 'src/bloc/avatars_bloc.dart/homePage.dart';

void main() { 
  WidgetsFlutterBinding.ensureInitialized();
  
  final UserRepository userRepository = UserRepository();
  
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(userRepository: userRepository)
      ..add(AppStarted()),
      child: MyApp(userRepository: userRepository),
    )
  );

}

class MyApp extends StatelessWidget {
  
  final UserRepository _userRepository;

  MyApp({Key key, @required UserRepository userRepository})
   : assert (userRepository != null),
     _userRepository = userRepository,
     super(key: key);
     
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My app Recetas",
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return HomePage();
        },
      ),
    );
  }
}