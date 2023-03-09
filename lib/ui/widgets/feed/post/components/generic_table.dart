import 'package:flutter/material.dart';
import '../../../global/list_view_underline_widget.dart';
import '../../../global/poppins_text_widget.dart';
import '../../../login/big_textbox_head_widget.dart';

class GenericTable extends StatelessWidget {
  final String? title;
  final List<GenericTableItem> tableItems;
  final int? backgroundColor;

  GenericTable({
   this.title,
    this.backgroundColor,
    required this.tableItems,
});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              child: BigTextboxHeadWidget(
                  bigButtonTextHead: title),
            ),
          ),
        ),

          Container(
            child: Column(
              children: [
                ...tableItems.asMap().entries.map((entry) {
                  final int index = entry.key;
                  final e = entry.value;
                  final isLastItem = index == tableItems.length - 1 ? true : false;
                  return Column(
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            Container(
                              child: BigTextboxHeadWidget(
                                  bigButtonTextHead: e.key),
                              width: 100,
                            ),
                            Container(
                              child: PoppinsTextWidget(
                                  text: e.value.toString()),
                            ),
                          ],
                        ),
                        height: 40,
                      ),
                      Offstage(
                        offstage: isLastItem,
                          child: ListViewUnderlineWidget(),
                      ),
                    ],
                  );
                }).toList(),
              ],
            ),
            decoration: BoxDecoration(
              color: backgroundColor != null ? Color(backgroundColor!) : Color(0xfff2f1f6),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(10.0),
                bottom: Radius.circular(10.0),
              ),
            ),
          ),

      ],
    );
  }
}

class GenericTableItem {
  final String key;
  final dynamic value;

  GenericTableItem({
    required this.key,
    required this.value,

});
}