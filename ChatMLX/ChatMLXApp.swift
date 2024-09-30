//
//  ChatMLXApp.swift
//  ChatMLX
//
//  Created by John Mai on 2024/8/3.
//

import Defaults
import SwiftData
import SwiftUI

@main
struct ChatMLXApp: App {
    @State private var conversationViewModel: ConversationView.ViewModel = .init()
    @State private var settingsViewModel: SettingsView.ViewModel = .init()

    @Default(.language) var language
    @State private var runner = LLMRunner()

    var body: some Scene {
        WindowGroup {
            ConversationView()
                .environment(conversationViewModel)
                .environment(
                    \.locale, .init(identifier: language.rawValue)
                )
                .environment(runner)
                .frame(minWidth: 900, minHeight: 580)
        }
        .modelContainer(for: [Conversation.self, Message.self])
        .commands {
            CommandGroup(replacing: .appInfo) {
                Button("About ChatMLX", action: showAppInfo)
            }
        }
        Settings {
            SettingsView()
                .environment(conversationViewModel)
                .environment(settingsViewModel)
                .environment(
                    \.locale, .init(identifier: language.rawValue)
                )
                .environment(runner)
                .frame(width: 620, height: 480)
        }
        .modelContainer(for: [Conversation.self, Message.self])
    }

    private func showAppInfo() {
        let aboutWindow = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 300, height: 300),
            styleMask: [.titled, .closable],
            backing: .buffered, defer: false)

        aboutWindow.isReleasedWhenClosed = false
        aboutWindow.title = "About ChatMLX"
        aboutWindow.center()

        let aboutView = AboutView().ultramanMinimalistWindowStyle().foregroundColor(.white)
        aboutWindow.contentView = NSHostingView(rootView: aboutView)
        aboutWindow.makeKeyAndOrderFront(nil)
    }
}
