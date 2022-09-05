//
//  LandmarkNew.swift
//  LandMark
//
//  Created by Minseop Kim on 2022/08/07.
//

import SwiftUI

struct LandmarkNew: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var firstNavi :Bool
    @State private var newData: Landmark = Landmark(id: 0, name: "", park: "", state: "", description: "", isFavorite: false, coordinates: Landmark.Coordinates(latitude: 0, longitude: 0), imageName: "", isFeatured: false, category: .lakes)
    
    
    var body: some View {
        ScrollView {
            HStack {

                Spacer()
                Button {
                    modelData.landmarks.append(newData)
                    firstNavi = false
                } label: {
                    Label("plus", systemImage: "plus.app")
                        .labelStyle(.iconOnly)
                        
                }

            }
            
            HStack {
                Text("Name : ")
                    .font(.title2)
                    .frame(width: 100, height: 50)
                Spacer()
                TextField(" Enter landmark name", text: $newData.name)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .font(.title2)
                    .padding()
            }
            
            HStack {
                Text("Park : ")
                    .font(.title2)
                    .frame(width: 100, height: 50)

                TextField("Enter park", text: $newData.park)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .font(.title2)
                    .padding()
            }
            
            HStack {
                Text("State : ")
                    .font(.title2)
                    .frame(width: 100, height: 50)
                TextField("Enter State", text: $newData.state)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .font(.title2)
                    .padding()
            }
            VStack(alignment: .leading){
                HStack {
                    Text("Description")
                        .font(.title2)
                    Spacer()
                }
                .padding()
                TextEditor(text: $newData.description)
                    .cornerRadius(15)
                    .frame(width: .infinity, height: 400)
                    .padding()
                    .background(Color(uiColor: .secondarySystemBackground))
            }
            
        }
        
    }
}

struct LandmarkNew_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkNew( firstNavi: .constant(true))
    }
}
