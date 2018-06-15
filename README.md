#LottieBox

An experimental mashup illustrating how to use use [Lottie](https://github.com/airbnb/lottie-ios)-based views with Mapbox's [`MGLAnnotationView`](https://www.mapbox.com/ios-sdk/api/4.0.2/Classes/MGLAnnotationView.html#/MGLAnnotationView) class to provide custom animated markers on a map.

This is experimental and likely won't be maintained, but feel free to check out the example in ViewController.swift and try out your own animations by including the Lottie JSON file within the target of this project.

To run this project, run `carthage update` and follow the framework installation instructions provided by [Carthage here](https://github.com/Carthage/Carthage). You will need to supply your own access token for the `MGLMapboxAccessToken` key in the info.plist file.
