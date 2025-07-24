# FlickrFeed

[![CI](https://github.com/gfdias/FlickrFeed/workflows/CI/badge.svg)](https://github.com/gfdias/FlickrFeed/actions/workflows/ci.yml)
[![Security & Dependencies](https://github.com/gfdias/FlickrFeed/workflows/Security%20&%20Dependencies/badge.svg)](https://github.com/gfdias/FlickrFeed/actions/workflows/security.yml)
[![Code Quality](https://github.com/gfdias/FlickrFeed/workflows/Code%20Quality/badge.svg)](https://github.com/gfdias/FlickrFeed/actions/workflows/quality.yml)

This demo app shows an image feed from Flickr based on tags.
You can also check the detail for each photo and share, save to your library and check other photos with the same tags.

## Feed
* The feed was built using a simple `TableView`, in which each row is in fact a horizontal `CollectionView` that displays the table view's category photos within each section.
* Although `UICollectionView` supports both horizontal and vertical scrolling, a single flow layout does not support both at the same time, so there were two options here: to place the collection view inside a scroll view, or inside a table view cell. I've opted for the second option since all the sections would look the same apart from their photo content, and it would be easier to add new rows/categories without changing any UI code.

## FlickrPhoto
The [`FlickrPhoto`](FlickrFeed/Models/Photo/Flickr/FlickrPhoto.swift) model is built in compliance with the base [`Photo`](FlickrFeed/Models/Photo/Base/Photo.swift) protocol. This allows two things:
 
* To make sure that every `Photo` object will provide the basic necessary info to display to the user
* To allow for some customization on provider-specific properties, like how the photo URL is built

## FlickrAPIProvider
The [`FlickrFeedAPIProvider`](FlickrFeed/Components/APIProviders/Feed/FlickrFeedAPIProvider.swift) is responsible for getting the feed data from Flickr API. It conforms to the [`FeedProviderProtocol`](FlickrFeed/Components/APIProviders/Feed/FeedProviderProtocol.swift) to make sure it has the necessary methods for the feed repository to use.

## FeedRepository
The [`FeedRepository`](FlickrFeed/Components/Repositories/FeedRepository.swift) works as a state container for the app's feed. It is responsible for fetching, storing (not implemented in this case) and providing all the feed data. It does this by notifying any of the delegates that subscribe to it. In our case, this allows us to notify the `FeedViewModel` that the repository is busy fetching data, or that there was an error fetching that data. By doing this, we delegate all the network and local data management to a single entity, allowing us to make use of the feed data from other places in our app, and to decouple and declutter view models from those dependencies.

## Navigation Coordinator and Dependency Coordinator
When a view controller needs to present another one, it shouldn't be responsible for knowing and initiating all the dependencies required to present the new screen. So the coordinator approach allows us to have one place that's responsible for managing our app routing state ([`NavigationCoordinator`](FlickrFeed/Components/Coordinator/Navigation/NavigationCoordinator.swift)) and another place responsible for injecting all the necessary dependencies to present or push the new view controller ([`FlickrDependencyCoordinator`](FlickrFeed/Components/Coordinator/FlickrDependencyCoordinator.swift)).

## MVVM
The demo app was built with the MVVM pattern in mind, with the purpose of achieving a complete separation of concerns between our views and the data that they need to show the user. By adding the view model layer, we can provide the views with only the simple data properties that they need, formatted with the type they need. By doing this, the view controller is oblivious about the models that are being used to provide the data, and it's only responsible for setting up and responding to layout changes. These changes are broadcasted by the view model, which provides closures for success, error, and loading states to which the view controller subscribes by the time the view is loaded.

## Continuous Integration

This project uses GitHub Actions for continuous integration and code quality assurance:

### 🔄 **CI Workflow** ([`.github/workflows/ci.yml`](.github/workflows/ci.yml))
- **Build & Test**: Runs on multiple iOS simulators (iPhone 14, iPhone 15)
- **Code Coverage**: Generates test coverage reports
- **SwiftLint**: Enforces code style and best practices
- **Artifact Upload**: Saves test results and build logs for debugging

### 🔒 **Security & Dependencies** ([`.github/workflows/security.yml`](.github/workflows/security.yml))
- **Dependency Check**: Monitors CocoaPods dependencies for updates
- **Security Scan**: Checks for hardcoded secrets and insecure HTTP URLs
- **License Check**: Validates project and dependency licenses
- **Scheduled Runs**: Weekly security scans

### 📊 **Code Quality** ([`.github/workflows/quality.yml`](.github/workflows/quality.yml))
- **Code Metrics**: Analyzes lines of code, complexity, and documentation coverage
- **Architecture Check**: Validates MVVM pattern compliance
- **Performance Analysis**: Identifies potential performance issues and retain cycles
- **Technical Debt**: Tracks TODO/FIXME comments

### 🛠 **Development Setup**
To run the project locally:
```bash
# Install dependencies
pod install

# Open workspace (not project)
open FlickrFeed.xcworkspace

# Run tests
xcodebuild -workspace FlickrFeed.xcworkspace -scheme FlickrFeed -destination 'platform=iOS Simulator,name=iPhone 14' test
```

## Requirements
- Xcode 15.0+
- iOS 10.0+
- CocoaPods

## Contributing
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Run tests locally to ensure everything works
5. Commit your changes (`git commit -m 'Add amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

The CI system will automatically run all tests, security scans, and code quality checks on your PR.

