//
//  CurrentWeather.swift
//  rainyshinycloudy
//
//  Created by Jeffrey Eng on 1/24/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    // MARK: Private Variables
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    // MARK: Getters
    // Best practice - Using data encapsulation here to prevent outside classes from manipulating data.
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: DownloadComplete) {
        //Download Current Weather Data using GET request
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            let result = response.result
            print(response)
        }
        completed()
    }
}
