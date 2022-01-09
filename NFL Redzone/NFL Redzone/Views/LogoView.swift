//
//  LogoView.swift
//  NFL Redzone
//
//  Created by Stu Greenham on 28/11/2021.
//

import SwiftUI

struct LogoView: View {
    
    //: MARK: - PROPERTIES
    
    var imageURL: String
    
    
    //: MARK: - BODY
    
    var body: some View {
        
        AsyncImage(url: URL(string: imageURL)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 26, height: 26)
        
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView(imageURL: "https://a.espncdn.com/i/teamlogos/nfl/500/scoreboard/den.png")
            .previewLayout(.sizeThatFits)
    }
}
