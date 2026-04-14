// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:schedule_resolver/main.dart';
import 'package:schedule_resolver/providers/schedule_provider.dart';
import 'package:schedule_resolver/services/ai_schedule_service.dart';

void main() {
  testWidgets('Dashboard renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ScheduleProvider()),
          ChangeNotifierProvider(create: (_) => AiScheduleService()),
        ],
        child: const ScheduleResolverApp(),
      ),
    );

    expect(find.text('Schedule Resolver'), findsOneWidget);
    expect(find.text('No task Added yet'), findsOneWidget);
  });
}
