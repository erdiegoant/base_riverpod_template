import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_base/counter/counter.dart';

void main() {
  test('initial state is 0', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    expect(container.read(counter.state), 0);
  });

  test('state is incremented by 1', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    // verify starts at 0
    expect(container.read(counter.state), 0);

    // call increment
    container.read(counter).increment();

    // verify new value
    expect(container.read(counter.state), 1);
  });

  test('state is decremented by 1', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    // verify starts at 0
    expect(container.read(counter.state), 0);

    // call decrement
    container.read(counter).decrement();

    // verify new value
    expect(container.read(counter.state), -1);
  });
}
