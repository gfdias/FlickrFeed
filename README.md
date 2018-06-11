# FlickrFeed

This demo app shows an image feed from Flickr based on tags.
You can also check the detail for each photo and share, save to your library and check other photos with the same tags.

## Feed
* The feed was built using a simple `TableView`, in which each row is in fact a horizontal `CollectionView` that displays the tableview's category photos within each section.
* Although `UICollectionView` supports both horizontal and vertical scrolling, a single flow layout does not support both at the same time, so there were two option here: to place the collection view inside a scroll view, or inside a table view cell. I've opted for the second option since all the sections would look the same apart from their photo content, and it would be easier to add new rows/categories without changing any UI code.

## FlickrPhoto
The `FlickrPhoto` model is built in compliance with the base `Photo` protocol. This allows two things:
 
* To make sure that every `Photo` object will provide the basic necessary info to display to the user
* To allow for some customisation on provider-specific properties, like how the photo URL is built

## FlickrAPIProvider
The `FlickrAPIProvider` is responsible for getting the feed data from Flickr API. It conforms to the APIProvider protocol to make sure it has the necessary methods for the feed repository to use.

## FeedRepository
The feed repository works as state container for the app's feed. It is responsible for fetching, storing (not implemented in this case) and providing all the feed data. It does this by notifying any of the delegates that subscribe to it. In our case this allows to notify the `FeedViewModel` that the repository is busy fetching data, or that there was an error fetching that data. By doing this, we delegate all the network and local data management to a single entity, allowing us to make use of the feed data from other places in our app, and to decouple and declutter view models from those dependencies.

## Navigation coordinator and dependency coordinator
When a view controller needs to present another one, it should't be responsible for knowing and initiating all the dependencies required to present the new screen. So the coordinator approach allows us to have on place that it's responsible to manage our app routing state (`Navigation Coordinator`) and another place responsible for injecting all the necessary dependencies to present or push the new view controller.

## MVVM
The demo app was built with the `mvvm` pattern in mind, with the purpose of achieving a complete separation of concerns between our views and the data that they need to show the user. By adding the view model layer, we can provide the views with only the simple data properties that they need, formatted with the type they need. By doing this, the view controller is oblivious about the models that are being used to provide the data, and it's only responsible to setup and respond to layout changes. This changes are broadcasted by the view model, that provides closures for success, error, and loading states to which the view controller subscribes by the time the view is loaded.

