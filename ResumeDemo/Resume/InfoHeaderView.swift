//
//  InfoHeaderView.swift
//  ResumeDemo
//
//  Created by Evgeny Yagrushkin on 2019-05-31.
//  Copyright © 2019 Evgeny Yagrushkin. All rights reserved.
//

import UIKit

class InfoHeaderView: UIView {
    
    var resume: Resume?{
        didSet{
            profileView.download(from: resume?.photo)
            fullNameLabel.text = resume?.fullName
            introLabel.text = resume?.intro
        }
    }

    private let profileView : UIImageView = {
        let imgView = UIImageView(frame: .zero)
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        
        imgView.backgroundColor = ResumeColors.gray0
        imgView.layer.borderColor = ResumeColors.white.cgColor
        imgView.layer.borderWidth = 1.0
        imgView.layer.cornerRadius = 5.0
        imgView.clipsToBounds = true

        return imgView
    }()

    private let fullNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = ResumeFonts.H1
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        return label
    }()

    private let introLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = ResumeFonts.H3
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupView(){
        backgroundColor = ResumeColors.gray1
        translatesAutoresizingMaskIntoConstraints = false

        widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        
        addPhotoView()
        addFullName()
        addInfoText()
    }
    
    func addPhotoView(){
        addSubview(profileView)
        profileView.translatesAutoresizingMaskIntoConstraints = false
        
        profileView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profileView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        profileView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive=true
        
    }
    
    func addFullName(){
        addSubview(fullNameLabel)
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false

        fullNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        fullNameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        fullNameLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        fullNameLabel.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 10).isActive = true
        fullNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        fullNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
    }
    
    func addInfoText(){
        addSubview(introLabel)
        introLabel.translatesAutoresizingMaskIntoConstraints = false
        
        introLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        introLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        introLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
        introLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 10).isActive = true
        introLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        introLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        introLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        
    }
    
}
