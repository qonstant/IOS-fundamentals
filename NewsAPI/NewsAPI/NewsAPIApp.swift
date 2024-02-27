//
//  NewsAPIApp.swift
//  NewsAPI
//
//  Created by Rakymzhan Zhabagin on 26.02.2024.
//

import SwiftUI

@main
struct NewsAPIApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
