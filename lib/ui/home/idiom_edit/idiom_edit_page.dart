import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:yoji/ui/home/idiom_edit/idiom_edit_controller.dart';

class IdiomEditPage extends ConsumerWidget {
  const IdiomEditPage(this._idiomKey, {Key? key}) : super(key: key);

  final int? _idiomKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(idiomEditControllerProvider(_idiomKey));
    final formKey = ref.watch(_formKeyProvider);

    return Material(
      color: Colors.black,
      child: Form(
        key: formKey,
        child: SafeArea(
          top: false,
          child: state.when(
            data: (idiom) => HookBuilder(
              builder: (context) {
                final textController =
                    useTextEditingController(text: idiom?.text ?? '');
                final kanaController =
                    useTextEditingController(text: idiom?.kana ?? '');
                final noteController =
                    useTextEditingController(text: idiom?.note ?? '');

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
                          middle: Text(_idiomKey == null ? '追加' : '編集'),
                          automaticallyImplyLeading: false,
                          leading: _idiomKey != null
                              ? CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  child: Text('削除',
                                      style: TextStyle(
                                          color: Theme.of(context).errorColor)),
                                  onPressed: () {
                                    if (idiom != null) {
                                      ref
                                          .read(idiomEditControllerProvider(
                                                  _idiomKey)
                                              .notifier)
                                          .deleteIdiom(idiom);
                                    }
                                    Navigator.pop(context);
                                  },
                                )
                              : null,
                          trailing: CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: const Text('保存'),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                ref
                                    .read(idiomEditControllerProvider(_idiomKey)
                                        .notifier)
                                    .saveIdiom(idiom,
                                        text: textController.text,
                                        kana: kanaController.text,
                                        note: noteController.text);
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ),
                        TextFormField(
                          controller: textController,
                          autofocus: true,
                          decoration: _inputDecoration('漢字四字'),
                          style:
                              const TextStyle(fontSize: 24, letterSpacing: 4.0),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (final String? value) =>
                              _validateIdiom(value),
                        ),
                        TextFormField(
                          controller: kanaController,
                          decoration: _inputDecoration('ふりがな'),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (final String? value) =>
                              _validateKana(value),
                        ),
                        TextFormField(
                          controller: noteController,
                          minLines: 3,
                          maxLines: 3,
                          decoration: _inputDecoration('備考'),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (final String? value) =>
                              _validateNote(value),
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

  String? _validateIdiom(final String? value) {
    if (value != null &&
        RegExp(r"^\p{Script=Hani}{4}$", unicode: true).hasMatch(value)) {
      return null;
    }
    return '漢字四字で入力ください';
  }

  String? _validateKana(final String? value) {
    if (value != null &&
        RegExp(r"^\p{Script=Hira}{0,40}$", unicode: true).hasMatch(value)) {
      return null;
    }
    return 'ひらがな四十字以内で入力ください';
  }

  String? _validateNote(final String? value) {
    if (value != null && value.length <= 200) return null;
    return '二百字以内で入力ください';
  }
}

final _formKeyProvider = Provider.autoDispose((ref) => GlobalKey<FormState>());
