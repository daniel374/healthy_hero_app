import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:healthy_hero/routes/routes.dart';
import 'package:healthy_hero/src/bloc/bloc.dart';
import 'package:healthy_hero/src/pages/alert_page.dart';
import 'package:healthy_hero/src/pages/home_page.dart';
import 'package:bloc/bloc.dart';
import 'package:healthy_hero/src/repository/user_repository.dart';
import 'package:healthy_hero/src/simple_bloc_delegate.dart';
import 'package:healthy_hero/src/ui/home_screen.dart';
import 'package:healthy_hero/src/ui/login_screen.dart';
import 'package:healthy_hero/src/ui/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();

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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: ( RouteSettings settings ) {

        print( 'Ruta llamada: ${ settings.name } ');
        return MaterialPageRoute(
          builder: ( BuildContext context ) => AlertPage(),
        
        );

      },
      //home: MyHomePage(),

      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state){
          if (state is Uninitialized) {
            return SplashScreen();
          }
          if (state is Authenticated) {
            //return HomeScreen(name: state.displayName,);
            return MyHomePage(name: state.displayName,);
          }
          if (state is Unauthenticated) {
            return LoginScreen(userRepository: _userRepository,);// <- Login
          }
          return Container();
        },
        
      ),
    );
  }
}
