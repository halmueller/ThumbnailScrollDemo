//
//  Gallery.swift
//  ThumbnailScrollDemo
//
//  Created by Hal Mueller on 12/17/24.
//

import SwiftUI

struct Gallery: View {
    let placesManager: PlacesManager = PlacesManager()
    
    @State private var selectedCityId: City.ID?

    var body: some View {
        VStack {
            ItemLargeWrapper(cityId: $selectedCityId)
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(placesManager.cities) { city in
                        Button {
                            selectedCityId = city.id
                        } label: {
                            ItemThumbnail(item: city)
                                .scaledToFill()
                            //                            .frame(height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                .background(.green)
                                .padding(.horizontal, 20)
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .frame(height: 200, alignment: .bottom)
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: $selectedCityId, anchor: .center)
        }
        .environment(placesManager)
    }
}

//#Preview {
//    Gallery()
//}
