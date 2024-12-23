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
                .gesture(
                    DragGesture(minimumDistance: 20) // empirically determined value
                        .onEnded { value in
                            if value.translation.width < 0 {
                                let next = placesManager.nextAfter(selectedCityId)
                                selectedCityId = next?.id
                            } else {
                                let previous = placesManager.previousBefore(selectedCityId)
                                selectedCityId = previous?.id
                            }
                        }
                )
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(placesManager.cities) { city in
                        Button {
                            selectedCityId = city.id
                        } label: {
                            CityThumbnail(city: city, selected: selectedCityId == city.id)
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                        }
                        .buttonBorderShape(.roundedRectangle(radius: 4))
                        .buttonStyle(.plain)
                        .padding(.horizontal, 20)
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

#Preview {
    Gallery()
}
