import 'package:flutter/material.dart';
import 'package:healthy_hero/src/repository/user_repository.dart';
import 'package:healthy_hero/src/ui/register/register_screen.dart';

class CreateAccountButton extends StatelessWidget {
  final UserRepository _userRepository;

  CreateAccountButton({Key key, @required UserRepository userRepository})
    :assert(userRepository!= null),
    _userRepository = userRepository,
    super(key: key);


  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Create an Account'),
      onPressed: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context){
            return RegisterScreen(userRepository: _userRepository,);
          })
        );
      },
    );
  }
}