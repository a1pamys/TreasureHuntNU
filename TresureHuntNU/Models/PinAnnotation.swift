//
//  PinAnnotation.swift
//  TreasureHunter
//
//  Created by Алпамыс on 24.01.18.
//  Copyright © 2018 Алпамыс. All rights reserved.
//

import MapKit

class PinAnnotation: NSObject, MKAnnotation {
    
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D

    init(title: String?, subtitle: String?, coordinate: CLLocationCoordinate2D){
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
    
}
