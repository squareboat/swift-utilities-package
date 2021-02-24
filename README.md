
# Utilities

Utilities is a Swift package of almost all the utility functions needed to build amazing iOS Applications

## Installation

### Swift Package Manager

The Swift Package Manager is a tool for automating the distribution of Swift code and is integrated into the swift compiler.

Once you have your Swift package set up, adding Utilities as a dependency is as easy as adding it to the ``dependencies`` value of your ``Package.swift``.

```swift

dependencies: [
    .package(url: "https://github.com/Root-vb/swift-utilities-package.git", .upToNextMajor(from: "1.0.2"))
]

```

## Usage

```swift
import Utilities

/* Networking */
NetworkUtils.isInternetAvailable() // returns true or false depending upon the device internet connection status

/* Validators Example */
Validators.isValidEmailAddress(emailId: "example@squareboat.com") // returns true

/* Calendar Example */
CalendarUtils.getTimeDifferenceString(timestampString: "1598255182") // returns something like 3 weeks ago

/* Network Image with caching. Extension method on UIImageView */
imageView.setImage(withUrl: url, placeholderImage: UIImage(named: "placeholder"), showIndicator: true)
```

## Extension Methods

### FileManager
```
class func documentsDirectory() -> String

class func cachesDirectory() -> String
```

### String
```
var htmlToAttributedString: NSAttributedString?

var htmlToString: String

var wordCount: Int
```

### UIAlertController
```
@discardableResult
func addAction(title: String, style: UIAlertAction.Style = .default, isEnabled: Bool = true, handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction

func addTextField(text: String? = nil, placeholder: String? = nil, editingChangedTarget: Any?, editingChangedSelector: Selector?)

convenience init(title: String, message: String? = nil, defaultActionButtonTitle: String = "OK", tintColor: UIColor? = nil)
```

### UIApplication
```
var displayName: String?

var buildNumber: String?

var version: String?
```

### UIButton
```
func leftImage(image: UIImage, renderMode: UIImage.RenderingMode = .automatic)

func rightImage(image: UIImage, renderMode: UIImage.RenderingMode)

func setImageForAllStates(_ image: UIImage)

func setTitleColorForAllStates(_ color: UIColor)

func setTitleForAllStates(_ title: String)

func centerTextAndImage(imageAboveText: Bool = false, spacing: CGFloat)
```

### UIColor
```
convenience init?(hex: String)
```

### UIImage
```
func compressed(quality: CGFloat = 0.5) -> UIImage?

func compressedData(quality: CGFloat = 0.5) -> Data?

func cropped(to rect: CGRect) -> UIImage

func pngBase64String() -> String?

func jpegBase64String(compressionQuality: CGFloat) -> String?

convenience init(color: UIColor, size: CGSize)

convenience init?(base64String: String, scale: CGFloat = 1.0)
```

### UIImageView
```
func blur(withStyle style: UIBlurEffect.Style = .light)

func blurred(withStyle style: UIBlurEffect.Style = .light) -> UIImageView

func setImage(withUrl url: URL, placeholderImage placeholder: UIImage?, showIndicator: Bool = false)

func setImage(withUrlString urlString: String, placeholderImage placeholder: UIImage?, showIndicator: Bool = false)
```

### UILabel
```
func getHeight(forWidth width: CGFloat) -> CGFloat
```

### UITextField
```
var isEmpty: Bool

var trimmedText: String?

var hasValidEmail: Bool

var hasValidPhoneNumber: Bool

@IBInspectable var leftViewTintColor: UIColor?

@IBInspectable var rightViewTintColor: UIColor?

func clear()

func setPlaceHolderTextColor(_ color: UIColor)

func addPaddingLeft(_ padding: CGFloat)

func addPaddingRight(_ padding: CGFloat)

func addPaddingLeftIcon(_ image: UIImage, padding: CGFloat)

func addPaddingRightIcon(_ image: UIImage, padding: CGFloat)
```

### UITableViewCell and UICollectionView Cells
```
// Usage
extension MyTableViewCell: ReuseIdentifiable {}

MyTableViewCell().reuseIdentifier // returns "MyTableViewCell" as a String
```

