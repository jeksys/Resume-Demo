//
//  InfoHeaderView.swift
//  ResumeDemo
//
//  Created by Evgeny Yagrushkin on 2019-05-31.
//  Copyright © 2019 Evgeny Yagrushkin. All rights reserved.
//

import UIKit

class InfoHeaderView: UIView {
    
    var profileView: UIImageView!
    var fullNameLabel: UILabel!
    var infoText: UILabel!
    var model: Resume!
    
    init(frame: CGRect, resume: Resume) {
        super.init(frame: frame)
        model = resume
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupView(){
        backgroundColor = .lightGray
        translatesAutoresizingMaskIntoConstraints = true
        
        widthAnchor.constraint(equalToConstant: frame.width)
        heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        
        if let superview = superview {
            leftAnchor.constraint(equalTo: superview.leftAnchor, constant: 0).isActive=true
            rightAnchor.constraint(equalTo: superview.rightAnchor, constant: 0).isActive=true
            topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive=true
        }
        
        addPhotoView()
        addFullName()
        addInfoText()
    }
    
    func addPhotoView(){
        
        profileView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.backgroundColor = ResumeColors.gray0
        profileView.layer.borderColor = ResumeColors.white.cgColor
        profileView.layer.borderWidth = 1.0
        profileView.layer.cornerRadius = 5.0
        profileView.clipsToBounds = true
        addSubview(profileView)
        
        profileView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profileView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        profileView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive=true
        
        if let photo = model.photo, let url = URL(string: photo){
            profileView.download(from: url)
        }
    }
    
    func addFullName(){
        fullNameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(fullNameLabel)
        
        fullNameLabel.font = ResumeFonts.H1
        fullNameLabel.numberOfLines = 1
        fullNameLabel.textAlignment = .center

        fullNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        fullNameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        fullNameLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        fullNameLabel.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 10).isActive=true
        
        fullNameLabel.text = model.fullName
        fullNameLabel.sizeToFit()
    }
    
    func addInfoText(){
        infoText = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        infoText.translatesAutoresizingMaskIntoConstraints = false
        addSubview(infoText)
        
        infoText.font = ResumeFonts.H3
        infoText.numberOfLines = 0
        infoText.textAlignment = .left
        infoText.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        infoText.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        infoText.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        infoText.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        infoText.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 10).isActive=true
        infoText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive=true
        infoText.leftAnchor.constraint(equalTo: leftAnchor, constant: 50).isActive=true
        infoText.rightAnchor.constraint(equalTo: rightAnchor, constant: -50).isActive=true
        
        infoText.text = " infoText.centerXAnchor. constraint(equalTo: centerXAnchor).isActive = true infoText.centerXAnchor. constraint(equalTo: centerXAnchor).isActive = true infoText.centerXAnchor. constraint(equalTo: centerXAnchor).isActive = true"//model.intro
        infoText.sizeToFit()
    }
    
}
