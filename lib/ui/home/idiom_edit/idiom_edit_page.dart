import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:yoji/data/model/idiom.dart';
import 'package:yoji/ui/home/idiom_edit/idiom_edit_controller.dart';

class IdiomEditPage extends ConsumerWidget {
  const IdiomEditPage(this._index, {Key? key}) : super(key: key);

  final int? _index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(idiomEditControllerProvider(_index));

    return Material(
      color: Colors.black,
      child: SafeArea(
        top: false,
        child: state.when(
          data: (idiom) => HookBuilder(
            builder: (context) {
              final textController =
                  useTextEditingController(text: idiom?.text ?? '');
              final noteController = useTextEditingController();

              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SingleChildScrollView(
                  controller: ModalScrollController.of(context),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CupertinoNavigationBar(
                        middle: Text(_index == null ? '追加' : '編集'),
                        automaticallyImplyLeading: false,
                        leading: _index != null
                            ? CupertinoButton(
                                padding: EdgeInsets.zero,
                                child: Text('削除',
                                    style: TextStyle(
                                        color: Theme.of(context).errorColor)),
                                onPressed: () {
                                  ref
                                      .read(idiomEditControllerProvider(_index)
                                          .notifier)
                                      .deleteIdiom(_index);
                                  Navigator.pop(context);
                                },
                              )
                            : null,
                        trailing: CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: const Text('保存'),
                          onPressed: () {
                            final newIdiom = Idiom(text: textController.text);
                            ref
                                .read(idiomEditControllerProvider(_index)
                                    .notifier)
                                .saveIdiom(_index, newIdiom);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      TextField(
                        controller: textController,
                        // autofocus: true,
                        style:
                            const TextStyle(fontSize: 24, letterSpacing: 4.0),
                        decoration: _inputDecoration('全角四字'),
                      ),
                      TextField(
                        minLines: 3,
                        maxLines: 3,
                        decoration: _inputDecoration('備考'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
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

  InputDecoration _inputDecoration(final String text) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(12.0),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
      ),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.1))),
      hintText: text,
      hintStyle: TextStyle(
        color: Colors.white.withOpacity(0.2),
      ),
    );
  }
}
