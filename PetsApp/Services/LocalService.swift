//
//  LocalService.swift
//  PetsApp
//
//  Created by Mohammad Azam on 7/23/22.
//

import Foundation

class LocalService: JSONService, ObservableObject {
    
    @Published var screenModel: ScreenModel?
    
    func load(_ resourceName: String) async throws {
        
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "json") else {
            fatalError("Resource file \(resourceName) not found!")
        }
        
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        
        Task { @MainActor [weak self] in
            self?.screenModel = try JSONDecoder().decode(ScreenModel.self, from: data)
        }
        
    }
    
}
