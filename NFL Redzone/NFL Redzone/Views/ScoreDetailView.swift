//
//  ScoreDetailView.swift
//  NFL Redzone
//
//  Created by Stu Greenham on 28/11/2021.
//

import SwiftUI

struct ScoreDetailView: View {
    
    //: MARK: - PROPERTIES
    
    var scoreData: String
    
    
    //: MARK: - BODY
    
    var body: some View {
        
        Text(scoreData)
            .frame(width: 34, height: 34, alignment: .center)
            .background(Color(.black))
            .foregroundColor(Color(.white))
            .font(.system(size: 22, weight: .bold))
        
    }
}


//: MARK: - PREVIEW

struct ScoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreDetailView(scoreData: "30")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
