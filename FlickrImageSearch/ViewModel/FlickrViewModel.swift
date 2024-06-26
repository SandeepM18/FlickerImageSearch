//
//  FlickrViewModel.swift
//  FlickrImageSearch
//
//  Created by Sandeep Mekala on 6/26/24.
//

import SwiftUI
import Combine

class FlickrViewModel: ObservableObject {
    @Published var searchText: String = "" {
        didSet {
            fetchImages()
        }
    }
    @Published var images: [FlickrImage] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    private let baseURL = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags="
    
    func fetchImages() {
        guard !searchText.isEmpty else {
            images = []
            return
        }
        
        guard let searchURL = createSearchURL() else {
            errorMessage = "Invalid search URL."
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        URLSession.shared.dataTaskPublisher(for: searchURL)
            .tryMap { result -> Data in
                guard let httpResponse = result.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return result.data
            }
            .decode(type: FlickrResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .finished:
                    print("Successfully received data")
                case .failure(let error):
                    self?.errorMessage = "Error fetching data: \(error.localizedDescription)"
                    print("Error fetching data: \(error)")
                }
            }, receiveValue: { [weak self] response in
                self?.images = response.items
                print("Fetched \(response.items.count) images")
            })
            .store(in: &cancellables)
    }
    
    private func createSearchURL() -> URL? {
        guard !searchText.isEmpty,
              let encodedSearchText = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: baseURL + encodedSearchText) else {
            return nil
        }
        return url
    }
}

