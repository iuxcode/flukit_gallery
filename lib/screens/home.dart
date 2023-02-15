import 'package:flukit/flukit.dart';
import 'package:flukit/screens/flu_screens.dart';
import 'package:flukit/widgets/dashed_circle.dart';
import 'package:flukit/widgets/flu_widgets.dart';
import 'package:flukit_icons/flukit_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FluScreen(
      body: SafeArea(
          child: SizedBox.expand(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.symmetric(vertical: 25).copyWith(bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FluButton.icon(
                    FluIcons.add,
                    onPressed: () {},
                    margin: const EdgeInsets.only(right: 10),
                    loading: true,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    iconSize: 22,
                    filled: true,
                  ),
                  ObxValue(
                      (state) => FluButton.icon(
                            FluIcons.arrowLeft,
                            onPressed: () {
                              state.value = !state.value;
                            },
                            margin: const EdgeInsets.only(right: 10),
                            loading: state.value,
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                            iconSize: 22,
                            filled: true,
                            replaceContentOnLoading: false,
                          ),
                      false.obs),
                  ObxValue(
                      (state) => FluButton.text(
                            'Hello world',
                            prefixIcon: FluIcons.add,
                            onPressed: () {
                              state.value = !state.value;
                            },
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            loading: state.value,
                            loadingText: 'loading',
                            replaceContentOnLoading: false,
                          ),
                      false.obs),
                ],
              ),
              FluImage(
                'https://images.unsplash.com/photo-1676007957159-8f84bf868cd2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1331&q=80',
                height: Flu.screenHeight * .35,
                width: double.infinity,
                overlayOpacity: .05,
                // gradientOverlay: true,
                cornerRadius: 50,
                margin:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                clipBehavior: Clip.none,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FluAvatar(
                      defaultAvatarType: FluAvatarTypes.memojis,
                      badge: true,
                      badgeCount: 2,
                      badgeOffset: const Offset(-4, -4),
                      badgeOutlined: true,
                      badgeOutlineThickness: 1,
                      badgeOutlineColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      margin: const EdgeInsets.only(right: 15),
                    ),
                    const FluAvatar(
                      defaultAvatarType: FluAvatarTypes.material3D,
                      badge: true,
                      margin: EdgeInsets.only(right: 15),
                    ),
                    const FluAvatar(
                      defaultAvatarType: FluAvatarTypes.material3D,
                      badge: true,
                      margin: EdgeInsets.only(right: 15),
                    ),
                    const FluAvatar(
                      defaultAvatarType: FluAvatarTypes.material3D,
                      badge: true,
                      margin: EdgeInsets.only(right: 15),
                    ),
                    const FluAvatar(
                      defaultAvatarType: FluAvatarTypes.memojis,
                      outlined: true,
                      circle: true,
                      badge: true,
                      margin: EdgeInsets.only(right: 15),
                    ),
                    const FluAvatar(
                      label: 'john doe',
                      outlined: true,
                      badge: true,
                      badgeColor: Colors.green,
                      margin: EdgeInsets.only(right: 15),
                    ),
                    const FluAvatar(
                      icon: FluIcons.user,
                      outlined: true,
                      badge: true,
                      badgeColor: Colors.red,
                      badgeSize: 12,
                      badgeOffset: Offset(0, 0),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Dark mode'),
                    Switch(
                      value: Get.isDarkMode,
                      onChanged: (darkMode) {
                        Get.changeThemeMode(
                            Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    FluLoader(
                      size: 15,
                      gap: 10,
                      label: 'loading...',
                      strokeWidth: 2,
                      margin: EdgeInsets.only(right: 15),
                    ),
                    FluLoader(
                      size: 45,
                      margin: EdgeInsets.only(right: 15),
                    ),
                    FluLoader(
                      size: 25,
                      strokeWidth: 3,
                      margin: EdgeInsets.only(right: 15),
                    ),
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: FluAvatarGroup(
                  itemCount: 15,
                  visibleItemCount: 6,
                  itemBuilder: (index) => const FluAvatar(
                    size: 45,
                    outlined: true,
                  ),
                ),
              ),
              TabBar(
                  controller: tabController,
                  indicator:
                      DotTabIndicator(color: Flu.colorScheme.primaryContainer),
                  dividerColor: Colors.transparent,
                  tabs: const [
                    Tab(text: 'tab 1'),
                    Tab(text: 'tab 2'),
                    Tab(text: 'tab 3')
                  ])
            ],
          ),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Flu.showFluModalBottomSheet(
              child: const Center(
                  child: Text(
                      """Modi praesentium dolorum ipsum sed ea voluptas. Enim illum quidem autem quisquam aut. Aut minus sunt nostrum. Et fugit suscipit. Aut nihil illo vitae cumque error.
                      Modi praesentium dolorum ipsum sed ea voluptas. Enim illum quidem autem quisquam aut. Aut minus sunt nostrum. Et fugit suscipit. Aut nihil illo vitae cumque error.
                      Modi praesentium dolorum ipsum sed ea voluptas. Enim illum quidem autem quisquam aut. Aut minus sunt nostrum. Et fugit suscipit. Aut nihil illo vitae cumque error.
                      Modi praesentium dolorum ipsum sed ea voluptas. Enim illum quidem autem quisquam aut. Aut minus sunt nostrum. Et fugit suscipit. Aut nihil illo vitae cumque error.
                      Modi praesentium dolorum ipsum sed ea voluptas. Enim illum quidem autem quisquam aut. Aut minus sunt nostrum. Et fugit suscipit. Aut nihil illo vitae cumque error.
                      Modi praesentium dolorum ipsum sed ea voluptas. Enim illum quidem autem quisquam aut. Aut minus sunt nostrum. Et fugit suscipit. Aut nihil illo vitae cumque error.
                      Modi praesentium dolorum ipsum sed ea voluptas. Enim illum quidem autem quisquam aut. Aut minus sunt nostrum. Et fugit suscipit. Aut nihil illo vitae cumque error.
                      Modi praesentium dolorum ipsum sed ea voluptas. Enim illum quidem autem quisquam aut. Aut minus sunt nostrum. Et fugit suscipit. Aut nihil illo vitae cumque error.
                      Modi praesentium dolorum ipsum sed ea voluptas. Enim illum quidem autem quisquam aut. Aut minus sunt nostrum. Et fugit suscipit. Aut nihil illo vitae cumque error.
                      Modi praesentium dolorum ipsum sed ea voluptas. Enim illum quidem autem quisquam aut. Aut minus sunt nostrum. Et fugit suscipit. Aut nihil illo vitae cumque error.
                      Modi praesentium dolorum ipsum sed ea voluptas. Enim illum quidem autem quisquam aut. Aut minus sunt nostrum. Et fugit suscipit. Aut nihil illo vitae cumque error.
                      Modi praesentium dolorum ipsum sed ea voluptas. Enim illum quidem autem quisquam aut. Aut minus sunt nostrum. Et fugit suscipit. Aut nihil illo vitae cumque error.
                      Modi praesentium dolorum ipsum sed ea voluptas. Enim illum quidem autem quisquam aut. Aut minus sunt nostrum. Et fugit suscipit. Aut nihil illo vitae cumque error.
                      Modi praesentium dolorum ipsum sed ea voluptas. Enim illum quidem autem quisquam aut. Aut minus sunt nostrum. Et fugit suscipit. Aut nihil illo vitae cumque error.""")));
        },
        child: FluIcon(FluIcons.plus,
            color: Theme.of(Flu.context).colorScheme.onPrimaryContainer),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ABC'),
          BottomNavigationBarItem(icon: Icon(Icons.car_crash), label: 'ABC'),
        ],
        showSelectedLabels: true,
        showUnselectedLabels: false,
      ),
    );
  }
}
