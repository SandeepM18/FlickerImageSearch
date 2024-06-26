//
//  Constants.swift
//  FlickrImageSearch
//
//  Created by Sandeep Mekala on 6/26/24.
//
import Foundation

struct Constants {
    struct Strings {
        /// Text displayed while loading data.
        static let loading = NSLocalizedString("Loading...", comment: "Text displayed while loading data")
        
        /// Text displayed when no images are found.
        static let noImagesFound = NSLocalizedString("No images found", comment: "Text displayed when no images are found")
        
        /// Title for the home screen.
        static let homeTitle = NSLocalizedString("Flickr Image Search", comment: "Title for the home screen")
        
        /// Placeholder text for the search bar.
        static let searchBarPlaceholder = NSLocalizedString("Search images", comment: "Placeholder text for the search bar")
        
        /// Format string for displaying the author of an image.
        static let author = NSLocalizedString("Author: %@", comment: "Format string for displaying the author of an image")
        
        /// Format string for displaying the published date of an image.
        static let published = NSLocalizedString("Published: %@", comment: "Format string for displaying the published date of an image")
        
        /// Title for the image detail page.
        static let imageDetailPageTitle = NSLocalizedString("Image Details", comment: "Title for the image detail page")
    }
    
    struct Accessibility {
        /// Accessibility label for the search bar.
        static let searchBar = NSLocalizedString("Search Bar", comment: "Accessibility label for the search bar")
        
        /// Accessibility label for the loading images progress view.
        static let loadingImages = NSLocalizedString("Loading images", comment: "Accessibility label for the loading images progress view")
        
        /// Accessibility label for when no images are found.
        static let noImagesFound = NSLocalizedString("No images found", comment: "Accessibility label for when no images are found")
        
        /// Format string for the accessibility label of an image title.
        static let imageTitle = NSLocalizedString("Image titled %@", comment: "Format string for the accessibility label of an image title")
        
        /// Format string for the accessibility label of an image description.
        static let description = NSLocalizedString("Description: %@", comment: "Format string for the accessibility label of an image description")
        
        /// Format string for the accessibility label of an image author.
        static let author = NSLocalizedString("Author: %@", comment: "Format string for the accessibility label of an image author")
        
        /// Format string for the accessibility label of an image published date.
        static let publishedDate = NSLocalizedString("Published Date: %@", comment: "Format string for the accessibility label of an image published date")
    }
}
