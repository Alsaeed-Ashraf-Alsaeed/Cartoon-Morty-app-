import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';

bool testMode =true ;

class AdManager {
  static String get bannerId {
    if (testMode) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else {
      return 'ca-app-pub-6182481653921585/4894564378';
    }
  }

  static String get interstitialId {
    if (testMode) {
      return 'ca-app-pub-3940256099942544/1033173712';
    } else {
      return 'ca-app-pub-6182481653921585/2483738041';
    }
  }
}

class MyInterstitialAd {
  static InterstitialAd? interAd;
  static bool wasLoaded = false;

  static Future<void> loadInterstitialAd() async {
    await InterstitialAd.load(
      adUnitId: AdManager.interstitialId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (interstitialAd) {
          print('========>loaded');
          interAd = interstitialAd;
          wasLoaded = true;
        },
        onAdFailedToLoad: (err) {
          print('===========================errrror=${err.message}');
        },
      ),
    );
  }

  static showAdd() async {
    await loadInterstitialAd();
    if (wasLoaded == true) {
      interAd!.show();
    }
  }
}

class MyBanner extends StatefulWidget {
  MyBanner({Key? key}) : super(key: key);

  @override
  State<MyBanner> createState() => _MyBannerState();
}

class _MyBannerState extends State<MyBanner> {
  BannerAd? bannerAd;

  bool wasAdready = false;
  AdSize adSize = AdSize.banner;

  Future<void> createMyBanner() async {
    bannerAd = BannerAd(
      size: adSize,
      adUnitId: AdManager.bannerId,
      listener: BannerAdListener(onAdLoaded: (adId) {
        setState(() {
          wasAdready = true;
        });
      }, onAdFailedToLoad: (adId, err) {
        print('=========================${err.message}');
      }),
      request: const AdRequest(),
    );
    await bannerAd!.load();
  }

  @override
  void initState() {
    createMyBanner();
    super.initState();
  }

  @override
  void dispose() {
    bannerAd!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (bannerAd == null) {
      return Container();
    } else {
      return Container(
        width: adSize.width.toDouble(),
        height: adSize.height.toDouble(),
        child: AdWidget(
          ad: bannerAd!,
        ),
      );
    }
  }
}
