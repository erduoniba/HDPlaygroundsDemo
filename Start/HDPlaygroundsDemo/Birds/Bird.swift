//
//  Bird.swift
//  HDPlaygroundsDemo
//
//  Created by denglibing on 2023/7/13.
//

import Foundation
import UIKit

struct Bird {
    enum Family {
        case owls
        case crow
    }
    
    let commonName: String
    let scientificName: String
    let speciesCode: String
    
    let photo: UIImage?
    let family: Family
}
