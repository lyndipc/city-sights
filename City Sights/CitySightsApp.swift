//
//  CitySightsApp.swift
//  City Sights
//
//  Created by Lyndi Castrejon on 5/3/22.
//

import SwiftUI

@main
struct CitySightsApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
