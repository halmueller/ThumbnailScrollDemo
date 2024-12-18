//
//  City.swift
//  ThumbnailScrollDemo
//
//  Created by Hal Mueller on 12/17/24.
//

import Foundation

struct City: Identifiable, Hashable, Observable {
    public var id: String { name }
    let name: String
}
