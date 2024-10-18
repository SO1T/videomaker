import 'package:videomaker/ad_helper.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final AdManager _adManager;

  @override
  void initState() {
    _adManager = AdManager();
    _adManager.loadAd();
    super.initState();
  }

  @override
  void dispose() {
    _adManager.interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'Videomaker App',
                style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFFffffff),
                    fontWeight: FontWeight.w900),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'обери дію яку хочеш зробіти',
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFFffffff),
                    fontWeight: FontWeight.w700),
              ),
            ),
            Expanded(
              child: CustomScrollView(
                primary: false,
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.all(20),
                    sliver: SliverGrid.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: <Widget>[
                        InkWell(
                          onTap: () async {
                            final result = await Navigator.pushNamed(
                                context, '/focus-factor');
                            if (result == null) {
                              _adManager.showAdCallback();
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: const Image(
                              image: AssetImage('lib/assets/icon1.png'),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            final result =
                                await Navigator.pushNamed(context, '/memory');
                            if (result == null) {
                              _adManager.showAdCallback();
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: const Image(
                              image: AssetImage('lib/assets/icon2.png'),
                            ),
                          ),
                        ),

                        // InkWell(
                        //   onTap: () async {
                        //     final result =
                        //         await Navigator.pushNamed(context, '/apps');
                        //     if (result == null) {
                        //       _adManager.showAdCallback();
                        //     }
                        //   },
                        //   child: Container(
                        //     padding: const EdgeInsets.all(4),
                        //     color: Colors.white,
                        //     child: const Image(
                        //       image: AssetImage('lib/assets/icon3.png'),
                        //     ),
                        //   ),
                        // ),
                        InkWell(
                          onTap: () async {
                            final result =
                                await Navigator.pushNamed(context, '/rentals');
                            if (result == null) {
                              _adManager.showAdCallback();
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: const Image(
                              image: AssetImage('lib/assets/icon4.png'),
                            ),
                          ),
                        ),
                        // Container(
                        //   padding: const EdgeInsets.all(4),
                        //   color: Colors.white,
                        //   child: const Image(
                        //     image: AssetImage('lib/assets/icon5.png'),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
