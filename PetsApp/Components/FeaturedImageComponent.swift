//
//  FeaturedImageComponent.swift
//  PetsApp
//
//  Created by Mohammad Azam on 7/24/22.
//

import Foundation
import SwiftUI

struct FeaturedImageComponent: UIComponent {
    
    let uiModel: FeaturedImageUIModel
    var uniqueId = UUID()
    
    func render() -> AnyView {
        AsyncImage(url: uiModel.imageUrl) { image in
            image
                .resizable()
                .scaledToFit()
                //.frame(width: 200, height: 200)
        } placeholder: {
            ProgressView()
        }.toAnyView()
    }
    
}
