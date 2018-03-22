//
//  ViewController.swift
//  weathers
//
//  Created by Heqi on 2018-03-21.
//  Copyright © 2018 utoronto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var service: Service!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        service=Service()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchBtn(_ sender: Any) {
        service.getEoid(cityName: "london")
//        service.getWeather(eoid: "44418")
    }


}

