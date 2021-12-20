//
//  PossessionView.swift
//  NFL Redzone
//
//  Created by Stu Greenham on 20/12/2021.
//

import SwiftUI

struct PossessionView: View {
    var body: some View {
        Image("football")
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
    }
}

struct PossessionView_Previews: PreviewProvider {
    static var previews: some View {
        PossessionView()
            .previewLayout(.sizeThatFits)
    }
}
