//
//  URLSession_tasks.swift
//  ResumeDemo
//
//  Created by Evgeny Yagrushkin on 2019-06-02.
//  Copyright © 2019 Evgeny Yagrushkin. All rights reserved.
//

import Foundation

extension URLSession {
    
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            let resume = try? newJSONDecoder().decode(T.self, from: data)
            completionHandler(resume, response, nil)
        }
    }
    
    func resumeTask(with url: URL, completionHandler: @escaping (Resume?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
