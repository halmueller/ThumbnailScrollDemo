//
//  PlacesManager.swift
//  ThumbnailScrollDemo
//
//  Created by Hal Mueller on 12/18/24.
//

import Foundation

@Observable
class PlacesManager {
    var cities: [City] = [City(name: "paris"),
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
                          City(name: "hongkong")]


    func city(with id: String) -> City? {
        cities.first(where: { $0.id == id })
    }
}
