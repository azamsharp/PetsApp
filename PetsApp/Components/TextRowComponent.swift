//
//  TextRowComponent.swift
//  PetsApp
//
//  Created by Mohammad Azam on 7/24/22.
//

import Foundation
import SwiftUI

struct TextRowComponent: UIComponent {
    
    let uiModel: TextRowUIModel 
    
    var uniqueId: UUID = UUID()
    
    func render() -> AnyView {
        Text(uiModel.text).toAnyView()
    }
    
}
