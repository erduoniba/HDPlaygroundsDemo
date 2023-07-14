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

// 使得在 Playground 中展示Bird对象有如下的描述
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
