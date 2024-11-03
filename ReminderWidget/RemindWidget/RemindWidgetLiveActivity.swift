//
//  RemindWidgetLiveActivity.swift
//  RemindWidget
//
//  Created by jun on 2024/11/03.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct RemindWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct RemindWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: RemindWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension RemindWidgetAttributes {
    fileprivate static var preview: RemindWidgetAttributes {
        RemindWidgetAttributes(name: "World")
    }
}

extension RemindWidgetAttributes.ContentState {
    fileprivate static var smiley: RemindWidgetAttributes.ContentState {
        RemindWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: RemindWidgetAttributes.ContentState {
         RemindWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: RemindWidgetAttributes.preview) {
   RemindWidgetLiveActivity()
} contentStates: {
    RemindWidgetAttributes.ContentState.smiley
    RemindWidgetAttributes.ContentState.starEyes
}
