//
//  CarouselComponent.swift
//  PetsApp
//
//  Created by Mohammad Azam on 7/23/22.
//

import Foundation
import SwiftUI

struct CarouselComponent: UIComponent {
    
    let uiModel: CarouselUIModel
    var uniqueId = UUID()
    
    func render() -> AnyView {
        CarouselView(uiModel: uiModel).toAnyView()
    }
    
}
