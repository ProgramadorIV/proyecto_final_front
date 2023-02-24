import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_final_front/blocs/authentication/authentication.dart';
import 'package:proyecto_final_front/config/locator.dart';
import 'package:proyecto_final_front/pages/login_page.dart';
import 'package:proyecto_final_front/services/services.dart';
import '../model/models.dart';

class HomePage extends StatelessWidget {
  final User? user;

  const HomePage({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Welcome, ${user?.id== null ? 'bro' : user?.name}',
                style: TextStyle(
                  fontSize: 24
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                //textColor: Theme.of(context).primaryColor,
                /*style: TextButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                ),*/
                child: Text(user?.id == null ? 'LogIn': 'LogOut'),
                onPressed: (){
                  if(user?.id != null){
                    authBloc.add(UserLoggedOut());
                  }
                  else{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  }
                },
              ),
              ElevatedButton(onPressed: () async {
                print("Check");
                JwtAuthenticationService service = getIt<JwtAuthenticationService>();
                await service.getCurrentUser();
              }
              , child: Text('Check')
              )
            ],
          ),
        ),
      ),
    );
  }
}
