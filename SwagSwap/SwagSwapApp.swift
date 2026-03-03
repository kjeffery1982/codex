import SwiftUI

@main
struct SwagSwapApp: App {
    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor(Palette.paper)
        tabBarAppearance.shadowColor = .clear

        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        UITabBar.appearance().isTranslucent = false
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
