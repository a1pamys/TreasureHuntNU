//
//  TeamOne.swift
//  TreasureHunter
//
//  Created by Алпамыс on 26.01.18.
//  Copyright © 2018 Алпамыс. All rights reserved.
//

import UIKit
import CoreLocation

struct Data {
    
    var teamQuestionid: Int?
    var title: String?
    var descr: String?
    var lat: CLLocationDegrees?
    var lon: CLLocationDegrees?
    
    init(teamQuestionid: Int?, title: String?, descr: String?, lat: CLLocationDegrees?, lon: CLLocationDegrees?){
        self.teamQuestionid = teamQuestionid
        self.title = title
        self.descr = descr
        self.lat = lat
        self.lon = lon
    }
    
    static func retrieveData() -> [Data]{
        let data = [
            Data(teamQuestionid: 11, title: "7 block, 1 floor", descr: "Starting point", lat: 51.09065, lon: 71.398228),
            Data(teamQuestionid: 12, title: "Skywalk", descr: "Skywalk", lat: 51.090408, lon: 71.396492),
            Data(teamQuestionid: 13, title: "2 block, 1 floor", descr: "Near the glass", lat: 51.089877, lon: 71.399848),
            Data(teamQuestionid: 14, title: "6 block, 2 floor", descr: "Near the center", lat: 51.090042, lon: 71.397927),
            Data(teamQuestionid: 15, title: "7 block 2 floor", descr: "Center", lat: 51.090709, lon: 71.398228),
            Data(teamQuestionid: 21, title: "7 block, 1 floor", descr: "Starting point", lat: 51.09065, lon: 71.398228),
            Data(teamQuestionid: 22, title: "Skywalk", descr: "Skywalk", lat: 51.090408, lon: 71.396492),
            Data(teamQuestionid: 23, title: "3 block, 1 floor", descr: "Near the glass", lat: 51.090392, lon: 71.400084),
            Data(teamQuestionid: 24, title: "6 block, 2 floor", descr: "Near the center", lat: 51.090042, lon: 71.397927),
            Data(teamQuestionid: 25, title: "7 block 2 floor", descr: "Center", lat: 51.090709, lon: 71.398228),
            Data(teamQuestionid: 31, title: "7 block, 1 floor", descr: "Starting point", lat: 51.09065, lon: 71.398228),
            Data(teamQuestionid: 32, title: "Skywalk", descr: "Skywalk", lat: 51.090408, lon: 71.396492),
            Data(teamQuestionid: 33, title: "4 block 1 floor", descr: "Near the entry", lat: 51.090018, lon: 71.398785),
            Data(teamQuestionid: 34, title: "8 block 2 floor", descr: "Near the center", lat: 51.090092, lon: 71.397047),
            Data(teamQuestionid: 35, title: "7 block 2 floor", descr: "Center", lat: 51.090709, lon: 71.398228),
            Data(teamQuestionid: 41, title: "7 block, 1 floor", descr: "Starting point", lat: 51.09065, lon: 71.398228),
            Data(teamQuestionid: 42, title: "New Atrium", descr: "Down the round stairs", lat: 51.090640, lon: 71.396189),
            Data(teamQuestionid: 43, title: "5 block 1 floor", descr: "Near the entry", lat: 51.090487, lon: 71.399048),
            Data(teamQuestionid: 44, title: "8 block 2 floor", descr: "Near the center", lat: 51.090092, lon: 71.397047),
            Data(teamQuestionid: 45, title: "7 block 2 floor", descr: "Center", lat: 51.090709, lon: 71.398228),
            Data(teamQuestionid: 51, title: "7 block, 1 floor", descr: "Starting point", lat: 51.09065, lon: 71.398228),
            Data(teamQuestionid: 52, title: "New Atrium", descr: "Down the round stairs", lat: 51.090640, lon: 71.396189),
            Data(teamQuestionid: 53, title: "6 block 1 floor", descr: "Near the entry", lat: 51.090177, lon: 71.398040),
            Data(teamQuestionid: 54, title: "2 block 2 floor", descr: "Near the center", lat: 51.089755, lon: 71.399778),
            Data(teamQuestionid: 55, title: "7 block 2 floor", descr: "Center", lat: 51.090709, lon: 71.398228),
            Data(teamQuestionid: 61, title: "7 block, 1 floor", descr: "Starting point", lat: 51.09065, lon: 71.398228),
            Data(teamQuestionid: 62, title: "New Atrium", descr: "Down the round stairs", lat: 51.090640, lon: 71.396189),
            Data(teamQuestionid: 63, title: "7 block 1 floor", descr: "Near the entry", lat: 51.090635, lon: 71.398174),
            Data(teamQuestionid: 64, title: "3 block 2 floor", descr: "Near the center", lat: 51.090450, lon: 71.400041),
            Data(teamQuestionid: 65, title: "7 block 2 floor", descr: "Center", lat: 51.090709, lon: 71.398228),
            Data(teamQuestionid: 71, title: "7 block, 1 floor", descr: "Starting point", lat: 51.09065, lon: 71.398228),
            Data(teamQuestionid: 72, title: "C3", descr: "Near the glass", lat: 51.090399, lon: 71.396350),
            Data(teamQuestionid: 73, title: "8 block 1 floor", descr: "Near the entry", lat: 51.090284, lon: 71.397203),
            Data(teamQuestionid: 74, title: "2 block 2 floor", descr: "Near the center", lat: 51.089755, lon: 71.399778),
            Data(teamQuestionid: 75, title: "7 block 2 floor", descr: "Center", lat: 51.090709, lon: 71.398228),
            Data(teamQuestionid: 81, title: "7 block, 1 floor", descr: "Starting point", lat: 51.09065, lon: 71.398228),
            Data(teamQuestionid: 82, title: "C3", descr: "Near the glass", lat: 51.090399, lon: 71.396350),
            Data(teamQuestionid: 83, title: "9 block 1 floor", descr: "Near the entry", lat: 51.090746, lon: 71.397289),
            Data(teamQuestionid: 84, title: "3 block 2 floor", descr: "Near the center", lat: 51.090450, lon: 71.400041),
            Data(teamQuestionid: 85, title: "7 block 2 floor", descr: "Center", lat: 51.090709, lon: 71.398228)
        ]
        return data
    }
        
}
