//
//  GameModel.swift
//  NFL Redzone
//
//  Created by Stu Greenham on 27/11/2021.
//

import SwiftUI


// http://site.api.espn.com/apis/site/v2/sports/football/nfl/scoreboard


struct EventResponse: Codable, Hashable {
    var week: Week
    var events: [Event]
}

    struct Week: Codable, Hashable {
        var number: Int
    }

    struct Event: Codable, Hashable {
        var date: String
        var name: String
        var shortName: String
        var competitions: [Competition]
        var status: Status
    }


        struct Competition: Codable, Hashable {
            var id: String
            var competitors: [Competitor]
            var situation: Situation?
        }

            struct Competitor: Codable, Hashable {
                var team: Team
                var score: String
            }

                struct Team: Codable, Hashable {
                    var id: String
                    var abbreviation: String
                    var displayName: String
                    var shortDisplayName: String
                    var color: String
                    var alternateColor: String
                    var logo: String
                }

            struct Situation: Codable, Hashable {
                var lastPlay: LastPlay
                var down: Int
                var yardLine: Int
                var distance: Int
                var isRedZone: Bool
                var homeTimeouts: Int
                var awayTimeouts: Int
            }

                struct LastPlay: Codable, Hashable {
                    var text: String
                    var team: TeamPossession
                }

                    struct TeamPossession: Codable, Hashable {
                        var id: String
                    }

        struct Status: Codable, Hashable {
            var clock: Int
            var displayClock: String
            var period: Int
            var type: Type
        }

            struct Type: Codable, Hashable {
                var description: String
            }




/*
"status": {
    "clock": 617,
    "displayClock": "10:17",
    "period": 1,
    "type": {
    "id": "2",
    "name": "STATUS_IN_PROGRESS",
    "state": "in",
    "completed": false,
    "description": "In Progress",
    "detail": "10:17 - 1st Quarter",
    "shortDetail": "10:17 - 1st"
    }
}
 
 "situation": {
     "$ref": "http://sports.core.api.espn.pvt/v2/sports/football/leagues/nfl/events/401326499/competitions/401326499/situation?lang=en&region=us",
     "lastPlay": {
     "id": "401326499433",
     "type": {
     "id": "8",
     "text": "Penalty",
     "abbreviation": "PEN"
     },
     "text": "(10:17) PENALTY on TB-S.Barrett, Neutral Zone Infraction, 5 yards, enforced at IND 34 - No Play.",
     "scoreValue": 0,
     "team": {
     "id": "11"
     },
     "probability": {
     "tiePercentage": 0,
     "homeWinPercentage": 0.5426,
     "awayWinPercentage": 0.45740000000000003,
     "secondsLeft": 0
     },
     "drive": {
     "description": "0 plays, 5 yards, 0:00",
     "start": {
     "yardLine": 34,
     "text": "IND 34"
     },
     "timeElapsed": {
     "displayValue": "0:00"
     }
     },
     "start": {
     "yardLine": 34,
     "team": {
     "id": "11"
     }
     },
     "end": {
     "yardLine": 39,
     "team": {
     "id": "11"
     }
     },
     "statYardage": 5,
     "athletesInvolved": [
     {
     "id": "16967",
     "fullName": "Shaquil Barrett",
     "displayName": "Shaquil Barrett",
     "shortName": "S. Barrett",
     "links": [
     {
     "rel": [
     "playercard",
     "desktop",
     "athlete"
     ],
     "href": "http://www.espn.com/nfl/player/_/id/16967/shaquil-barrett"
     },
     {
     "rel": [
     "stats",
     "desktop",
     "athlete"
     ],
     "href": "http://www.espn.com/nfl/player/stats/_/id/16967/shaquil-barrett"
     },
     {
     "rel": [
     "splits",
     "desktop",
     "athlete"
     ],
     "href": "http://www.espn.com/nfl/player/splits/_/id/16967/shaquil-barrett"
     },
     {
     "rel": [
     "gamelog",
     "desktop",
     "athlete"
     ],
     "href": "http://www.espn.com/nfl/player/gamelog/_/id/16967/shaquil-barrett"
     },
     {
     "rel": [
     "news",
     "desktop",
     "athlete"
     ],
     "href": "http://www.espn.com/nfl/player/news/_/id/16967/shaquil-barrett"
     },
     {
     "rel": [
     "bio",
     "desktop",
     "athlete"
     ],
     "href": "http://www.espn.com/nfl/player/bio/_/id/16967/shaquil-barrett"
     },
     {
     "rel": [
     "overview",
     "desktop",
     "athlete"
     ],
     "href": "http://www.espn.com/nfl/player/_/id/16967/shaquil-barrett"
     }
     ],
     "headshot": "https://a.espncdn.com/i/headshots/nfl/players/full/16967.png",
     "jersey": "58",
     "position": "LB",
     "team": {
     "id": "27"
     }
     }
     ]
     },
     "down": 1,
     "yardLine": 39,
     "distance": 5,
     "downDistanceText": "1st & 5 at IND 39",
     "shortDownDistanceText": "1st & 5",
     "possessionText": "IND 39",
     "isRedZone": false,
     "homeTimeouts": 3,
     "awayTimeouts": 3,
     "possession": "11"
     },
 
 
 */
