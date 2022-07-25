//
//  ContentView.swift
//  PetsApp
//
//  Created by Mohammad Azam on 7/23/22.
//

import SwiftUI

struct ContentView: View {
    
   @StateObject private var service = Webservice()
    
    var body: some View {
        ScrollView {
            
            if let screenModel = service.screenModel, let components = try? screenModel.buildComponents() {
                ForEach(components, id: \.uniqueId) { component in
                    component.render()
                }
            }
            
            NavigationLink("Details", value: Route.detail(petId: 1))
                .buttonStyle(.borderedProminent)
            
            .navigationTitle("Pets")
            
        }.task {
            try? await service.load(Constants.ScreenResources.petListing)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
                .navigationDestination(for: Route.self) { route in
                    switch route {
                        case .detail(_):
                            PetDetailView(petId: 1)
                    }
                }
        }
    }
}
