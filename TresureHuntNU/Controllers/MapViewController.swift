//
//  ViewController.swift
//  TreasureHunter
//
//  Created by Алпамыс on 24.01.18.
//  Copyright © 2018 Алпамыс. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import EasyPeasy

var scanned = false

class MapViewController: UIViewController {
    
    var mapView: MapView?
    lazy var firstQuest = FirstQuestionView()
    var secondQuest: SecondQuestionView?
    lazy var thirdQuest = ThirdQuestionView()
    lazy var fourthQuest = FourthQuestionView()
    lazy var fifthQuest = FifthQuestionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        title = "TREASURE HUNT"
        setupMapView()
        firstQuest.removeViewDelegate = self
        firstQuest.alertDelegate = self
        
        thirdQuest.removeViewDelegate = self
        thirdQuest.alertDelegate = self
        fourthQuest.removeViewDelegate = self
        fourthQuest.alertDelegate = self
        fifthQuest.removeViewDelegate = self
        fifthQuest.alertDelegate = self
    }
    
    func setupMapView() {
        mapView = MapView()
        mapView?.delegate = self
        view.addSubview(mapView!)
        mapView! <- [ Left(0), Right(0), Top(0), Bottom(0)]
    }
    
}

extension MapViewController: QuestionShowable {
    func calloutPressed() {
        if(questId == 1) {
            view.addSubview(firstQuest)
            firstQuest <- [Top(0), Left(0), Right(0), Bottom(0)]
        } else if(questId == 2){
            secondQuest = SecondQuestionView()
            secondQuest?.removeViewDelegate = self
            secondQuest?.alertDelegate = self
            secondQuest?.qrScannerDelegate = self
            view.addSubview(secondQuest!)
            secondQuest! <- [Top(0), Left(0), Right(0), Bottom(0)]
        } else if(questId == 3){
            view.addSubview(thirdQuest)
            thirdQuest <- [Top(0), Left(0), Right(0), Bottom(0)]
        } else if(questId == 4){
            view.addSubview(fourthQuest)
            fourthQuest <- [Top(0), Left(0), Right(0), Bottom(0)]
        } else {
            view.addSubview(fifthQuest)
            fifthQuest <- [Top(0), Left(0), Right(0), Bottom(0)]
        }
        //        let detailsVC = DetailsViewController()
        //        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension MapViewController: ViewRemovable {
    func removeView() {
        firstQuest.removeFromSuperview()
        mapView?.removeFromSuperview()
        mapView = nil
        setupMapView()
    }
}

extension MapViewController: AlertCreatable {
    func createAlert(title: String, message: String, actionTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension MapViewController: QRCodeScannable {
    func showQRScanner() {
        let vc = QRViewController()
            vc.scannerDelegate = self
            navigationController?.pushViewController(vc, animated: true)
    }
}

extension MapViewController: AnswerSendable {
    func sendAnswer() {
        secondQuest?.removeFromSuperview()
        secondQuest = nil
        secondQuest = SecondQuestionView()
        secondQuest?.removeViewDelegate = self
        secondQuest?.alertDelegate = self
        secondQuest?.qrScannerDelegate = self
        view.addSubview(secondQuest!)
        secondQuest! <- [Top(0), Left(0), Right(0), Bottom(0)]
        
    }
}
