Project Overview: Flickr Image Search App 

Purpose:
The Flickr Image Search app enables users to search for images hosted on Flickr using keywords. It retrieves images from the Flickr public feed API and presents them in a grid layout. Users can view detailed information about each image by clicking on it, including the title, author, and publication date.

Technologies Used:
- SwiftUI: Used for building the app's user interface and managing navigation.
- Combine: Employed for handling asynchronous data fetching and state management.
- UIKit Integration: Utilized for integrating a custom search bar using `UIViewRepresentable`.


Implementation Details:

1. App Entry Point
   - Defined using the `@main` attribute on the `FlickrImageSearchApp` struct.
   - Contains a `WindowGroup` scene that sets `ContentView` as the app's main view.

2. ContentView
   - Primary view displaying:
     - Custom search bar for user input, implemented with `UIViewRepresentable`.
     - Loading indicator during image fetching.
     - Grid layout (`LazyVGrid`) to display fetched images.
     - Navigation links for viewing detailed image information.

3. FlickrViewModel
   - Manages:
     - Search text input and fetched image state.
     - Network requests to the Flickr API using `URLSession` and Combine's `dataTaskPublisher`.
     - JSON decoding into `FlickrImage` objects.
     - Loading states and error handling during data fetching.

4. ImageDetailView
   - Displays detailed information for selected images:
     - Asynchronous image loading (`AsyncImage`).
     - Text views for title, description, author, and publication date.
     - Accessibility features ensuring content is accessible to all users.

5. Custom Search Bar
   - Integrates a `UISearchBar` from UIKit into SwiftUI using `UIViewRepresentable`.
   - Facilitates user input for initiating image searches.

6. Constants Management
   - Centralizes user-facing strings and accessibility labels in a `Constants` struct for easier maintenance and localization.

Accessibility
- Implements VoiceOver support with accessibility labels and traits on UI elements.
- Supports dynamic text to accommodate user preferences for text size.

Error Handling
- Manages network request errors and unexpected data scenarios.
- Logs errors and uses fallback states (e.g., empty image lists) to maintain app stability and usability.

Description Issue:
In the Flickr Image Search app, displaying image descriptions fetched from Flickr's API posed challenges due to HTML content embedded within the descriptions. SwiftUI's Text view doesn't support HTML rendering, leading to HTML tags being displayed as plain text. To ensure consistent user experience and simplicity, descriptions were presented as plain text instead of attempting complex HTML parsing or rendering, prioritizing readability and usability in the app's interface.


By 
Sandeep Mekala
