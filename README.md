# FlickrFeed

![CI](https://github.com/gfdias/FlickrFeed/workflows/CI/badge.svg)

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

## Development

### Requirements
- Xcode 15.0+
- iOS 10.0+
- CocoaPods

### Setup
1. Clone the repository
2. Install dependencies:
   ```bash
   pod install
   ```
3. Open `FlickrFeed.xcworkspace` in Xcode
4. Build and run the project

### Testing
Run tests locally using the provided script:
```bash
./scripts/test.sh
```

Or run tests directly with Xcode:
```bash
xcodebuild -workspace FlickrFeed.xcworkspace -scheme FlickrFeed -destination 'platform=iOS Simulator,name=iPhone 14,OS=latest' test
```

### Code Quality
This project uses SwiftLint for code style enforcement. Install it with:
```bash
brew install swiftlint
```

### Continuous Integration
The project uses GitHub Actions for CI/CD, which automatically:
- Builds the project for both Debug and Release configurations
- Runs all unit tests
- Performs code linting with SwiftLint
- Caches CocoaPods dependencies for faster builds

## Contributing
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Run tests locally (`./scripts/test.sh`)
5. Commit your changes (`git commit -m 'Add amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

