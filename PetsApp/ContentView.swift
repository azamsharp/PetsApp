//
//  ContentView.swift
//  PetsApp
//
//  Created by Mohammad Azam on 7/23/22.
//

import SwiftUI

struct ContentView<Service: JSONService>: View {
    
    @StateObject private var jsonService: Service
    
    init(jsonService: Service) {
        _jsonService = StateObject(wrappedValue: jsonService)
    }
    
    var body: some View {
        VStack {
            
            if let screenModel = jsonService.screenModel, let components = try? screenModel.buildComponents() {
                ForEach(components, id: \.uniqueId) { component in
                    component.render()
                }
            }
            
            NavigationLink("Details", value: "Details")
                .buttonStyle(.borderedProminent)
            
        }.task {
            try? await jsonService.load("pets-listing")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView(jsonService: LocalService())
        }
    }
}
