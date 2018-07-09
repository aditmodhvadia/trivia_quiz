import 'package:flutter_test/flutter_test.dart';
import 'package:trivia_quiz/main.dart';
import 'package:flutter/material.dart';

void main(){
  testWidgets('loads 2 buttons on home screen and when sign up pressed, it loads 3 icons', (WidgetTester tester) async {
      await tester.pumpWidget(MainApp());

      expect(find.text('Sign-In'), findsNWidgets(1));
      expect(find.text('Sign-Up'), findsNWidgets(1));

      await tester.tap(find.text('Sign-Up'));

  //    await tester.tap(find.byType(RaisedButton).last);
      await tester.pumpAndSettle();


      expect(find.byIcon(Icons.person), findsOneWidget);
      expect(find.byIcon(Icons.vpn_key), findsNWidgets(2));
      expect(find.byIcon(Icons.add), findsNothing);

      expect (find.byType(TextField), findsWidgets);
      await tester.enterText(find.byType(TextField).first, 'Adit Modhvadia');
      await tester.tap(find.byType(RaisedButton).first);

      await tester.pumpAndSettle();

      expect(find.byType(TextField), findsNWidgets(5));

    });

  testWidgets('loads 2 buttons on home screen and then Sign-In with credentials', (WidgetTester tester) async{

    await tester.pumpWidget(MainApp());

    expect(find.text('Sign-In'), findsNWidgets(1));
    expect(find.text('Sign-Up'), findsOneWidget);
    expect(find.byType(FlutterLogo), findsOneWidget);

    await tester.tap(find.byType(RaisedButton).first);

    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(Slider), findsNothing);



  });
}