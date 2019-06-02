//
//  NetworkManager.swift
//  ResumeDemo
//
//  Created by Evgeny Yagrushkin on 2019-05-31.
//  Copyright © 2019 Evgeny Yagrushkin. All rights reserved.
//

import UIKit

protocol NetworkResumeProtocol {
    func getResume(completion: @escaping (Resume?, Error?) -> Void)
}

class NetworkManager: NetworkResumeProtocol {

    func getResume(completion: @escaping (Resume?, Error?) -> Void) {

        let urlString = GlobalSettings.resumeURL
        guard let url = URL(string: urlString) else {
            completion(nil, nil)
            return
        }
        
        let task = URLSession.shared.resumeTask(with: url) { resume, response, error in
            if let resume = resume {
                completion(resume, error)
            }
        }
        task.resume()
    }
    
}

