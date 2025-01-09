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
    @State private var offset = CGSize.zero

    var body: some View {
        VStack {
                CityLargeWrapper(cityId: $selectedCityId)
                .offset(x: offset.width * 3.0)
                .gesture(
                    DragGesture() // empirically determined value
                        .onEnded { _ in
                            if abs(offset.width) > 80 {
                                if offset.width < 0 {
                                    let next = placesManager.nextAfter(selectedCityId)
                                    selectedCityId = next?.id
                                } else {
                                    let previous = placesManager.previousBefore(selectedCityId)
                                    selectedCityId = previous?.id
                                }
                            }
                            offset = CGSize.zero
                        }
                        .onChanged { gesture in
                            offset = gesture.translation
                            // https://www.hackingwithswift.com/books/ios-swiftui/moving-views-with-draggesture-and-offset
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
            .background(.gray)
            .onAppear { selectedCityId = placesManager.cities.first?.id }
            .frame(height: 200, alignment: .bottom)
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: $selectedCityId, anchor: .center)
        }
        .background(.yellow)
        .environment(placesManager)
    }
}

#Preview {
    Gallery()
}
