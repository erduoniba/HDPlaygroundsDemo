//
//  BirdProvider.swift
//  HDPlaygroundsDemo
//
//  Created by denglibing on 2023/7/12.
//

import Foundation
import CoreLocation
import UIKit

enum Area {
    case northAmerica
    case northChina
}

enum Family {
    case owls
    case crow
}



struct Bird {
    struct Photo {
        let family: Family
    }
    
    let commonName: String
    let scientificName: String
    let speciesCode: String
    
    let photo: UIImage?
    let family: Family
}

extension Bird: CustomStringConvertible {
    public var description: String {
        return "\(commonName) (\(scientificName))"
    }
}

extension Bird: CustomPlaygroundDisplayConvertible {
    public var playgroundDescription: Any {
        return photo as Any
    }
}


class BirdProvider {
    var birds: [Bird] = [Bird]()
    var region: Area
    init(region: Area) {
        self.region = region
    }
}



var birdsToShow: [Bird] {
    let birdProvider = BirdProvider(region: .northAmerica)
    let birdsToFind = birdProvider.birds.filter { $0.photo == nil }
    let owlsToFind = birdsToFind.filter { $0.family == .owls }
    return owlsToFind
}


//let checklist = ChecklistView()
//for bird in owlsToFind {
//    checklist.add(bird)
//}


struct Sighting {
    
}

struct SightingsProvider {
    func fetchSightings(of: String, around: CLLocationCoordinate2D) -> [Sighting] {
        return [Sighting()]
    }
}


func sightingToShow(for bird: Bird) -> Sighting? {
    let sightingsProvider = SightingsProvider()
    let lastCurrentLocation = CLLocationCoordinate2D(latitude: 37.3348655, longitude: 122.0089409)
    let sightings = sightingsProvider.fetchSightings(of: bird.speciesCode, around: lastCurrentLocation)
    let mostRecentSighting = sightings.first
    return mostRecentSighting
}
