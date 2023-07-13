//
//  MapViewController.swift
//  HDPlaygroundsDemo
//
//  Created by denglibing on 2023/7/13.
//

import UIKit
import CoreLocation

class MapViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let appleparkLocation = CLLocationCoordinate2D(latitude: 37.3348655, longitude: 122.0089409)
        let sightingsProvider = SightingsProvider()
        let sightings = sightingsProvider.fetchSightings(of: "bird.speciesCode", around: appleparkLocation)

        if let mostRecentSighting = sightings.first {
            let sightingMapView = SightingMapView(sighting: mostRecentSighting)
            sightingMapView.frame = view.bounds
            view.addSubview(sightingMapView)
        }
    }
}
