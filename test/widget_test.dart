import 'package:deliveristo_assignment/ui/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deliveristo_assignment/ui/home_page/bloc/homepage_bloc.dart';

import 'mock/repository_mock.dart';

void main() {
  testWidgets('BreedSelector widget test', (WidgetTester tester) async {
    MockRepository repo = MockRepository();
    final homepageBloc = HomepageBloc(repo);

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: BlocProvider.value(
          value: homepageBloc,
          child: const HomePage(),
        ),
      ),
    ));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle(); // Wait for the widget to rebuild

    // Verify that the DropdownButton and other widgets are present in the widget tree
    expect(find.byType(DropdownButton), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsNWidgets(1));
    expect(find.byType(TextFormField), findsOneWidget);

    // Test interactions with widgets if needed

    // Example: Testing a button tap
    // await tester.tap(find.text("Random Dog"));
    await tester.pumpAndSettle();

    // You can add more test cases to cover various scenarios of the widget.
  });
}
