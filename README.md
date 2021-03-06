# GoSquared iOS

**This is an early beta, please open an issue if you find anything not working, or to leave feedback for improvement. You can also get in touch directly: <ed@gosquared.com>.**

## Installation

### Installing with CocoaPods (Recommended)

1. Install [CocoaPods](https://cocoapods.org) using `gem install cocoapods`.
2. Create a new Podfile using `pod init`.
3. There are two options for adding GoSquared to your Podfile:
 - If you want automatic tracking of your views, add `pod 'GoSquared/Autoload'`
 - If you dont not want this, add `pod 'GoSquared'` to your Podfile.
4. Run `pod install` to install. This will generate a new Xcode workspace for you to open and use.

## Configuration

Make sure you initialise the library with your site token before calling any tracking / people methods otherwise the library will throw an exception. It is recommended to add the below line to your UIApplication's `didFinishLaunchingWithOptions` method.

**Objective-C:**

```objc
#import <GoSquared/GoSquared.h>

// ...

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[GoSquared sharedTracker] setSiteToken:@"your-site-token"];
    [[GoSquared sharedTracker] setApiKey:@"your-api-key"];
    
    // optionally set logging level: Debug, Quiet (Default), Silent
    [[GoSquared sharedTracker] setLogLevel:GSRequestLogLevelDebug];

    return YES;
}
```

**Swift:**

```swift
import GoSquared

// ...

func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

    GoSquared.sharedTracker().siteToken = "your-site-token"
    GoSquared.sharedTracker().apiKey    = "your-api-key"

    // optionally set logging level: Debug, Quiet (Default), Silent
    GoSquared.sharedTracker().logLevel = .Debug

    return true
}
```

## Page View Tracking

### Automatic Page View Tracking (Recommended)

> **Note**: This is only available if you installed with CocoaPods.

Make sure you're using the `GoSquared/Autoload` subspec in your Podfile. Configure your Site Token and API Key as described above, and you're good to go!

If needed, you can disable tracking on indiviual ViewControllers, or set a custom title:

**Objective-C:**

```objc
#import <GoSquared/GoSquared.h>

// ...

- (void)viewDidLoad {
    [super viewDidLoad];

    // use this to override the title property on a ViewController class
    self.trackingTitle = @"My Custom Title";
    // set this to YES to disable tracking for a particular ViewController
    self.doNotTrack = YES;
}

```

**Swift:**

```swift
import GoSquared

// ...

override func viewDidLoad() {
    super.viewDidLoad()

    // use this to override the title property on a ViewController class
    self.trackingTitle = "My Custom Title";
    // set this to true to disable tracking for a particular ViewController
    self.doNotTrack = true;
}
```

### Manual Page View Tracking

You can use one of the below methods to manually track a UIViewController:

**Objective-C:**

```objc
#import <GoSquared/GoSquared.h>

// ...

- (void)viewDidAppear
{
    [[GoSquared sharedTracker] trackScreen:self.title];
    [[GoSquared sharedTracker] trackScreen:self.title url:@"/custom-url-path"];
}
```

**Swift:**

```swift
import GoSquared

// ...

override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)

    GoSquared.sharedTracker().trackScreen(self.title)
    GoSquared.sharedTracker().trackScreen(self.title, url:"/custom-url-path")
}

```

## Event Tracking

### Track an event

**Objective-C:**

```objc
[[GoSquared sharedTracker] trackEvent:"event name"];
```

**Swift:**

```swift
GoSquared.sharedTracker().trackEvent("event name")
```

### Track an event with properties

**Objective-C:**

```objc
[[GoSquared sharedTracker] trackEvent:@"test-event" properties:@{ @"properties": @"are cool" }];
```

**Swift:**

```swift
GoSquared.sharedTracker().trackEvent("test-event", properties: ["properties": "are cool"])
```

## People

### Identify your user
*Note the library caches your identified user ID and uses it again on the next launch. If you do not want this behavior, call unidentify after `setSiteToken` on each launch.*

**Objective-C:**

```objc
[[GoSquared sharedTracker] identify:@"test-user-id" properties:@{ @"name": @"Test User" }];
```

**Swift:**

```swift
GoSquared.sharedTracker().identify("test-user-id", properties: ["name" : "Test User"])
```

### Unidentify (e.g. on logout)

**Objective-C:**

```objc
[[GoSquared sharedTracker] unidentify];
```

**Swift:**

```swift
GoSquared.sharedTracker().unidentify();
```

## Ecommerce

### Track a transaction

**Objective-C:**

```objc
GSTransactionItem *coke = [GSTransactionItem transactionItemWithName:@"Coca Cola"
                                                               price:@0.99
                                                            quantity:@6];

[[GoSquared sharedTracker] trackTransaction:@"unique-id" items: @[ coke ]];
```

**Swift:**

```swift
let coke = GSTransactionItem(name: "Coca Cola", price: 0.99, quantity: 6)

GoSquared.sharedTracker().trackTransaction("unique-id", items: [coke])
```

## Code of Conduct

Please note that this project is released with a Contributor Code of Conduct. By participating in this project you agree to abide by its terms.

Please see [CODE\_OF\_CONDUCT.md](https://github.com/gosquared/gosquared-ios/blob/master/CODE_OF_CONDUCT.md) for full terms.

## License

The MIT License (MIT)

## Credits

Thanks to Giles Williams of [Urban Massage](http://urbanmassage.com) for building the initial version of this library and allowing us to take it over.
