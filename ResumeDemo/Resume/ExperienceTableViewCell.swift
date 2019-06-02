//
//  ExperienceTableViewCell.swift
//  ResumeDemo
//
//  Created by Evgeny Yagrushkin on 2019-05-31.
//  Copyright © 2019 Evgeny Yagrushkin. All rights reserved.
//

import UIKit

class ExperienceTableViewCell: UITableViewCell {

    var experience : Experience? {
        didSet {
            companyLogoView.download(from: experience?.logo)
            
            titleLabel.text = experience?.title
            companyNameLabel.text = experience?.companyName
            companyLocationLabel.text = experience?.location
            periodLabel.text = experience?.period
        }
    }

    private let companyLogoView : UIImageView = {
        let imgView = UIImageView(frame: .zero)
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = ResumeColors.gray0
        label.textColor = .black
        label.font = ResumeFonts.H1
        label.textAlignment = .left
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        return label
    }()

    private let companyNameLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = ResumeColors.gray0
        label.textColor = .black
        label.font = ResumeFonts.H2
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()

    private let companyLocationLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = ResumeColors.gray0
        label.textColor = .black
        label.font = ResumeFonts.H3
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()

    private let periodLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = ResumeColors.gray0
        label.textColor = .black
        label.font = ResumeFonts.H3
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = ResumeColors.gray0
        
        addSubview(companyLogoView)
        addSubview(titleLabel)
        addSubview(companyNameLabel)
        addSubview(companyLocationLabel)
        addSubview(periodLabel)

        let leftPadding: CGFloat = 10
        let rightPadding: CGFloat = 30
        
        companyLogoView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 5, paddingBottom: 15, paddingRight: 0, width: 50, height: SizeConstraint.GreaterThanOrEqualTo(50))
        
        var topAnchorRef: NSLayoutYAxisAnchor? = topAnchor
        titleLabel.anchor(top: topAnchorRef, left: companyLogoView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 15, paddingLeft: leftPadding, paddingBottom: 0, paddingRight: rightPadding, width: 0, height: SizeConstraint.GreaterThanOrEqualTo(20))
        
        topAnchorRef = titleLabel.bottomAnchor
        companyNameLabel.anchor(top: topAnchorRef, left: companyLogoView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: leftPadding, paddingBottom: 0, paddingRight: rightPadding, width: 0, height: SizeConstraint.GreaterThanOrEqualTo(20))

        topAnchorRef = companyNameLabel.bottomAnchor
        companyLocationLabel.anchor(top: topAnchorRef, left: companyLogoView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: leftPadding, paddingBottom: 10, paddingRight: rightPadding, width: 0, height: SizeConstraint.GreaterThanOrEqualTo(0))

        topAnchorRef = companyLocationLabel.bottomAnchor
        periodLabel.anchor(top: topAnchorRef, left: companyLogoView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: leftPadding, paddingBottom: 10, paddingRight: rightPadding, width: 0, height: SizeConstraint.GreaterThanOrEqualTo(0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
