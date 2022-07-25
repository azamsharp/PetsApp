//
//  Webservice.swift
//  Pets
//
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case invalidServerResponse
}

class Webservice: JSONService, ObservableObject {
    
    @Published var screenModel: ScreenModel?
    
    func load(_ resourceName: String) async throws {
       
        guard let url = Constants.ScreenResources.resource(for: resourceName) else {
            throw NetworkError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
                  throw NetworkError.invalidServerResponse
              }
        
        Task { @MainActor [weak self]  in
            self?.screenModel = try JSONDecoder().decode(ScreenModel.self, from: data)
            print(self?.screenModel)
        }
    }
   
}
