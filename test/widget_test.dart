import 'package:bootx_app/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BootX app initialization test', (tester) async {
    await tester.pumpWidget(const BootXApp());

    expect(find.text('BootX App'), findsOneWidget);
  });
}
