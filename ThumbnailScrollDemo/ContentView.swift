//
//  ContentView.swift
//  ThumbnailScrollDemo
//
//  Created by Hal Mueller on 12/17/24.
//

import SwiftUI

struct ContentView: View {
    private let sampleTrips = [ City(name: "paris"),
                                City(name: "florence"),
                                City(name: "amsterdam"),
                                City(name: "ghent"),
                                City(name: "santorini"),
                                City(name: "budapest"),
                                City(name: "london"),
                                City(name: "cuba"),
                                City(name: "osaka"),
                                City(name: "kyoto"),
                                City(name: "seoul"),
                                City(name: "sydney"),
                                City(name: "hongkong") ]

    let dummyItem = City(name: "paris")
    
    var body: some View {
        Gallery()
    }
}

//#Preview {
//    ContentView()
//}
