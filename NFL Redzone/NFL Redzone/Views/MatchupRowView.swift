//
//  MatchupRowView.swift
//  NFL Redzone
//
//  Created by Stu Greenham on 28/11/2021.
//

import SwiftUI

struct MatchupRowView: View {
    
    //: MARK: - PROPERTIES
    
    var homeTeam: Competitor
    var homeTeamColor: String
    var awayTeam: Competitor
    var awayTeamColor: String
    
    
    //: MARK: - BODY
    
    var body: some View {
        
        HStack {
            
            HStack {
            
                // HOME
                LogoView(imageURL: homeTeam.team.logo)
                
                Text(homeTeam.team.abbreviation)
                
                Spacer()
                
                ScoreDetailView(scoreData: homeTeam.score)
                
            }
            .contentShape(Rectangle())
            .padding(4)
            .background(Color(homeTeamColor).cornerRadius(4))
                
            HStack {
                
                ScoreDetailView(scoreData: awayTeam.score)
                
                Spacer()
                
                // AWAY
                Text(awayTeam.team.abbreviation)
                LogoView(imageURL: awayTeam.team.logo)
                
            }
            .contentShape(Rectangle())
            .padding(4)
            .background(Color(awayTeam.team.color).cornerRadius(4))
            
        }
        .foregroundColor(.white)
        
    }
}

//struct MatchupRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        MatchupRowView()
//    }
//}
