//
//  TodoMvvmSwiftUIApp.swift
//  TodoMvvmSwiftUI
//
//  Created by Mehdi Taghdisi on 10/14/1401 AP.
//

import SwiftUI

@main
struct TodoMvvmSwiftUIApp: App {
    
    @StateObject var listViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
