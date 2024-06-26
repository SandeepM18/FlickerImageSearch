//
//  ContentView.swift
//  FlickrImageSearch
//
//  Created by Sandeep Mekala on 6/26/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = FlickrViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                SearchBar(text: $viewModel.searchText, onSearchButtonClicked: viewModel.fetchImages)
                    .padding(.horizontal)
                    .padding(.top, 10)
                    .accessibility(label: Text(Constants.Accessibility.searchBar)) // Accessibility label for the Search Bar
                
                // Loading State
                if viewModel.isLoading {
                    ProgressView(Constants.Strings.loading)
                        .padding()
                        .progressViewStyle(CircularProgressViewStyle())
                        .accessibility(label: Text(Constants.Accessibility.loadingImages)) // Accessibility label for the ProgressView
                }
                // No Images Found State
                else if viewModel.images.isEmpty {
                    Text(Constants.Strings.noImagesFound)
                        .padding()
                        .accessibility(label: Text(Constants.Accessibility.noImagesFound)) // Accessibility label for the Text
                }
                // Images Found State
                else {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 10) {
                            ForEach(viewModel.images) { image in
                                NavigationLink(destination: ImageDetailView(image: image)) {
                                    AsyncImage(url: URL(string: image.media.m)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 100, height: 100)
                                            .clipped()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .accessibility(label: Text(image.title)) // Accessibility label for the AsyncImage
                                }
                            }
                        }
                        .padding()
                    }
                }
                Spacer()
            }
            .navigationTitle(Constants.Strings.homeTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            // Fetch images when the view appears
            viewModel.fetchImages()
        }
    }
}

