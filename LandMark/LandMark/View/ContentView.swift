//
//  ContentView.swift
//  LandMark
//
//  Created by Minseop Kim on 2022/08/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        VStack {
//            MapView()
//                .ignoresSafeArea(edges: .top)
//                .frame(height: 300)
//
//            CircleView()
//                .offset(y: -100)
//                .padding(.bottom, -100)
//
//            VStack(alignment: .leading) {
//                Text("Turtle Rock")
//                    .font(.title)
//                HStack {
//                    Text("조쉬 나무 국립 공원")
//                    Spacer()
//                    Text("캘리포니아")
//                }
//                .font(.subheadline)
//                .foregroundColor(.secondary)
//
//                Divider()
//                Text("About Turtle Rock")
//                    .font(.title2)
//                Text("설명")
//                    .font(.subheadline)
//                    .foregroundColor(.secondary)
//            }
//            .padding()
//            Spacer()
////          제일 아래쪽에 Spacer를 부착하면 위의 Stack이 최 상단으로 위치하게 된다.
//        }
        
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
