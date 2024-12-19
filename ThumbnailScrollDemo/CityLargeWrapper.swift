//
//  CityLargeWrapper.swift
//  ThumbnailScrollDemo
//
//  Created by Hal Mueller on 12/17/24.
//

import SwiftUI

/// Accepts a binding to a `City.ID`, looks for that ID in the `PlacesManager`,  and wraps a `CityLargeView` displaying either the requested city or a placeholder city.
struct CityLargeWrapper: View {
    @Binding var cityId: City.ID?
    @Environment(PlacesManager.self) private var placesManager
    
    private var city: Binding<City> {
        Binding {
            if let id = cityId {
                return placesManager.city(with: id) ??  City.notFound
            } else {
                return City.empty
            }
        } set: { _ in
            // should never be here because CityLargeView is readonly, but closure is needed to pacify the compiler.
        }
    }
    
    var body: some View {
        CityLargeView(city: city)
    }
}
