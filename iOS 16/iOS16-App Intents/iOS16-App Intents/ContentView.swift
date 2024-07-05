//
//  ContentView.swift
//  iOS16-App Intents
//
//  Created by 杨帆 on 2024/7/5.
//

import AppIntents
import SwiftUI

struct ShowMessageIntent: AppIntent {
    static var title: LocalizedStringResource = "Show Message"
    static var description = IntentDescription("Displays a message provided by the user.")

    @Parameter(title: "Message")
    var message: String

    init() {}

    init(message: String) {
        self.message = message
    }

    func perform() async throws -> some IntentResult & ProvidesDialog {
        return .result(dialog: "You said: \(message)")
    }
}

struct ContentView: View {
    @State private var message = ""

    var body: some View {
        VStack {
            TextField("Enter a message", text: $message)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Show Message") {
                Task {
                    do {
                        let intent = ShowMessageIntent(message: message)
                        let result = try await intent.perform()
                        print(result)
                    } catch {
                        print("Failed to perform intent: \(error)")
                    }
                }
            }
            .padding()
        }
        .padding()
    }
}

struct MesssgaeShortCuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: ShowMessageIntent(),
            phrases: ["Show message \(.applicationName)"]
        )
    }
}

#Preview {
    ContentView()
}
