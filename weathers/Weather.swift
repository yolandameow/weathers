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
    
    var forecasts:[Forecast]?
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        forecasts <- map["consolidated_weather"]
    }
    
}
