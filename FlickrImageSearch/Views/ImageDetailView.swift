//
//  ImageDetailView.swift
//  FlickrImageSearch
//
//  Created by Sandeep Mekala on 6/26/24.
//

import SwiftUI

struct ImageDetailView: View {
    let image: FlickrImage

    var body: some View {
        GeometryReader { proxy in
            VStack {
                loadImage(proxy: proxy)
                loadTitle()
                loadDescription()
                loadAuthor()
                loadPublishedDate()
            }
            .navigationBarTitle(Constants.Strings.imageDetailPageTitle, displayMode: .inline)
            .accessibilityElement(children: .combine)
        }
    }
    
    private func loadImage(proxy: GeometryProxy) -> some View {
        AsyncImage(url: URL(string: image.media.m)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: proxy.size.height * 0.25)
                .clipped()
        } placeholder: {
            ProgressView()
        }
        .padding()
        .accessibility(label: Text(String(format: Constants.Accessibility.imageTitle, image.title)))
    }

    private func loadTitle() -> some View {
        Text(image.title)
            .font(.title)
            .padding(.bottom, 5)
            .padding(.horizontal, 5)
            .accessibility(addTraits: .isHeader)
    }

    private func loadDescription() -> some View {
        // NOTE: The description was intended to be displayed in a webview to render HTML content. However, it contains image URLs and other extraneous elements. Therefore, it is currently being displayed as plain text.
        Text(image.description)
            .font(.body)
            .padding(.bottom, 5)
            .padding(.horizontal, 5)
            .accessibility(label: Text(String(format: Constants.Accessibility.description, image.description)))
    }

    private func loadAuthor() -> some View {
        Text(String(format: Constants.Strings.author, image.author))
            .bold()
            .padding(.bottom, 5)
            .accessibility(label: Text(String(format: Constants.Accessibility.author, image.author)))
    }

    private func loadPublishedDate() -> some View {
        Text(String(format: Constants.Strings.published, image.published))
            .bold()
            .padding(.bottom, 5)
            .accessibility(label: Text(String(format: Constants.Accessibility.publishedDate, image.published)))
    }
    
    func formatDate(_ date: String) -> String {
        let formatter = ISO8601DateFormatter()
        if let date = formatter.date(from: date) {
            let displayFormatter = DateFormatter()
            displayFormatter.dateStyle = .medium
            displayFormatter.timeStyle = .none
            return displayFormatter.string(from: date)
        }
        return date
    }
}
