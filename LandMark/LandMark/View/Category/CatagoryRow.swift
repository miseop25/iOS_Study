//
//  CatagoryRow.swift
//  LandMark
//
//  Created by Minseop Kim on 2022/08/29.
//

import SwiftUI

struct CatagoryRow: View {
    var categoryName : String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment : .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                        
                    }
                }
                        
            }
            .frame(height : 185)
        }
   
    }
}

struct CatagoryRow_Previews: PreviewProvider {
    static var landmark = ModelData().landmarks
    static var previews: some View {
        CatagoryRow(categoryName: landmark[0].category.rawValue, items: Array(landmark.prefix(3)))
        
    }
}
