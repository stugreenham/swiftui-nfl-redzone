//
//  ContentView.swift
//  NFL Redzone
//
//  Created by Stu Greenham on 27/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    //: MARK: - PROPERTIES
    
    @State private var games = [Event]()
    @State private var isError: Bool = false
    
    
    
    //: MARK: - FUNCTIONS
    
    // load in users fleaflicker leagues
    func loadGameData() {
        guard let url = URL(string: "https://site.api.espn.com/apis/site/v2/sports/football/nfl/scoreboard") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
            
                do {
                    let decodedReponse = try JSONDecoder().decode(EventResponse.self, from: data)

                    DispatchQueue.main.async {
//                        print("------- decodedResponse -------")
//                        print(decodedReponse)
                        self.games = decodedReponse.events
                        self.isError = false
                    }

                    return
                } catch {
                    print(error)
                    self.isError = true
                }
                
            }
            
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(Array(games), id: \.self) { game in

                    VStack(alignment: .leading) {
                        
                        
                        MatchupRowView(
                            homeTeam: game.competitions[0].competitors[0],
                            homeTeamColor: game.competitions[0].competitors[0].team.color,
                            awayTeam: game.competitions[0].competitors[1],
                            awayTeamColor: game.competitions[0].competitors[1].team.color
                        )
                        

                        Text("\(game.status.displayClock) in the \(game.status.period)")
                            .font(.footnote)
                        
                        if(game.status.type.description == "In Progress") {
                            if (game.competitions[0].situation!.isRedZone) {
                                Text("Redzone")
                                    .font(.footnote)
                            }
                        }

                    }

                }
            }
            .refreshable {
                loadGameData()
            }
            .navigationTitle("Redzone")
            .listStyle(PlainListStyle())
            .onAppear(perform: loadGameData)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
