//
//  Map.swift
//  TreasureHunter
//
//  Created by Алпамыс on 25.01.18.
//  Copyright © 2018 Алпамыс. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import EasyPeasy

protocol QuestionShowable {
    func calloutPressed()
}

class MapView: UIView, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var pin: PinAnnotation?
    var data = [Data]()
    var mapView = MKMapView()
    let manager = CLLocationManager()
    var remove = true
//    var pins = PinAnnotation.getPinAnnotations()
//    var pin = PinAnnotation(title: "Nazarbayev University", subtitle: "where dreams come true", coordinate: CLLocationCoordinate2DMake(51.0905, 71.3982))
    
    var delegate: QuestionShowable?
    var firstQV = FirstQuestionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        data = Data.retrieveData()
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(51.0905, 71.3982),120,120), animated: true)
        setupMapView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupMapView() {
        mapView.delegate = self
        addSubview(mapView)
        mapView <- [ Left(0), Right(0), Top(0), Bottom(0)]
        setupPins()
//        mapView.addAnnotation(pins[0])
//        mapView.addAnnotation(pins[1])
    }
    
    func setupPins() {
        if let pin = pin {
            mapView.removeAnnotation(pin)
        }
        for info in data {
            if(info.teamQuestionid! == teamId*10 + questId ) {
                let title = info.title
                let subtitle = info.descr
                let lat = info.lat!
                let lon = info.lon!
                pin = PinAnnotation(title: title, subtitle: subtitle, coordinate: CLLocationCoordinate2DMake(lat, lon))
                let span = MKCoordinateSpanMake(0.001, 0.001)
                let region = MKCoordinateRegion(center: CLLocationCoordinate2DMake(lat, lon), span: span)
                mapView.setRegion(region, animated: true)
                mapView.addAnnotation(pin!)
                break
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var view = mapView.dequeueReusableAnnotationView(withIdentifier: "AnnotationView Id")
        
        if view == nil{
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationView Id")
            view!.canShowCallout = true
        } else {
            view!.annotation = annotation
        }
        //is this right?
        view?.rightCalloutAccessoryView = UIButton(type: UIButtonType.detailDisclosure)
        view?.rightCalloutAccessoryView?.layer.borderColor = UIColor(red:222/255.0, green:225/255.0, blue:227/255.0, alpha: 1.0).cgColor
        
        return view
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let annotation = view.annotation as? MKAnnotation
        let title = (annotation?.title)!
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        delegate?.calloutPressed()
    }
}

