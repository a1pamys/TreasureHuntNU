//
//  DetailsViewController.swift
//  TreasureHunter
//
//  Created by Алпамыс on 24.01.18.
//  Copyright © 2018 Алпамыс. All rights reserved.
//

import UIKit
import EasyPeasy

class DetailsViewController: UIViewController {

    var firstQuestionView = FirstQuestionView()
    var secondQuestionView = SecondQuestionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestion()
        firstQuestionView.popDelegate = self
        firstQuestionView.alertDelegate = self
//        secondQuestionView.qrScannerDelegate = self
//        navigationItem.hidesBackButton = true
    }
    
    func setupQuestion() {
        view.addSubview(firstQuestionView)
        firstQuestionView <- [ Top(0), Bottom(0), Left(0), Right(0)]
    }
}

extension DetailsViewController: ControllerPoppable {
    func popController() {
        navigationController?.popViewController(animated: true)
    }
}

extension DetailsViewController: AlertCreatable {
    func createAlert(title: String, message: String, actionTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
