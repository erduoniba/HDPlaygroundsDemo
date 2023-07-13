import UIKit
import CoreLocation
import PlaygroundSupport

let birdProvider = BirdProvider(region: .northAmerica)
let birdsToFind = birdProvider.birds.filter { $0.photo == nil }
let owlsToFind = birdsToFind.filter { $0.family == .owls }


let checklist = ChecklistView(frame: CGRect(x: 0, y: 0, width: 300, height: 600))
for bird in owlsToFind {
    checklist.add(bird)
}

if let bird = owlsToFind.first {
    let appleparkLocation = CLLocationCoordinate2D(latitude: 37.3348655, longitude: -122.0089409)

    let sightingsProvider = SightingsProvider()
    let sightings = sightingsProvider.fetchSightings(of: bird.speciesCode, around: appleparkLocation)
    
    if let mostRecentSighting = sightings.first {
        let sightingMapView = SightingMapView(sighting: mostRecentSighting)
        sightingMapView.frame = CGRect(x: 0, y: 0, width: 400, height: 600)
        PlaygroundPage.current.liveView = sightingMapView
    }
}
