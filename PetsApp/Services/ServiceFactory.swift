//
//  ServiceFactory.swift
//  PetsApp
//
//  Created by Mohammad Azam on 7/24/22.
//

import Foundation

class ServiceFactory {
    
    static func create() -> any JSONService {
        #if DEBUG
            return LocalService()
        #else
            return Webservice()
        #endif
    }
    
}
