import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue = '';
  String _passwordValue = '';
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email Address',
              ),
              onChanged: (String value) {
                setState(() {
                  _emailValue = value;
                });
              },
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              onChanged: (String value) {
                _passwordValue = value;
              },
            ),
            SwitchListTile(
              value: _acceptTerms,
              title: Text('Accept Terms'),
              onChanged: (bool value) {
                setState(() {
                  _acceptTerms = value;
                });
              }
            ),
            SizedBox(height: 10.0,),
            RaisedButton(
              child: Text('Login'),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {
                print(_emailValue);
                print(_passwordValue);
                Navigator.pushReplacementNamed(context, '/products');
              },
            )
          ],
        )
      )
    );
  }
}
