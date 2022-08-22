//
//  LandmarkList.swift
//  LandMark
//
//  Created by Minseop Kim on 2022/08/01.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    @State var firstNavi = false
    
    var filteredLandmarks : [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    Toggle(isOn: $showFavoritesOnly) {
                        Text("Star")
                    }
                    
                    ForEach(filteredLandmarks) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                    
                }
                .navigationTitle("Landmarks")
                
                .toolbar {
                        NavigationLink(destination: LandmarkNew(firstNavi: $firstNavi), isActive: $firstNavi ) {

                        }
                }
            }
            VStack {
                Spacer()
                HStack{
                    Spacer()
                    if(firstNavi == false) {
                        Button {
                            firstNavi = true
                        } label: {
                            Image(systemName: "plus.app.fill")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                        }
                        .padding()
                    }
                    
                    
                }
                
            }
            
            

        }

        
        
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
