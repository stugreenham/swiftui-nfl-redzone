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
    var awayTeam: Competitor
    var situation: Situation?
    var clock: String
    var period: Int
    var downDistance: String
    var redzone: Bool
    
    
    //: MARK: - BODY
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            // AWAY
            HStack {
                
                // TEAM LOGO
                LogoView(imageURL: awayTeam.team.logo)
                
                // TEAM NAME
                Text(awayTeam.team.shortDisplayName)
                // Text("#\(awayTeam.team.id)")
                    
                Spacer()
                
                // IN POSSESSION
                if(awayTeam.team.id == situation?.lastPlay.team.id) {
                    PossessionView()
                }
                
                // SCORE
                ScoreDetailView(scoreData: awayTeam.score)
                
            }
            .contentShape(Rectangle())
            .padding(.horizontal, 12)
            .padding(.top, 12)
            .padding(.bottom, 4)
            

            // HOME
            HStack {
            
                // TEAM LOGO
                LogoView(imageURL: homeTeam.team.logo)
                
                // TEAM NAME
                Text(homeTeam.team.shortDisplayName)
                // Text("#\(homeTeam.team.id)")
                
                Spacer()
                
                // IN POSSESSION
                if(homeTeam.team.id == situation?.lastPlay.team.id) {
                    PossessionView()
                }
                
                // SCORE
                ScoreDetailView(scoreData: homeTeam.score)
                
            }
            .contentShape(Rectangle())
            .padding(.horizontal, 12)
            .padding(.top, 4)
            .padding(.bottom, 12)
            
            
            // GAME DETAILS
            HStack {
                
                // DOWN
                Text(downDistance)
                
                Spacer()
                
                // CLOCK / PERIOD
                Text("\(clock) in the \(period)")
                
            }
            .font(.footnote)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(RoundedCorners(tl: 0, tr: 0, bl: 8, br: 8).fill(Color("app-bg")))
            
            
            
        } //: VSTACK
        //.padding(12)
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        
    }
}

struct MatchupRowView_Previews: PreviewProvider {
    static var previews: some View {
        MatchupRowView(
            homeTeam: Competitor(
                id: "5",
                team: Team(
                    id: "28",
                    abbreviation: "WSH",
                    displayName: "Washington",
                    shortDisplayName: "Washington",
                    color: "650415",
                    alternateColor: "650415",
                    logo: "https://a.espncdn.com/i/teamlogos/nfl/500/scoreboard/wsh.png"),
                score: "0"),
            awayTeam: Competitor(
                id: "33",
                team: Team(
                    id: "26",
                    abbreviation: "SEA",
                    displayName: "Seattle Seahawks",
                    shortDisplayName: "Seahawks",
                    color: "224970",
                    alternateColor: "69be28",
                    logo: "https://a.espncdn.com/i/teamlogos/nfl/500/scoreboard/sea.png"),
                score: "0"),
            situation: Situation(
                lastPlay: LastPlay(
                    text: "Timeout at 07:54.",
                    team: TeamPossession(id: "5")
                ),
                down: 3,
                yardLine: 75,
                distance: 5,
                downDistanceText: "3rd & 5 at BAL 25",
                shortDownDistanceText: "3rd & 5",
                possessionText: "BAL 25",
                isRedZone: false,
                homeTimeouts: 3,
                awayTimeouts: 3
            ),
            clock: "15:00",
            period: 1,
            downDistance: "3rd & 24 at DEN 11",
            redzone: false
            )
            .previewLayout(.sizeThatFits)
//            .padding()
    }
}

