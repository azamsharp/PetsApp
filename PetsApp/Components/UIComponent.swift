//
//  UIComponent.swift
//  PetsApp
//
//  Created by Mohammad Azam on 7/23/22.
//

import Foundation
import SwiftUI

protocol UIComponent {
    var uniqueId: UUID { get set }
    func render() -> AnyView
}
