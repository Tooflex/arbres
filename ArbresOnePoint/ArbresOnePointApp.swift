//
//  Arbres_One_PointApp.swift
//  Arbres One Point
//
//  Created by Otourou Da Costa on 11/01/2022.
//

import SwiftUI

@main
struct ArbresOnePointApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ArbreList().environmentObject(ArbreListViewModel())
        }
    }
}
