//
//  UIView_anchor.swift
//  ResumeDemo
//
//  Created by Evgeny Yagrushkin on 2019-06-01.
//  Copyright © 2019 Evgeny Yagrushkin. All rights reserved.
//

import Foundation

import UIKit

enum SizeConstraint {
    case Equal(CGFloat)
    case GreaterThanOrEqualTo(CGFloat)
}

extension UIView {
    
    func anchor (top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: SizeConstraint, enableInsets: Bool = false) {
        
        var topInset = CGFloat(0)
        var bottomInset = CGFloat(0)
        
        let insets = self.safeAreaInsets
        topInset = insets.top
        bottomInset = insets.bottom

        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop+topInset).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom-bottomInset).isActive = true
        }
        
        switch height {
        case .Equal(let height):
            heightAnchor.constraint(equalToConstant: height).isActive = true
        case .GreaterThanOrEqualTo(let height):
            heightAnchor.constraint(greaterThanOrEqualToConstant: height).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
    }
    
}
