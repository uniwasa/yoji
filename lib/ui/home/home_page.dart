import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:yoji/ui/home/idiom_edit/idiom_edit_page.dart';

import '../../extension/string.dart';
import 'home_controller.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeControllerProvider);

    return Scaffold(
      body: CupertinoScaffold(
        body: state.when(
          data: (idioms) {
            return CustomScrollView(
              slivers: [
                CupertinoSliverNavigationBar(
                  largeTitle: const Text('目録'),
                  trailing: IconButton(
                    iconSize: 24,
                    icon: const Icon(CupertinoIcons.add),
                    onPressed: () {
                      ref
                          .read(homeControllerProvider.notifier)
                          .addIdiom('七転八倒');
                    },
                  ),
                ),
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 4,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final idiom = idioms[index];
                      final idiomTexts = idiom.text
                          .splitByLength((idiom.text.length / 2).floor());
                      return InkWell(
                        onTap: () {
                          CupertinoScaffold.showCupertinoModalBottomSheet(
                            context: context,
                            expand: true,
                            barrierColor: Colors.white.withOpacity(0.1),
                            builder: (context) => const IdiomEditPage(),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Column(
                              children: [
                                for (final text in idiomTexts) Text(text)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: idioms.length,
                  ),
                )
              ],
            );
          },
          error: (error, _) => Center(
            child: Text(error.toString()),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
