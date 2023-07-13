//
//  BirdProvider.swift
//  HDPlaygroundsDemo
//
//  Created by denglibing on 2023/7/12.
//

import Foundation
import CoreLocation
import UIKit

class BirdProvider {
    enum Region {
        case northAmerica
        case northChina
    }
    
    var birds: [Bird] = [Bird]()
    var region: Region
    
    init(region: Region) {
        self.region = region
        
        for _ in 0..<15 {
            let random = arc4random() % 1000
            let brandom = random % 2 == 0
            let brandom2 = random % 3 == 0
            let image = brandom ? UIImage(named: "on_demo") : nil
            let bird = Bird(commonName: "birdName_\(random)", scientificName: "scientificName_\(random)", speciesCode: "\(random)", photo: image, family: brandom2 ? .owls : .crow)
            birds.append(bird)
        }
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


