//
//  ItemLarge.swift
//  ThumbnailScrollDemo
//
//  Created by Hal Mueller on 12/17/24.
//

import SwiftUI

struct ItemLarge: View {
    @Binding var city: City
    
    var body: some View {
        Text(city.name)
            .font(.largeTitle)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color.red)
    }
}

//#Preview {
//    ItemLarge()
//}
