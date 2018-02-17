//
//  File.swift
//  TreasureHunter
//
//  Created by Алпамыс on 25.01.18.
//  Copyright © 2018 Алпамыс. All rights reserved.
//

import UIKit
import EasyPeasy
import Firebase

protocol ControllerPoppable {
    func popController()
}

protocol ViewRemovable {
    func removeView()
}

class FirstQuestionView: UIView {
    
    var answer = "Party"
    var popDelegate: ControllerPoppable?
    var alertDelegate: AlertCreatable?
    var removeViewDelegate: ViewRemovable?
    
    var questionNumberLabel: UILabel = {
        var label = UILabel()
        label.text = "Question 1"
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next Medium", size: 20)
        return label
    }()
    
    var questionLabel: UILabel = {
        var label = UILabel()
        label.text = "Q1"
        label.font = UIFont(name: "Avenir Next Medium", size: 20)
        label.numberOfLines = 10
        label.textAlignment = .center
        return label
    }()
    
    var submitButton: UIButton = {
        var button = UIButton()
        button.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 49/255, green: 79/255, blue: 79/255, alpha: 1.0)
        button.layer.cornerRadius = 4
        button.setTitle("Check!", for: .normal)
        button.setTitleColor(.acmColor, for: .highlighted)
        return button
    }()
    
    lazy var nextQuestionButton: UIButton = {
        var button = UIButton()
        button.addTarget(self, action: #selector(nextQuestionButtonPressed), for: .touchUpInside)
        button.backgroundColor = UIColor.orange
        button.layer.cornerRadius = 4
        button.setTitle("Quest #2!", for: .normal)
        button.setTitleColor(.acmColor, for: .highlighted)
        return button
    }()

    var answerTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Enter your answer"
        textField.textColor = .black
        textField.borderStyle = .roundedRect
        textField.tag = 1
        return textField
    }()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 135/255, green: 206/255, blue: 250/255, alpha: 1.0)
        setupViews()
        setupConstraints()
        getQuestions()
        answerTextField.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    @objc func dismissVC(){
//        popDelegate?.popController()
//    }
    
    func setupViews() {
        addSubview(questionNumberLabel)
        addSubview(questionLabel)
        addSubview(submitButton)
        addSubview(answerTextField)
    }
    
    func setupConstraints() {
        questionNumberLabel <- [Top(64), Left(32), Right(32), Height(40)]
        questionLabel <- [Top(32).to(questionNumberLabel), Left(32), Right(32), Height(200)]
        answerTextField <- [Bottom(144), Left(32), Right(32), Height(30)]
        submitButton <- [Bottom(64), Left(32), Right(32), Height(48)]
    }
    
    func getQuestions() {
        questionLabel.text = "Convert from binary to word\n1) 01010000\n2) 01100001\n3) 01110010\n4) 01110100\n5) 01111001\n"
        answer = "Party"
        
//        questionLabel.text = questionAnswer.questions[0]
//        answer = questionAnswer.answers[0]
    }
    
    @objc func submitButtonPressed(){
        if answerTextField.text! == answer {
            alertDelegate?.createAlert(title: "Congratulations!", message: "Your answer is correct!", actionTitle: "Ok")
            let time = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: DateFormatter.Style.none, timeStyle: DateFormatter.Style.short)
//            ref.child("teams").child("team-\(teamId)q\(questId)").setValue("\(time)")
            questId += 1
            showHideButtons()
        } else {
            alertDelegate?.createAlert(title: "Wrong Answer", message: "Try Again", actionTitle: "Ok")
        }
    }
    
    func showHideButtons() {
        submitButton.removeFromSuperview()
        addSubview(nextQuestionButton)
        nextQuestionButton <- [Bottom(64), Left(32), Right(32), Height(48)]
    }
    
    @objc func nextQuestionButtonPressed() {
        removeViewDelegate?.removeView()
    }
    
    
}

extension FirstQuestionView: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }
    
}











