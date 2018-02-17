//
//  TeamIDViewController.swift
//  TreasureHunter
//
//  Created by Алпамыс on 26.01.18.
//  Copyright © 2018 Алпамыс. All rights reserved.
//

import UIKit
import EasyPeasy

class TeamIDViewController: UIViewController {
    
    var teamIdView = TeamIdView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TREASURE HUNT"
        setupTeamIdView()
    }
    
    func setupTeamIdView() {
        teamIdView.teamIdDelegate = self
        teamIdView.alertDelegate = self
        view.backgroundColor = UIColor.darkerAcmColor
        view.addSubview(teamIdView)
        teamIdView <- [Left(0), Right(0), Top(0), Bottom(0)]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TeamIDViewController: TeamIdSuitable {
    func submitTeadId() {
        let mapVC = MapViewController()
        navigationController?.pushViewController(mapVC, animated: true)
    }
}

extension TeamIDViewController: AlertCreatable {
    func createAlert(title: String, message: String, actionTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
//            if(actionTitle == "Let's go!"){
//                self.submitTeadId()
//            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
}


