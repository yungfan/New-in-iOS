//
//  CountWidget.swift
//  CountWidget
//
//  Created by 杨帆 on 2023/7/4.
//

import SwiftUI
import WidgetKit

// MARK: - Widget
struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), count: "\(Counter.currentCount())")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date(), count: "\(Counter.currentCount())")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        let timeline = Timeline(entries: [SimpleEntry(date: Date(), count: "\(Counter.currentCount())")], policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let count: String
}

struct CountWidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Count: \(entry.count)")

            HStack {
                Button(intent: CountIntent(isIncrement: true)) {
                    Image(systemName: "plus.circle")
                }

                Button(intent: CountIntent(isIncrement: false)) {
                    Image(systemName: "minus.circle")
                }
            }
            .font(.largeTitle)
        }

        .containerBackground(.fill.tertiary, for: .widget)
    }
}

struct CountWidget: Widget {
    let kind: String = "CountWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            CountWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

// MARK: - 预览
#Preview(as: .systemSmall) {
    CountWidget()
} timeline: {
    SimpleEntry(date: .now, count: "99")
}

#Preview(as: .systemMedium) {
    CountWidget()
} timeline: {
    SimpleEntry(date: .now, count: "99")
}

#Preview(as: .systemLarge) {
    CountWidget()
} timeline: {
    SimpleEntry(date: .now, count: "99")
}
