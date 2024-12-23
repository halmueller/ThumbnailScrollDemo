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
                          City(name: "havana"),
                          City(name: "osaka"),
                          City(name: "kyoto"),
                          City(name: "seoul"),
                          City(name: "sydney"),
                          City(name: "hongkong")]


    func city(with id: String) -> City? {
        cities.first(where: { $0.id == id })
    }
    
    public func nextAfter(_ cityID: String?) -> City? {
        if let cityID,
           let thisCityIndex = cities.firstIndex(where: { $0.id == cityID}) {
            if thisCityIndex < cities.count - 1 {
                let nextCityIndex = thisCityIndex + 1
                return cities[nextCityIndex]
            } else {
                return cities.first
            }
        }
        return nil
    }

    public func previousBefore(_ cityID: String?) -> City? {
        if let cityID,
           let thisCityIndex = cities.firstIndex(where: { $0.id == cityID}) {
            if thisCityIndex > 0 {
                let previousCityIndex = thisCityIndex - 1
                return cities[previousCityIndex]
            } else {
                return cities.last
            }
        }
        return nil
    }
}
