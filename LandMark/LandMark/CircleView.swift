//
//  CircleView.swift
//  LandMark
//
//  Created by Minseop Kim on 2022/08/01.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.gray, lineWidth: 4)
            }
            .shadow(color: .black, radius: 7)
        
        
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}
