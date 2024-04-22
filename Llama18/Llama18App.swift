//
//  Llama_RecoveryApp.swift
//  Llama Recovery
//
//  Created by Fabiano Calvay on 4/20/24.
//

import SwiftUI

@main
struct Llama_RecoveryApp: App {
    @StateObject var userInfo = UserInfo()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userInfo)
        }
    }
}
