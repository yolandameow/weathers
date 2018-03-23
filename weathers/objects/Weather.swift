//
//  Weather.swift
//  weathers
//
//  Created by Heqi on 2018-03-22.
//  Copyright © 2018 utoronto. All rights reserved.
//

import Foundation
import ObjectMapper
class Weather:Mappable{
    
    var id:String?
    var weather_state_name:String?
    var weather_state_abbr:String?
    var applicable_date:String?
    var the_temp:String?
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        weather_state_name <- map["weather_state_name"]
        weather_state_abbr <- map["weather_state_abbr"]
        applicable_date <- map["applicable_date"]
        the_temp <- map["the_temp"]
        
        
    }
    
}
