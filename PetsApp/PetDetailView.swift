//
//  ContentView.swift
//  PetsApp
//
//  Created by Mohammad Azam on 7/23/22.
//

import SwiftUI

struct PetDetailView: View {
    
    @EnvironmentObject private var service: Webservice
    let petId: Int
    
    var body: some View {
        VStack {
            
            if let screenModel = service.screenModel, let components = try? screenModel.buildComponents() {
                ForEach(components, id: \.uniqueId) { component in
                    component.render()
                }
            }
            
            Spacer() 
            
        }.task {
            try? await service.load(Constants.ScreenResources.petDetail(petId: petId))
        }
        
    }
}

struct PetDetailView_Previews: PreviewProvider {
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
