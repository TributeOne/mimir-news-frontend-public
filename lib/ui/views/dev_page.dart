import 'package:flutter/material.dart';

class DevPage extends StatefulWidget {
  const DevPage({Key? key}) : super(key: key);

  @override
  State<DevPage> createState() => _DevPageState();
}

class _DevPageState extends State<DevPage> {
  List<String> items = List.generate(
    15,
    (index) => 'ITEM ${index + 1}',
  );
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetch();
      }
    });
  }

  Future fetch() async {
    setState(() {
      items.addAll(['Item A', 'Item B', 'Item C', 'Item D']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          backgroundColor: Color(0xfff2f1f6),
          body: SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                SizedBox(
                  height: 85,
                ),
                Container(
                  child: ListView.builder(

                    //padding: const EdgeInsets.all(0),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: items.length + 1,
                    itemBuilder: (context, index) {
                      if (index < items.length) {
                        return ListTile(
                          title: Text(items[index]),
                        );
                      } else {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 32),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
