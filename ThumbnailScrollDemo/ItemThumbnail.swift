//
//  ItemThumbnail.swift
//  ThumbnailScrollDemo
//
//  Created by Hal Mueller on 12/17/24.
//

import SwiftUI

struct ItemThumbnail: View {
    let item: City
    
    var body: some View {
        Text(item.name)
            .frame(height: 100)
            .padding(.horizontal)
    }
}

#Preview {
    ItemThumbnail(item: City(name: "hello"))
}
