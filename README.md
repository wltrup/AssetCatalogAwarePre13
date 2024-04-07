# AssetCatalogAwarePre13
![](https://img.shields.io/badge/platforms-iOS%2011%20%7C%20tvOS%2011%20%7C%20watchOS%204-red)
[![Xcode](https://img.shields.io/badge/Xcode-11-blueviolet.svg)](https://developer.apple.com/xcode)
[![Swift](https://img.shields.io/badge/Swift-5.1-orange.svg)](https://swift.org)
![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/wltrup/AssetCatalogAwarePre13)
![GitHub](https://img.shields.io/github/license/wltrup/AssetCatalogAwarePre13)

## What

**AssetCatalogAwarePre13** is a Swift Package Manager package for iOS/tvOS ( from 11.0 up to but not including 13.0) and watchOS (from 4.0 up to but not including 6.0), defining protocols and functions to access Strings, Images, and Colors, all in a type-safe manner. If you need to support iOS/tvOS (13.0 and above) or watchOS (6.0 and above), you might want to look at [AssetCatalogAware](https://github.com/wltrup/AssetCatalogAware), instead.

An actual practical use of **AssetCatalogAwarePre13** is my [**AssetsPre13**](https://github.com/wltrup/AssetsPre13) framework, which also provides an example project for UIKit.

To get a sense of how **AssetCatalogAwarePre13** works, here are the protocols and some of the functions it defines for accessing Colors. The other assets are accessed in a completely similar fashion:

- Protocols:

```swift
public protocol ColorIdentifier {
    var colorName: String { get }
}

public protocol ColorCatalogAware {
    associatedtype ColorId: ColorIdentifier
}
```

- Functions:

```swift
public extension ColorCatalogAware {

    func color(
        _ id: ColorId,
        in bundle: Bundle,
        compatibleWith traitCollection: UITraitCollection? = nil
    ) -> UIColor

}
```

Thus, any type that conforms to `ColorCatalogAware` is able to access a color simply by referring to its color identifier, an instance of a concrete type that implements the `ColorIdentifier` protocol. Typically, concrete types conforming to `ColorIdentifier` are enumerations and concrete types conforming to `ColorCatalogAware` are UIKit views and/or view controllers.

You may have noticed that these functions take a `Bundle` argument. This is useful when you want to have assets in test targets, for example, but it is a bit of a nuisance to have to keep passing that argument. Sure, you could create your own versions of these functions that take a pre-defined bundle as a default but, fret not, you're covered there too. If you have a type that conforms to

```swift
public protocol AssetCatalogProvider {
    var catalogBundleClass: AnyClass { get }
}
```
then a protocol extension defined in **AssetCatalogAwarePre13** will automatically pass the correct bundle to any function that requires one. Take a look at the [**AssetsPre13**](https://github.com/wltrup/AssetsPre13) framework to see this in action.

## Installation

**AssetCatalogAwarePre13** is provided only as a Swift Package Manager package, because I'm moving away from CocoaPods and Carthage, and can be easily installed directly from Xcode.

## License

**AssetCatalogAwarePre13** is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.
