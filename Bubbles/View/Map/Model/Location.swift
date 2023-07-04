//
//  Location.swift
//  Bubbles
//
//  Created by Lara K on 28/11/1444 AH.
//

import Foundation
import CoreLocation

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
