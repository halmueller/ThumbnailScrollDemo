//
//  CityLargeView.swift
//  ThumbnailScrollDemo
//
//  Created by Hal Mueller on 12/17/24.
//

import SwiftUI

/// Very simple, just show the city's name. We'll use all caps to be fancy.
struct CityLargeView: View {
    @Binding var city: City
    
    var body: some View {
        Text(city.name)
            .textCase(.uppercase)
            .font(.largeTitle)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color.red)
    }
}

#Preview("large view") {
    @Previewable @State var city = City.sample
    
    return CityLargeView(city: $city)
}
