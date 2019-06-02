//
//  Styles.swift
//  ResumeDemo
//
//  Created by Evgeny Yagrushkin on 2019-06-01.
//  Copyright © 2019 Evgeny Yagrushkin. All rights reserved.
//

import Foundation
import UIKit

struct ResumeColors {
    
    static let white = UIColor.white
    static let gray0 = UIColor(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0, alpha: 1.0)
    static let gray1 = UIColor(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1.0)

}

struct ResumeFonts {
    
    static let H1 = UIFont.boldSystemFont(ofSize: 16)
    static let H2 = UIFont.boldSystemFont(ofSize: 14)
    static let H3 = UIFont.systemFont(ofSize: 13)

}

struct ResumeDateFormatter {
    
    static let shortDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMM"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
    static let yyyyMMdd: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
}
