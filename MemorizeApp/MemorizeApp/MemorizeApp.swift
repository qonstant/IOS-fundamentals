//
//  MemorizeApp.swift
//  MemorizeApp
//
//  Created by Rakymzhan Zhabagin on 29.02.2024.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var store = MemoryStore()
    
    var body: some Scene {
        WindowGroup {
            ThemeChooser()
                .environmentObject(store)
        }
    }
}
