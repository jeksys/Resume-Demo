//
//  UIImageViewDownload.swift
//  ResumeDemo
//
//  Created by Evgeny Yagrushkin on 2019-05-31.
//  Copyright © 2019 Evgeny Yagrushkin. All rights reserved.
//

import Foundation
import UIKit

//TODO:
//use protocol to creat a class with canceble download task
protocol DownloadableImageViewProtocol {
    var downloadTask: URLSessionDataTask {get set}
    func download(from url: URL)
    func cancelDownload()
}

extension UIImageView {
    
    func download(from url: URL?) {
        
        guard let url = url else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async() {
                self.image = image
            }
        }
        task.resume()
    }
}
