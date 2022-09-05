//
//  CategoryItem.swift
//  LandMark
//
//  Created by Minseop Kim on 2022/08/29.
//

import SwiftUI

struct CategoryItem: View {
    var landmark : Landmark
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .resizable()
                .renderingMode(.original)
                .frame(width: 155, height: 155, alignment: .center)
                .cornerRadius(15)
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[0])
    }
}
