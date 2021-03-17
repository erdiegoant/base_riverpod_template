import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_base/app/app.dart';
import 'package:riverpod_base/counter/counter.dart' show CounterPage;

import 'helpers/helpers.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpApp(ProviderScope(child: App()));
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
