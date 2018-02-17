//
//  TeamIdView.swift
//  TreasureHunter
//
//  Created by Алпамыс on 26.01.18.
//  Copyright © 2018 Алпамыс. All rights reserved.
//

import UIKit
import EasyPeasy
import Firebase

var teamId = 998;
var questId = 1;
var date = Date()
var calendar = Calendar.current
//var ref = Database.database().reference()


protocol TeamIdSuitable {
    func submitTeadId()
}

protocol AlertCreatable {
    func createAlert(title: String, message: String, actionTitle: String)
}

class TeamIdView: UIView {
    
    var databaseHandler: DatabaseHandle?
    var teamIdDelegate: TeamIdSuitable?
    var alertDelegate: AlertCreatable?
    
    lazy var instructionLabel: UILabel = {
        var label = UILabel()
        label.text = "ENTER YOUR TEAM NUMBER"
        label.font = UIFont(name: "Avenir Next Medium", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var teamIdTextField: UITextField = {
        var tf = UITextField()
        tf.textColor = .black
        tf.keyboardType = UIKeyboardType.numberPad
        tf.borderStyle = .roundedRect
//        tf.delegate = self
        tf.inputAccessoryView = accessoryView()
        tf.inputAccessoryView?.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 44)
        return tf
    }()
    
    func accessoryView() -> UIView {
        
        let view = UIView()
        view.backgroundColor = UIColor(displayP3Red: 197/255.0, green: 213/255.0, blue: 224/255.0, alpha: 1.0)
        let doneButton: UIButton = {
            let button = UIButton()
            button.frame = CGRect(x: 0, y: 0, width: 60, height: 44)
            button.backgroundColor = UIColor.clear
            button.setTitle("Done", for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.addTarget(self, action: #selector(submitButtonDidPressed), for: .touchUpInside)
            return button
        }()
        
        let cancelButton: UIButton = {
            let button = UIButton()
            button.frame = CGRect(x: 0, y: 0, width: 60, height: 44)
            button.backgroundColor = UIColor.clear
            button.setTitle("Cancel", for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
            return button
        }()
        
        view.addSubview(doneButton)
        view.addSubview(cancelButton)
        doneButton <- [Right(8), Bottom(0), Width(64), Height(44)]
        cancelButton <- [Left(8), Bottom(0), Width(64), Height(44)]
        
        return view
    }
    
    lazy var tapGestureRecognizer: UIGestureRecognizer = {
        var gr = UIGestureRecognizer()
        gr.addTarget(self, action: #selector(dismissKeyboard))
        return gr
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.darkerAcmColor
        setupViews()
    }
    
    @objc func cancelButtonPressed() {
        teamIdTextField.resignFirstResponder()
    }
    
    @objc func submitButtonDidPressed() {
        if(teamIdTextField.text != "" && Int(teamIdTextField.text!)! > 0 && Int(teamIdTextField.text!)! <= 9) {
            teamId = Int(teamIdTextField.text!)!
            let time = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: DateFormatter.Style.none, timeStyle: DateFormatter.Style.short)
//            ref.child("teams").child("team-\(teamId)").setValue("\(time)")
//            alertDelegate?.createAlert(title: "Team #\(teamId)", message: "May the force be with you" , actionTitle: "Let's go!")
            teamIdDelegate?.submitTeadId()
        } else {
            alertDelegate?.createAlert(title: "Error 404", message: "Invalid team Number. Please try again", actionTitle: "Ok")
        }
    }
        
    @objc func dismissKeyboard() {
        endEditing(true)
    }
    
    func setupViews() {
        addSubview(teamIdTextField)
        addSubview(instructionLabel)
        addGestureRecognizer(tapGestureRecognizer)
        instructionLabel <- [CenterX(0), CenterY(0), Left(0), Right(0), Height(48)]
        teamIdTextField <- [Top(16).to(instructionLabel), CenterX(0), Left(120), Right(120), Height(30)]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TeamIdView: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }

}

