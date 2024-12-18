//
//  ItemLargeWrapper.swift
//  ThumbnailScrollDemo
//
//  Created by Hal Mueller on 12/17/24.
//

import SwiftUI

struct ItemLargeWrapper: View {
    @Binding var cityId: City.ID?
    @Environment(PlacesManager.self) private var placesManager
    
    private var city: Binding<City> {
//        Binding {
//            placesManager.city(with: cityId) ?? City(name: "not found")
//        }
        Binding {
            if let id = cityId {
                return placesManager.city(with: id) ??  City(name: "not found")
            } else {
                return City(name: "empty")
            }
        } set: { _ in
            // should never be here
        }
    }
    
    var body: some View {
        ItemLarge(city: city)
    }
}

//#Preview {
//    ItemLargeWrapper()
//}
