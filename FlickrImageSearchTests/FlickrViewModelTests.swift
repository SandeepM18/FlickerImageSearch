//
//  FlickrImageSearchTests.swift
//  FlickrImageSearchTests
//
//  Created by Sandeep Mekala on 6/26/24.
//

import XCTest
import Combine
@testable import FlickrImageSearch

class FlickrViewModelTests: XCTestCase {
    var viewModel: FlickrViewModel!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        viewModel = FlickrViewModel()
        cancellables = []
    }

    override func tearDown() {
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }

    func testFetchImages() {
        let expectation = XCTestExpectation(description: "Fetch images from Flickr")

        viewModel.$images
            .dropFirst()
            .sink { images in
                XCTAssertFalse(images.isEmpty, "Images should not be empty")
                expectation.fulfill()
            }
            .store(in: &cancellables)

        viewModel.searchText = "porcupine"

        wait(for: [expectation], timeout: 5.0)
    }
}
