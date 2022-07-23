//
//  PetsAppApp.swift
//  PetsApp
//
//  Created by Mohammad Azam on 7/23/22.
//

import SwiftUI

@main
struct PetsAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(jsonService: LocalService())
        }
    }
}
