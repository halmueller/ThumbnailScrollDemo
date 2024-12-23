//
//  City.swift
//  ThumbnailScrollDemo
//
//  Created by Hal Mueller on 12/17/24.
//

import Foundation

struct City: Identifiable, Observable {
    public var id: String { name }
    let name: String
    
    static let notFound: City = .init(name: "Not Found")
    static let empty: City = .init(name: "empty")
    static let sample: City = .init(name: "sample")
}