### UIView
```
@IBInspectable var borderColor: UIColor?

@IBInspectable var borderWidth: CGFloat

@IBInspectable var cornerRadius: CGFloat

var screenshot: UIImage? // If applicable

@IBInspectable var shadowColor: UIColor?

@IBInspectable var shadowOffset: CGSize

@IBInspectable var shadowOpacity: Float

@IBInspectable var shadowRadius: CGFloat

@IBInspectable var masksToBounds: Bool

var parentViewController: UIViewController?

func roundCorners(_ corners: UIRectCorner, radius: CGFloat)

func addShadow(ofColor color: UIColor = UIColor(red: 0.07, green: 0.47, blue: 0.57, alpha: 1.0), radius: CGFloat = 3, offset: CGSize = .zero, opacity: Float = 0.5)

func setDashedBoder(color: UIColor = .lightGray)

func addSubviews(_ subviews: [UIView])

func fadeIn(duration: TimeInterval = 1, completion: ((Bool) -> Void)? = nil)

func fadeOut(duration: TimeInterval = 1, completion: ((Bool) -> Void)? = nil)
```

### UIViewController
```
func addNotificationObserver(name: Notification.Name, selector: Selector)

func removeNotificationObserver(name: Notification.Name)

func removeNotificationsObserver()

@discardableResult
func showAlert(title: String?, message: String?, buttonTitles: [String]? = nil, highlightedButtonIndex: Int? = nil, completion: ((Int) -> Void)? = nil) -> UIAlertController

func addChildViewController(_ child: UIViewController, toContainerView containerView: UIView)

func removeViewAndControllerFromParentViewController()

func showLoader(color: UIColor? = nil)

func hideLoader()

func openShareActivity(itemsToShare : [Any])

func openSafariWithUrl(urlString : String)
```

## Utility Methods

### CalendarUtils
```
class func getNumberOfDaysBetweenTwoDates(date1 : Date, date2 : Date) -> DateComponents

public class func getActualDifferenceBetweenTwoDates(date1 : Date, date2 : Date) -> DateComponents

class func getDateAfterSomedays(daysToAdd : Int, dateToAdd : Date!) -> Date!

class func getTimeDifferenceString(timestampString : String) -> String
```

### DictionaryDecoder
```
func decode<T>(_ type: T.Type, from json: [String:Any]) throws -> T where T: Decodable

// Usage Example
struct Example: Decodable {
    // ...
}

let dictionay = [
    ///
]

do {
    let decodedExample = try DictionaryDecoder().decode(Example.self, from: dictionary) /// return an object
} catch (let decodingError) {
    print(decodingError)
}
```

### DictionaryEncoder
```
func encode<T>(_ value: T) throws -> [String:Any] where T: Encodable

// Usage Example
struct Example: Encodable {
    // ...
}

let example = Example() /// Encodable object

do {
    let dictionary = try DictionaryEncoder().encode(example) /// return a dictionary
} catch (let encodingError) {
    print(encodingError)
}
```

### ImageUtils
```
class func getImageHeightUsingAspectRatio (aspectRatio: Double, width: CGFloat)
```

### JSONUtils
```
class func convertToDictionary(text: String) -> [String: Any]?

class func convertToString(dictionary : Any) -> String?

class func getJsonStringFromArrayResponse(response: NSArray) -> Data?

func getJsonStringFromDictResponse(response: NSDictionary) -> Data?
```

### NetworkUtils
```
class func isInternetAvailable() -> Bool
```

### SegmentControlUtils
```
class func getBottomBarForSegmentControl(SCView : UISegmentedControl, color: UIColor) -> UIView
```

### ThreadingUtils
```
class func debounce(interval: Int, queue: DispatchQueue, action: @escaping (() -> Void)) -> () -> Void

class func delay(delay:Double, perform: @escaping () -> Void)
```

### Validators
```
class func isValidEmailAddress(emailId : String) -> Bool

class func isValidPhoneNumber(number : String) -> Bool

class func isValidURL(urlString: String?) -> Bool

class func checkForIntAndFloat(data : Any) -> Any
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
Utilities is released under the MIT license. [See LICENSE](https://github.com/Root-vb/swift-utilities-package/blob/master/LICENSE) for details.
