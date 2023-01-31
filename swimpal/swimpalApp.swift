//
//  swimpalApp.swift
//  swimpal
//
//  Created by Samuel Hervás Gómez on 11/28/22.
//

import SwiftUI

@main
struct swimpalApp: App {
    
    @StateObject private var manager: DataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environmentObject(manager)
                .environment(\.managedObjectContext, manager.container.viewContext)
        }
    }
}
