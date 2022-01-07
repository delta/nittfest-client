import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:nittfest/views/themes/app_themes.dart';

class RegisterButton extends StatelessWidget {
  final double buttonSize;
  const RegisterButton({Key? key, required this.buttonSize}) : super(key: key);
  static const String formLink = 'https://delta.nitt.edu';

  @override
  Widget build(BuildContext context) => MaterialButton(
        elevation: 15,
        color: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                elevation: 20,
                child: Container(
                  width: 10,
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      const SizedBox(height: 10, width: 10),
                      const Center(child: Text('Inductions Teams')),
                      _buildRow(formLink, 'Ambience'),
                      _buildRow(formLink, 'Audio/Visual'),
                      _buildRow(formLink, 'Content'),
                      _buildRow(formLink, 'Design'),
                      _buildRow(formLink, 'Events'),
                      _buildRow(formLink, 'OC'),
                      SizedBox(height: 12),
                    ],
                  ),
                )),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
          child: Text(
            'REGISTER',
            style: TextStyle(
              color: Colors.purple,
              letterSpacing: 2,
              fontWeight: FontWeight.w600,
              shadows: AppTheme.shadows,
              fontSize: buttonSize,
            ),
          ),
        ),
      );
}

Widget _buildRow(String formLink, String name) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 12),
          Container(height: 2, color: Colors.redAccent),
          SizedBox(height: 12),
          Row(
            children: <Widget>[
              SizedBox(width: 12),
              Center(child: Text(name)),
              Spacer(),
              InkWell(
                onTap: () {
                  html.window.open(formLink, 'new tab');
                }, // Handle your callback
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.yellow[900],
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Text('Apply'),
                ),
              )
            ],
          ),
        ],
      ),
    );
