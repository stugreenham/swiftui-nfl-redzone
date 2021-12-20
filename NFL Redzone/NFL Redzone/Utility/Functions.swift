//
//  Functions.swift
//  NFL Redzone
//
//  Created by Stu Greenham on 02/12/2021.
//

import SwiftUI

func getRedzoneStatus(gameStatus: String, isRedzone: Bool) -> Bool {
    if(gameStatus == "In Progress") {
        if (isRedzone) {
            return true
        } else {
            return false
        }
    } else {
        return false
    }
    
    
}

func getColor(team: String) -> Color {
    var teamColor: Color
    
    if (team == "ARI") {
        teamColor = Color("team-ari")
    } else if(team == "ATL") {
        teamColor = Color("team-atl")
    } else if(team == "BAL") {
        teamColor = Color("team-bal")
    } else if(team == "BUF") {
        teamColor = Color("team-buf")
    } else if(team == "CAR") {
        teamColor = Color("team-car")
    } else if(team == "CHI") {
        teamColor = Color("team-chi")
    } else if(team == "CIN") {
        teamColor = Color("team-cin")
    } else if(team == "CLE") {
        teamColor = Color("team-cle")
    } else if(team == "DAL") {
        teamColor = Color("team-dal")
    } else if(team == "DEN") {
        teamColor = Color("team-den")
    } else if(team == "DET") {
        teamColor = Color("team-det")
    } else if(team == "GB") {
        teamColor = Color("team-gb")
    } else if(team == "HOU") {
        teamColor = Color("team-hou")
    } else if(team == "IND") {
        teamColor = Color("team-ind")
    } else if(team == "JAX") {
        teamColor = Color("team-jax")
    } else if(team == "KC") {
        teamColor = Color("team-kc")
    } else if(team == "LAC") {
        teamColor = Color("team-lac")
    } else if(team == "LV") {
        teamColor = Color("team-lv")
    } else if(team == "LAR") {
        teamColor = Color("team-lar")
    } else if(team == "MIA") {
        teamColor = Color("team-mia")
    } else if(team == "MIN") {
        teamColor = Color("team-min")
    } else if(team == "NE") {
        teamColor = Color("team-ne")
    } else if(team == "NO") {
        teamColor = Color("team-no")
    } else if(team == "NYG") {
        teamColor = Color("team-nyg")
    } else if(team == "NYJ") {
        teamColor = Color("team-nyj")
    } else if(team == "PHI") {
        teamColor = Color("team-phi")
    } else if(team == "PIT") {
        teamColor = Color("team-pit")
    } else if(team == "SF") {
        teamColor = Color("team-sf")
    } else if(team == "SEA") {
        teamColor = Color("team-sea")
    } else if(team == "TEN") {
        teamColor = Color("team-ten")
    } else if(team == "TB") {
        teamColor = Color("team-tb")
    } else if(team == "WSH") {
        teamColor = Color("team-wsh")
    } else {
        teamColor = Color(#colorLiteral(red: 0.6705882353, green: 0.7647058824, blue: 0.8078431373, alpha: 1))
    }
    return teamColor
}
