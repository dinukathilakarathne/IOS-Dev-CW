//
//  Result.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/14/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import Foundation

struct Result {
    private let name : String!
    private let date : Date!
    private let score : Int!
    
    private static var allResults : [Result] = []
    
    init(_ name : String, _ date : Date, _ score : Int) {
        self.name = name
        self.date = date
        self.score = score
    }
    
    static func getRestults() -> [Result] {
        return self.allResults
    }
    
    static func addResult(_ result : Result){
        self.allResults.append(result)
    }
    
    static func getResultCount() -> Int {
        return self.allResults.count
    }
    
    func getScoreMessage() -> String{
        if score < 6{
            return "Moderate threat"
        }else if score < 4{
            return "Normal"
        }else if score < 2{
            return "Safe"
        }else{
            return "Threat"
        }
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getDate() -> String {
        return self.date.getStringDate()
    }
    
    func getScore() -> Int {
        return self.score
    }
    
    static func clearResults(){
        allResults.removeAll()
    }
    
}
