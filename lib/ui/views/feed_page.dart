import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/feed/detailed_post/panel_widget.dart';
import '../widgets/feed/navbar/navbar_top_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../widgets/feed/post/timeline_builder.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  final panelController = PanelController();
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.95;



    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () => Future.value(false),
        child: new Scaffold(

          backgroundColor: Color(0xfff2f1f6),


          body: SlidingUpPanel(
            body: Container(
              alignment: FractionalOffset.topCenter,
              child: Stack(
                children: <Widget>[



                  NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (OverscrollIndicatorNotification overscroll) {
                      overscroll.disallowGlow();
                      return true;
                    },


                    child: TimelineBuilder(),


                  ),
                  NavbarTopWidget(),
                ],
              ),
            ),
            controller: panelController,
            maxHeight: panelHeightOpen,
            //minHeight: 100,
            parallaxEnabled: true,
            parallaxOffset: 0.05,
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),

            panelBuilder: (controller) => PanelWidget(
              controller: controller, panelController: panelController,
            ),


            collapsed: Container(
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
              ),

                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10,top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5, right: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),

                            child: Image.network(
                              'https://www.tagesschau.de/multimedia/bilder/meta-119~_v-original.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 150,
                        child: AutoSizeText(
                          'Facebook’s Mark Zuckerberg announces the Metaverse.',
                          style: TextStyle(
                              fontSize: 17,
                              color: Color(0xff4e5155),
                              fontFamily: 'Lora',
                              fontWeight: FontWeight.w700
                          ),
                          minFontSize: 10,
                          stepGranularity: 10,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                )
            ),


          ),
        ),
      ),
    );
  }
}

