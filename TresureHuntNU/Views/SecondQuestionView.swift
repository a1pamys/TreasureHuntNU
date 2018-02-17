//
//  SecondQuestion.swift
//  TreasureHunter
//
//  Created by Алпамыс on 26.01.18.
//  Copyright © 2018 Алпамыс. All rights reserved.
//

import UIKit
import EasyPeasy

protocol QRCodeScannable {
    func showQRScanner()
}

class SecondQuestionView: UIView {
    
    var answer = "2255063"
    var removeViewDelegate: ViewRemovable?
    var alertDelegate: AlertCreatable?
    var qrScannerDelegate: QRCodeScannable?
    
    lazy var nokiaView: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "pic")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var answerTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Enter your answer"
        textField.textColor = .black
        textField.borderStyle = .roundedRect
        textField.tag = 1
        return textField
    }()
    
    var submitButton: UIButton = {
        var button = UIButton()
        button.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
        button.backgroundColor = .darkerAcmColor
        button.layer.cornerRadius = 4
        button.setTitle("Scan a QR-Code", for: .normal)
        button.setTitleColor(.acmColor, for: .highlighted)
        return button
    }()
    
    var submit2Button: UIButton = {
        var button = UIButton()
        button.addTarget(self, action: #selector(submit2ButtonPressed), for: .touchUpInside)
        button.backgroundColor = .darkerAcmColor
        button.layer.cornerRadius = 4
        button.setTitle("Check!", for: .normal)
        button.setTitleColor(.acmColor, for: .highlighted)
        return button
    }()
    
    lazy var nextQuestionButton: UIButton = {
        var button = UIButton()
        button.addTarget(self, action: #selector(nextQuestionButtonPressed), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 134/255, green: 76/255, blue: 191/255, alpha: 1.0)
        button.layer.cornerRadius = 4
        button.setTitle("Quest #3!", for: .normal)
        button.setTitleColor(.acmColor, for: .highlighted)
        return button
    }()
    
    @objc func submitButtonPressed(){
            qrScannerDelegate?.showQRScanner()
    }
    
    @objc func submit2ButtonPressed() {
        if answerTextField.text! == answer {
            alertDelegate?.createAlert(title: "Congratulations!", message: "Your answer is correct!", actionTitle: "Ok")
            let time = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: DateFormatter.Style.none, timeStyle: DateFormatter.Style.short)
//            ref.child("teams").child("team-\(teamId)q\(questId)").setValue("\(time)")
            questId += 1
            showHide2Buttons()
        } else {
            alertDelegate?.createAlert(title: "Wrong Answer", message: "Try Again", actionTitle: "Ok")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        backgroundColor = UIColor(red: 240/255, green: 248/255, blue: 255/255, alpha: 1.0)
        if(!scanned) {
        addSubview(submitButton)
        submitButton <- [CenterX(0), CenterY(0), Height(64), Width(192)]
        } else {
            showHideButtons()
        }
    }
    
    func showHide2Buttons() {
        submitButton.removeFromSuperview()
        answerTextField.removeFromSuperview()
        nokiaView.removeFromSuperview()
        addSubview(nextQuestionButton)
        nextQuestionButton <- [Bottom(64), Left(32), Right(32), Height(48)]
    }
    
    func showHideButtons() {
        submitButton.removeFromSuperview()
//        ref.child("teams").child("team-\(teamId)").setValue("Quest-\(questId) -> \(time)")
        addSubview(submit2Button)
        addSubview(nokiaView)
        addSubview(answerTextField)
        submit2Button <- [Bottom(64), Left(32), Right(32), Height(48)]
        answerTextField <- [Left(32),Right(32),Bottom(32).to(submit2Button), Height(30)]
        nokiaView <- [Top(64), Bottom(32).to(answerTextField),Left(64),Right(64) ]
    }
    
    @objc func nextQuestionButtonPressed() {
        removeViewDelegate?.removeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

