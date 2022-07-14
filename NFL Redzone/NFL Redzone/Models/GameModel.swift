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



/*
 
 "yardLine": 11,
 "distance": 24,
 "downDistanceText": "3rd & 24 at DEN 11",
 "shortDownDistanceText": "3rd & 24",
 "possessionText": "DEN 11",
 "isRedZone": false,
 "homeTimeouts": 0,
 "awayTimeouts": 1,
 "possession": "7"
 */


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


/*
 
 "links": {
 "api": {
 "self": {
 "href": "http://api.espn.com/v1/video/clips/32899916"
 },
 "artwork": {
 "href": "https://artwork.api.espn.com/artwork/collections/media/d9aa5421-bfaf-4997-8e34-6df1dab27634"
 }
 },
 "web": {
 "href": "http://espn.go.com/video/clip?id=32899916&ex_cid=espnapi_internal",
 "short": {
 "href": "https://es.pn/3EmD0Tf"
 },
 "self": {
 "href": "http://espn.go.com/video/clip?id=32899916&ex_cid=espnapi_internal"
 }
 },
 "source": {
 "mezzanine": {
 "href": "https://media.video-origin.espn.com/espnvideo/2021/1218/dm_211218_Taylor_late_TD/dm_211218_Taylor_late_TD.mp4"
 },
 "flash": {
 "href": "https://media.video-cdn.espn.com/motion/2021/1218/dm_211218_Taylor_late_TD/dm_211218_Taylor_late_TD.smil"
 },
 "hds": {
 "href": "https://hds.video-cdn.espn.com/z/motion/2021/1218/dm_211218_Taylor_late_TD/dm_211218_Taylor_late_TD_rel.smil/manifest.f4m"
 },
 "HLS": {
 "href": "https://espnpackaging-vh.akamaihd.net/i/motion/2021/1218/dm_211218_Taylor_late_TD/dm_211218_Taylor_late_TD.smil/master.m3u8",
 "HD": {
 "href": "https://espnpackaging-vh.akamaihd.net/i/motion/2021/1218/dm_211218_Taylor_late_TD/dm_211218_Taylor_late_TD.smil/master.m3u8"
 }
 },
 "HD": {
 "href": "https://media.video-cdn.espn.com/motion/2021/1218/dm_211218_Taylor_late_TD/dm_211218_Taylor_late_TD_720p30_2896k.mp4"
 },
 "full": {
 "href": "https://media.video-cdn.espn.com/motion/2021/1218/dm_211218_Taylor_late_TD/dm_211218_Taylor_late_TD_360p30_1464k.mp4"
 },
 "href": "https://media.video-cdn.espn.com/motion/2021/1218/dm_211218_Taylor_late_TD/dm_211218_Taylor_late_TD_360p30_1464k.mp4"
 },
 "mobile": {
 "alert": {
 "href": "http://m.espn.go.com/general/video/videoAlert?vid=32899916&ex_cid=espnapi_internal"
 },
 "source": {
 "href": "https://media.video-cdn.espn.com/motion/2021/1218/dm_211218_Taylor_late_TD/dm_211218_Taylor_late_TD.mp4"
 },
 "href": "https://watch.auth.api.espn.com/video/auth/brightcove/d9aa5421-bfaf-4997-8e34-6df1dab27634/asset?UMADPARAMreferer=http://www.espn.com/video/clip?id=32899916",
 "streaming": {
 "href": "https://watch.auth.api.espn.com/video/auth/brightcove/d9aa5421-bfaf-4997-8e34-6df1dab27634/asset?UMADPARAMreferer=http://www.espn.com/video/clip?id=32899916"
 },
 "progressiveDownload": {
 "href": "https://watch.auth.api.espn.com/video/auth/brightcove/d9aa5421-bfaf-4997-8e34-6df1dab27634/asset?UMADPARAMreferer=http://www.espn.com/video/clip?id=32899916"
 }
 }
 }
 */
