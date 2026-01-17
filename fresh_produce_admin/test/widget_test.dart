import 'package:flutter_test/flutter_test.dart';
import 'package:fresh_produce_admin/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FreshProduceAdminApp());

    // Verify that we are on the login screen.
    expect(find.text('Admin Login'), findsOneWidget);
  });
}
