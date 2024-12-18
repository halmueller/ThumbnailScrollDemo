//
//  Gallery.swift
//  ThumbnailScrollDemo
//
//  Created by Hal Mueller on 12/17/24.
//

import SwiftUI

/// Show scrolling thumbnail views underneath a single detail view that updates as the thumbnails scroll.
/// With thanks to https://www.appcoda.com/scrollview-paging/.
struct Gallery: View {
    let placesManager: PlacesManager = PlacesManager()
    
    @State private var selectedCityId: City.ID?

    var body: some View {
        VStack {
            CityLargeWrapper(cityId: $selectedCityId)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(placesManager.cities) { city in
                        Button {
                            selectedCityId = city.id
                        } label: {
                            CityThumbnail(city: city)
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                .background(.green)
                                .padding(.horizontal, 20)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .scrollTargetLayout()
            }
            .onAppear { selectedCityId = placesManager.cities.first?.id }
            .frame(height: 200, alignment: .bottom)
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: $selectedCityId, anchor: .center)
        }
        .environment(placesManager)
    }
}
