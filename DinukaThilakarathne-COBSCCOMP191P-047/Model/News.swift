//
//  Notification.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/12/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import Foundation


class News {
    
    private static var news : [[String]] = []
    
    static func getNewsCount() -> Int {
        return news.count
    }
    
    func setNews(not : [String]){
        News.news.append(not)
    }
    
    static func getNews() -> [[String]]{
        return news
    }
    
    static func clearNews(){
        news.removeAll()
    }
}
