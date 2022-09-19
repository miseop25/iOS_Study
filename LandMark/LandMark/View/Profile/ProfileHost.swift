//
//  ProfileHost.swift
//  LandMark
//
//  Created by Minseop Kim on 2022/09/05.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.porfile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.porfile)
            }else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.porfile
                    }
                    .onDisappear {
                        modelData.porfile = draftProfile
                    }
            }
            
        }
        .padding()
        
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
