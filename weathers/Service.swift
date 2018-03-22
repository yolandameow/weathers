//
//  service.swift
//  weathers
//
//  Created by Heqi on 2018-03-21.
//  Copyright © 2018 utoronto. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

public enum WeatherAbbr: String {
    case options = "OPTIONS"
    case sl     = "Sleet"
    case sn    = "Snow"
    case h    = "Hail"
    case t     = "Thunderstorm"
    case hr   = "Heavy Rain"
    case lr  = "Light Rain"
    case s   = "Showers"
    case hc = "Heavy Cloud"
    case lc = "Light Cloud"
    case c = "Clear"
}

class Service {
    
    var WOE_ID="woeid"

    
    var api:String = "https://www.metaweather.com/api/"
    var request : NSMutableURLRequest = NSMutableURLRequest()
    
    func getWeather(eoid:String!){
        let url = api+"location/"+eoid
        let method=HTTPMethod.get
        Alamofire.request(url, method:.get).responseArray{ (response: DataResponse<[Weather]>) in
            switch response.result {
            case .success:
                print(response.result.value)
            case .failure(let error):
                print(0,"Error")
                print(error)
            }
            if let weather = response.result.value{
                for weather in weather{
                    print(weather.forecasts)
                }
            }
        }
    }
    
    func getEoid(cityName:String!) -> String
    {
        let url = api+"location/search/?query="+cityName
        let method=HTTPMethod.get
        Alamofire.request(url, method:.get).responseArray{ (response: DataResponse<[City]>) in
            switch response.result {
            case .success:
                print(response.result.value)
            case .failure(let error):
                print(0,"Error")
                print(error)
            }
            if let cities = response.result.value{
                for city in cities{
                    print(city.city)
                }
            }
        }
        return ""
        
    }
    
    func invoke(url:String!, restMethod:HTTPMethod!)
    {
        Alamofire.request(url, method:restMethod).responseArray{ (response: DataResponse<[City]>) in
            switch response.result {
            case .success:
                print(response.result.value)
            case .failure(let error):
                print(0,"Error")
                print(error)
            }
            if let cities = response.result.value{
                for city in cities{
                    print(city.city)
                }
            }
           

        }
        
       
    }
    
}
