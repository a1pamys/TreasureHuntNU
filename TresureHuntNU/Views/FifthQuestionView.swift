//
//  FifthQuestionView.swift
//  TreasureHunter
//
//  Created by Алпамыс on 27.01.18.
//  Copyright © 2018 Алпамыс. All rights reserved.
//

import UIKit
import EasyPeasy

class FifthQuestionView: UIView {
    
    var removeViewDelegate: ViewRemovable?
    var alertDelegate: AlertCreatable?
    var answer = "597"
    
    var lastLabel: UILabel = {
        var label = UILabel()
        label.text = "NU ACM Student Chapter team :)"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next Medium", size: 20)
        return label
    }()
    
    lazy var acmImageView: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "acm2")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var questionLabel: UILabel = {
        var label = UILabel()
        label.text = "Well done! Last challenge is waiting for you!"
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
        button.backgroundColor = UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1.0)
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
        button.setTitle("Done!", for: .normal)
        button.setTitleColor(.acmColor, for: .highlighted)
        return button
    }()
    
    @objc func submitButtonPressed(){
        if answerTextField.text! == answer {
            alertDelegate?.createAlert(title: "Congratulations!", message: "Your have succesfully finished! Now go and get your treasure!", actionTitle: "Ok")
            let time = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: DateFormatter.Style.none, timeStyle: DateFormatter.Style.short)
//            ref.child("teams").child("team-\(teamId)q\(questId)").setValue("\(time)")
//            questId += 1
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
        answerTextField.removeFromSuperview()
        questionLabel.removeFromSuperview()
        addSubview(acmImageView)
        addSubview(lastLabel)
        backgroundColor = UIColor.white
        lastLabel.font = UIFont(name: "Avenir Next Medium", size: 20)
        lastLabel <- [Height(64), Left(16), Right(16), Bottom(64)]
        acmImageView <- [Top(64), Left(64), Right(64), Bottom(64).to(lastLabel)]
        
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
        backgroundColor = UIColor(red: 30/255, green: 144/255, blue: 255/255, alpha: 1.0)
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
