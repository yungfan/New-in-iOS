//
//  ContentView.swift
//  iOS17-Widget2
//
//  Created by 杨帆 on 2023/7/4.
//

import AppIntents
import SwiftUI
import WidgetKit

// MARK: - Model
class Counter {
    @AppStorage("count", store: UserDefaults(suiteName: "group.cn.yf.SwiftUI-Widget2023")) static var count = 0

    static func incrementCount() {
        count += 1
    }

    static func decrementCount() {
        count -= 1
    }

    static func currentCount() -> Int {
        return count
    }
}

// MARK: - AppIntent
struct CountIntent: AppIntent {
    static var title: LocalizedStringResource = "CountIntent"
    static var description: IntentDescription = IntentDescription("CountIntent")

    @Parameter(title: "isIncrement")
    var isIncrement: Bool

    init() {
    }

    init(isIncrement: Bool) {
        self.isIncrement = isIncrement
    }

    func perform() async throws -> some IntentResult {
        if isIncrement {
            Counter.incrementCount()
        } else {
            Counter.decrementCount()
        }

        return .result()
    }
}

struct ContentView: View {
    @Environment(\.scenePhase) private var phase
    @State private var count = 0

    var body: some View {
        VStack {
            Text("Count: \(count)")
                .font(.largeTitle)
                .foregroundStyle(.primary)

            HStack {
                Button {
                    count += 1
                    Counter.incrementCount()
                    WidgetCenter.shared.reloadAllTimelines()
                } label: {
                    Image(systemName: "plus")
                        .font(.largeTitle)
                }

                Button {
                    count -= 1
                    Counter.decrementCount()
                    WidgetCenter.shared.reloadAllTimelines()
                } label: {
                    Image(systemName: "minus")
                        .font(.largeTitle)
                }
            }
        }
        .padding()
        .onChange(of: phase) {
            count = Counter.currentCount()
        }
    }
}

#Preview {
    ContentView()
}
