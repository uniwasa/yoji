import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yoji/ui/home/idiom_edit/idiom_edit_controller.dart';

class IdiomEditPage extends HookConsumerWidget {
  const IdiomEditPage(this._id, {Key? key}) : super(key: key);

  final int? _id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(idiomEditControllerProvider(_id));
    final textController = useTextEditingController(text: '');
    final noteController = useTextEditingController();

    return Scaffold(
      appBar: const CupertinoNavigationBar(
        automaticallyImplyLeading: false,
      ),
      body: state.when(
        data: (idiom) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  style: TextStyle(fontSize: 20, letterSpacing: 4.0),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.brush,
                      color: Colors.white.withOpacity(0.4),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.white.withOpacity(0.1),
                    filled: true,
                    hintText: '全角四字',
                    hintStyle: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: TextField(
                      expands: true,
                      minLines: null,
                      maxLines: null,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.white.withOpacity(0.1),
                        filled: true,
                        hintText: '備考',
                        hintStyle: TextStyle(
                          // fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, _) => Center(
          child: Text(error.toString()),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
