import 'package:empat_app/models/playlist.dart';
import 'package:empat_app/widgets/playlist/tab_indicators.dart';
import 'package:empat_app/widgets/square_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class InfoTabs extends HookWidget {
  final Playlist playlist;
  const InfoTabs(this.playlist, {super.key});

  @override
  Widget build(BuildContext context) {
    final currentTab = useState(0);
    final tabController = useTabController(initialLength: 2);
    useEffect(
      () {
        tabController.addListener(() {
          currentTab.value = tabController.index;
        });
      },
      [tabController],
    );
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: TabBarView(
            controller: tabController,
            children: [
              Center(
                child: SquareImage(
                  playlist.imageUrl,
                  150,
                  margin: const EdgeInsets.only(bottom: 10),
                ),
              ),
              Center(child: Text(playlist.description)),
            ],
          ),
        ),
        TabsIndicators(
          length: 2,
          activeIndex: currentTab.value,
        ),
      ],
    );
  }
}
