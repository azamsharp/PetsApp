//
//  JSONService.swift
//  PetsApp
//
//  Created by Mohammad Azam on 7/23/22.
//

import Foundation

protocol JSONService: ObservableObject {
    var screenModel: ScreenModel? { get set }
    func load(_ resourceName: String) async throws 
}
