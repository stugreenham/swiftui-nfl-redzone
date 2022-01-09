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
            // var headlines: [Headline]?
        }

            struct Competitor: Codable, Hashable {
                var id: String // team id
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
                var downDistanceText: String?
                var shortDownDistanceText: String?
                var possessionText: String?
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

//            struct Headline: Codable, Hashable {
//                var description: String
//                var video: [Video]?
//            }
//
//                struct Video: Codable, Hashable {
//                    var links: Link
//                }
//
//                    struct Link: Codable, Hashable {
//                        var mobile: Mobile
//                    }
//
//                        struct Mobile: Codable, Hashable {
//                            var source: Source
//                        }
//
//                            struct Source: Codable, Hashable {
//                                var href: String
//                            }


        struct Status: Codable, Hashable {
            var clock: Int
            var displayClock: String
            var period: Int
            var type: Type
        }

            struct Type: Codable, Hashable {
                var state: String // pre, in or post
                var description: String // final or scheduled
                var shortDetail: String // "10:17 - 1st"
            }
