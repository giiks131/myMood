

import SwiftUI

@main
struct myMoodApp: App {
    
   @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MoodView()
                
            }
            .environmentObject(listViewModel)
        }
        
    }
}
