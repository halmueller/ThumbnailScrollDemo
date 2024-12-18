//
//  CityThumbnail.swift
//  ThumbnailScrollDemo
//
//  Created by Hal Mueller on 12/17/24.
//

import SwiftUI

/// Very simple, just show the city's name.
struct CityThumbnail: View {
    let city: City
    
    var body: some View {
        Text(city.name)
            .frame(height: 100)
            .padding(.horizontal)
    }
}
