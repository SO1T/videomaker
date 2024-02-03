import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdManager {
  InterstitialAd? interstitialAd;
  bool isLoaded = false;

  final String _adUnitId = 'ca-app-pub-7064550085295343/1466706864';

  void loadAd() {
    InterstitialAd.load(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          isLoaded = true;
          ad.fullScreenContentCallback = FullScreenContentCallback(
              // Called when the ad showed the full screen content.
              onAdShowedFullScreenContent: (ad) {},
              // Called when an impression occurs on the ad.
              onAdImpression: (ad) {},
              // Called when the ad failed to show full screen content.
              onAdFailedToShowFullScreenContent: (ad, err) {
                ad.dispose();
              },
              // Called when the ad dismissed full screen content.
              onAdDismissedFullScreenContent: (ad) {
                loadAd();
                ad.dispose();
              },
              // Called when a click is recorded for an ad.
              onAdClicked: (ad) {
                loadAd();
              });

          // Keep a reference to the ad so you can show it later.
          interstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          // ignore: avoid_print
        },
      ),
    );
  }

  void showAdCallback() {
    interstitialAd?.show();
  }

  static final AdManager _shared = AdManager._sharedInstance();
  AdManager._sharedInstance();

  factory AdManager() => _shared;
}
