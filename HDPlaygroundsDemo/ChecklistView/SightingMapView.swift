//
//  SightingView.swift
//  HDPlaygroundsDemo
//
//  Created by denglibing on 2023/7/13.
//

import Foundation
import CoreLocation
import MapKit
import UIKit

struct Sighting {
    let location: CLLocationCoordinate2D
}

struct SightingsProvider {
    func fetchSightings(of: String, around: CLLocationCoordinate2D) -> [Sighting] {
        return [Sighting(location: around)]
    }
}


func sightingToShow(for bird: Bird) -> Sighting? {
    let sightingsProvider = SightingsProvider()
    let lastCurrentLocation = CLLocationCoordinate2D(latitude: 37.3348655, longitude: 122.0089409)
    let sightings = sightingsProvider.fetchSightings(of: bird.speciesCode, around: lastCurrentLocation)
    let mostRecentSighting = sightings.first
    return mostRecentSighting
}


class SightingMapView: MKMapView {
    let sighting: Sighting
    
    init(sighting: Sighting) {
        self.sighting = sighting
        super.init(frame: .zero)
        
        self.centerCoordinate = sighting.location
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
