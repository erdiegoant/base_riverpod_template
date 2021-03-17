import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_base/counter/provider/counter_provider.dart';
import 'package:riverpod_base/l10n/l10n.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CounterView();
  }
}

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: const Center(child: CounterText()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Consumer(
            builder: (context, ScopedReader watch, _) {
              final count = watch(counter);
              return FloatingActionButton(
                key: const Key('counterView_increment_floatingActionButton'),
                child: const Icon(Icons.add),
                onPressed: count.increment,
              );
            },
          ),
          const SizedBox(height: 8),
          Consumer(
            builder: (context, ScopedReader watch, _) {
              final count = watch(counter);
              return FloatingActionButton(
                key: const Key('counterView_decrement_floatingActionButton'),
                child: const Icon(Icons.remove),
                onPressed: count.decrement,
              );
            },
          ),
        ],
      ),
    );
  }
}

class CounterText extends HookWidget {
  const CounterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = useProvider(counter.state);
    return Text('$count', style: theme.textTheme.headline1);
  }
}
