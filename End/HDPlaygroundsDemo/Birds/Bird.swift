//
//  Bird.swift
//  HDPlaygroundsDemo
//
//  Created by denglibing on 2023/7/13.
//

import Foundation
import UIKit

@objc class Bird: NSObject {
    enum Family {
        case owls
        case crow
    }
    
    @objc var commonName: String = ""
    var scientificName: String = ""
    var speciesCode: String = ""
    
    @objc var photo: UIImage? = nil
    var family: Family? = nil
    
    init(commonName: String, scientificName: String, speciesCode: String, photo: UIImage?, family: Family?) {
        self.commonName = commonName
        self.scientificName = scientificName
        self.speciesCode = speciesCode
        self.photo = photo
        self.family = family
    }
}



extension Bird {
    public override var description: String {
        return "\(commonName) (\(scientificName))"
    }
}

extension Bird: CustomPlaygroundDisplayConvertible {
    public var playgroundDescription: Any {
        return photo as Any
    }
}
