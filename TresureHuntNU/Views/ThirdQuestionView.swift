//
//  ThirdQuestionView.swift
//  TreasureHunter
//
//  Created by Алпамыс on 27.01.18.
//  Copyright © 2018 Алпамыс. All rights reserved.
//

import UIKit
import EasyPeasy

class ThirdQuestionView: UIView {
    
    var answer = "be simple"
    var removeViewDelegate: ViewRemovable?
    var alertDelegate: AlertCreatable?
    
    var questionLabel: UILabel = {
        var label = UILabel()
        label.text = "Q3. Find..."
        label.font = UIFont(name: "Avenir Next Medium", size: 20)
        label.numberOfLines = 10
        label.textAlignment = .center
        return label
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
        button.backgroundColor = UIColor(red: 88/255, green: 43/255, blue: 43/255, alpha: 1.0)
        button.layer.cornerRadius = 4
        button.setTitle("Check!", for: .normal)
        button.setTitleColor(.acmColor, for: .highlighted)
        return button
    }()
    
    lazy var nextQuestionButton: UIButton = {
        var button = UIButton()
        button.addTarget(self, action: #selector(nextQuestionButtonPressed), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 60/255, green: 179/255, blue: 113/255, alpha: 1.0)
        button.layer.cornerRadius = 4
        button.setTitle("Quest #4!", for: .normal)
        button.setTitleColor(.acmColor, for: .highlighted)
        return button
    }()
    
    @objc func submitButtonPressed(){
        if answerTextField.text!.lowercased() == answer.lowercased() {
            alertDelegate?.createAlert(title: "Congratulations!", message: "Your answer is correct!", actionTitle: "Ok")
            questionLabel.font = UIFont(name: "Avenir Next Medium", size: 20)
            questionLabel.text = "DO NOT FORGET TO PICK UP A HINT FOR THE FOLLOWING TASKS IN THIS LOCATION!"
            questionLabel.backgroundColor = UIColor.clear

            questionLabel.textColor = UIColor.white
            backgroundColor = UIColor.red
            let time = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: DateFormatter.Style.none, timeStyle: DateFormatter.Style.short)
//            ref.child("teams").child("team-\(teamId)q\(questId)").setValue("\(time)")
            questId += 1
            showHideButtons()
        } else {
            alertDelegate?.createAlert(title: "Wrong Answer", message: "Try Again", actionTitle: "Ok")
        }
    }
    
    func setupViews() {
        addSubview(submitButton)
        addSubview(answerTextField)
    }
    
    func setupConstraints() {
        answerTextField <- [Bottom(144), Left(32), Right(32), Height(30)]
        submitButton <- [Bottom(64), Left(32), Right(32), Height(48)]
    }
    
    func showHideButtons() {
        submitButton.removeFromSuperview()
        addSubview(nextQuestionButton)
        nextQuestionButton <- [Bottom(64), Left(32), Right(32), Height(48)]
    }
    
    @objc func nextQuestionButtonPressed() {
        removeViewDelegate?.removeView()
    }
    
    @objc func tempBut(){
        questId += 1
        removeViewDelegate?.removeView()
        if answerTextField.text! == answer {
            alertDelegate?.createAlert(title: "Now they always say congratulations!", message: "Post Malone (c)", actionTitle: "Ok")
            showHideButtons()
        } else {
            alertDelegate?.createAlert(title: "Wrong Answer", message: "Try Again", actionTitle: "Ok")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        backgroundColor = UIColor.orange
        addSubview(answerTextField)
        addSubview(submitButton)
        addSubview(questionLabel)
        questionLabel <- [Top(128), Left(32), Right(32), Height(200)]
        answerTextField <- [Bottom(144), Left(32), Right(32), Height(30)]
        submitButton <- [Bottom(64), Left(32), Right(32), Height(48)]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
