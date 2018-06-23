import 'package:flutter_test/flutter_test.dart';
import 'package:trivia_quiz/main.dart';
import 'package:flutter/material.dart';

void main(){
  testWidgets('loads 2 buttons on home screen and when sign up pressed, it loads 3 icons', (WidgetTester tester) async {
    await tester.pumpWidget(MainApp());

    expect(find.text('Sign-In'), findsNWidgets(1));
    expect(find.text('Sign-Up'), findsNWidgets(1));

    await tester.tap(find.text('Sign-Up'));
    await tester.pumpAndSettle();
    
    expect(find.byIcon(Icons.person), findsOneWidget);
    expect(find.byIcon(Icons.vpn_key), findsNWidgets(2));
    expect(find.byIcon(Icons.add), findsNothing);
    

  });
}