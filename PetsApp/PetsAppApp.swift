//
//  PetsAppApp.swift
//  PetsApp
//
//  Created by Mohammad Azam on 7/23/22.
//

import SwiftUI

enum Route: Hashable {
    case detail(petId: Int)
}


@main
struct PetsAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                   
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                            case .detail(let petId):
                                PetDetailView(petId: petId)
                        }
                    }
            } .environmentObject(Webservice())
        }
    }
}
