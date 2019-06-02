//
//  File.swift
//  ResumeDemo
//
//  Created by Evgeny Yagrushkin on 2019-05-31.
//  Copyright © 2019 Evgeny Yagrushkin. All rights reserved.
//

import Foundation

// MARK: - Resume
struct Resume: Codable {
    var firstName: String?
    var lastName: String?
    let intro: String?
    let photo: URL?
    let experience: [Experience]?

    init() {
        firstName = nil
        lastName = nil
        intro = nil
        photo = nil
        experience = []
    }
    
    var fullName: String?{
        get{
            switch (firstName, lastName) {
            case (nil, nil):
                return nil
            case (let firstName?, let lastName?):
                return firstName + " " + lastName
            case (let firstName?, nil):
                return firstName
            case (nil, let lastName?):
                return lastName
            }
        }
    }
    
}

// MARK: - Experience
struct Experience: Codable {
    
    let title, companyName: String?
    let logo: URL?
    let location: String?
    let startDate, endDate: Date?
    
    var period : String?{
        let dateFormatter = ResumeDateFormatter.shortDate
        
        var periodString : String?
        switch (startDate, endDate) {
        case (let startDate?, let endDate?):
            periodString = "\(dateFormatter.string(from: startDate)) - \(dateFormatter.string(from: endDate))"
            
        case (let startDate?, nil):
            periodString = "\(dateFormatter.string(from: startDate)) - present"

        default:
            break
        }
        
        return periodString
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        companyName = try container.decode(String.self, forKey: .companyName)
        location = try container.decode(String.self, forKey: .location)
        logo = try container.decode(URL.self, forKey: .logo)
        
        startDate = {
            let formatter = ResumeDateFormatter.yyyyMMdd
            if let dateString = try? container.decode(String.self, forKey: .startDate) {
                return formatter.date(from: dateString)
            }
            return nil
        }()

        endDate = {
            let formatter = ResumeDateFormatter.yyyyMMdd
            if let dateString = try? container.decode(String.self, forKey: .endDate) {
                return formatter.date(from: dateString)
            }
            return nil
        }()
        
    }
    
}

// MARK: - Helper functions for creating encoders and decoders
func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .iso8601
    return encoder
}
