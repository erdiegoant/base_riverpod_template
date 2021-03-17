import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_base/app/app.dart';

void main() {
  const incrementButtonKey = Key(
    'counterView_increment_floatingActionButton',
  );
  const decrementButtonKey = Key(
    'counterView_decrement_floatingActionButton',
  );

  testWidgets('CounterProvider', (tester) async {
    await tester.pumpWidget(ProviderScope(child: App()));

    // initial state is 0
    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byKey(incrementButtonKey));
    await tester.pump();

    // state is incremented by 1
    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.byKey(decrementButtonKey));
    await tester.pump();

    // state is decremented by 1
    expect(find.text('0'), findsOneWidget);
  });
}
