//
//  Location.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/13/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import Foundation

class Location{
    static var coordinates : [[Double]] = []
    
    static func setCoordinates(coordinates : [Double]){
        self.coordinates.append(coordinates)
    }
    
    static func getCoordinates() -> [[Double]]{
        return self.coordinates
    }
    
    static func getNumberOfCoordinates() -> Int {
        return self.coordinates.count
    }
}
