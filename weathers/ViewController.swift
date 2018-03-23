//
//  ViewController.swift
//  weathers
//
//  Created by Heqi on 2018-03-21.
//  Copyright © 2018 utoronto. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var historyBtn5: UIButton!
    @IBOutlet weak var historyBtn4: UIButton!
    @IBOutlet weak var historyBtn3: UIButton!
    @IBOutlet weak var historyBtn2: UIButton!
    @IBOutlet weak var historyBtn1: UIButton!
    @IBOutlet weak var weatherImgView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    private var service: Service!
    var cityId:String!
    var historyList=["London","Boston","Toronto","New York", "Beijing"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service=Service()
        
        
    }
    
    func populateLabels(){
        self.historyBtn1.setTitle(historyList[4],for:.normal)
        self.historyBtn2.setTitle(historyList[3],for:.normal)
        self.historyBtn3.setTitle(historyList[2],for:.normal)
        self.historyBtn4.setTitle(historyList[1],for:.normal)
        self.historyBtn5.setTitle(historyList[0],for:.normal)
    }
    
   @IBAction func searchByHistory(_ sender: UIButton) {
    print(sender.currentTitle)
   }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchWeather(cityName:String!){
        service.getEoid(cityName: cityName,completed: {
            cities in
            for city in cities!{
                self.cityNameLabel.text=city.city
                self.cityId =  "\(city.woeid ?? 0)"
                self.service.getWeather(eoid: self.cityId,completed: {
                    weathers in
                    for weather in weathers!
                    {
                        self.weatherLabel.text=weather.weather_state_name
                        let abbr=weather.weather_state_abbr
                        let image = UIImage(named:abbr!)
                        self.weatherImgView.image=image
                        
                        break
                    }
                })
                break
            }
        })
    }
    @IBAction func searchBtn(_ sender: Any) {
        
        let cityName = self.searchBar.text
        
        service.getEoid(cityName: cityName,completed: {
            cities in
            for city in cities!{
                self.cityNameLabel.text=city.city
                self.cityId =  "\(city.woeid ?? 0)"
                self.service.getWeather(eoid: self.cityId,completed: {
                    weathers in
                    for weather in weathers!
                    {
                        self.weatherLabel.text=weather.weather_state_name
                        let abbr=weather.weather_state_abbr
                        let image = UIImage(named:abbr!)
                        self.weatherImgView.image=image
                        
                        break
                    }
                })
                break
            }
        })
        
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchBarSearchButtonClicked")
        print(searchBar.text)
        searchBar.endEditing(true)
        let city=searchBar.text
        searchWeather(cityName:city)
        
        rotateHistory(search:city)
        populateLabels()
    }
    
    func rotateHistory(search:String!){
        for i in 0...3
        {
            historyList[i]=historyList[i+1]
        }
        historyList[4]=search
    }
    
    
    
}

