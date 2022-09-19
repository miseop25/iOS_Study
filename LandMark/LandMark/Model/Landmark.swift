//
//  Landmark.swift
//  LandMark
//
//  Created by Minseop Kim on 2022/08/01.
//

import Foundation
import SwiftUI
import CoreLocation


struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var coordinates: Coordinates
    var imageName: String
    var isFeatured: Bool
    
    
    var category : Category
    enum Category : String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    var image: Image {
        Image(imageName)
    }
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
 
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double        // 위도
        var longitude: Double       // 경도
    }
    
}
