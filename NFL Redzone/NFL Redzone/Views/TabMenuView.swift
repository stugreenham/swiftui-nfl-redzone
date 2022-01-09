//
//  TabMenuView.swift
//  NFL Redzone
//
//  Created by Stu Greenham on 22/12/2021.
//

import SwiftUI

struct TabMenuView: View {
    
    //: MARK: - PROPERTIES
    
    @State private var selection = 2
    
    
    //: MARK: - BODY
    
    var body: some View {
        
        TabView(selection:$selection) {
            
            // SCHEDULED GAMES
            ContentView(gameFilter: 1).tabItem {
                Image(systemName: "calendar")
                Text("Scheduled")
            }
            .tag(1)
                
            // LIVE GAMES
            ContentView(gameFilter: 2).tabItem {
                Image(systemName: "gamecontroller.fill")
                Text("Live")
            }
            .tag(2)
            
            // COMPLETED GAMES
            ContentView(gameFilter: 3).tabItem {
                Image(systemName: "checkmark.circle.fill")
                Text("Complete")
            }
            .tag(3)
            
        }
        
    }
}


//: MARK: - PREVIEW

struct TabMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TabMenuView()
    }
}
