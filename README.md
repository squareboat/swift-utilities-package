
# Utilities

Utilities is a Swift package of almost all the utility functions needed to build an amazing iOS Application

## Installation

### Swift Package Manager

The Swift Package Manager is a tool for automating the distribution of Swift code and is integrated into the swift compiler.

Once you have your Swift package set up, adding Utilities as a dependency is as easy as adding it to the ``dependencies`` value of your ``Package.swift``.

```swift

dependencies: [
    .package(url: "https://github.com/Squareboat/Utilities.git", .branch("master")
]

```

## Usage

```swift
import Utilities

/* Networking */
NetworkUtils.isInternetAvailable() // return true or false depending upon the device internet connection status

/* Validators Exaple */
Validators.isValidEmailAddress(emailId: "example@squareboat.com") // returns true

/* Calendar Exaple */
CalendarUtils.getTimeDifferenceString(timestampString: "1598255182") // return something like 3 weeks ago

/* Network Image with caching */
imageView.setImage(withUrl: url, placeholderImage: UIImage(named: "placeholder"), showIndicator: true)
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

Utilities is released under the MIT license. [See LICENSE](https://choosealicense.com/licenses/mit/) for details.
