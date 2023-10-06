//
//  iOS17_SwiftData2App.swift
//  iOS17-SwiftData2
//
//  Created by 杨帆 on 2023/10/7.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Friend.self, Company.self])
        }
    }
}
