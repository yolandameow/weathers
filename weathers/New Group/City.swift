//
//  City.swift
//  weathers
//
//  Created by Heqi on 2018-03-21.
//  Copyright © 2018 utoronto. All rights reserved.
//

import Foundation
import ObjectMapper

class City:Mappable {
    
    var city: String?
    var woeid: Int?
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        city <- map["title"]
        woeid <- map["woeid"]
        
    }
}
