//
//  ResumeViewModel.swift
//  ResumeDemo
//
//  Created by Evgeny Yagrushkin on 2019-05-31.
//  Copyright © 2019 Evgeny Yagrushkin. All rights reserved.
//

import UIKit

class ResumeViewModel {

    var network: NetworkResumeProtocol?
    private (set) var resume = Resume()
    
    init(network: NetworkResumeProtocol? = nil) {
        self.network = network
    }
    
    func reloaDate (completion: @escaping () -> Void) {
        
        network?.getResume(completion: { [weak self] (resume, _) in
            if let resume = resume {
                self?.resume = resume
            }
            DispatchQueue.main.async {
                completion()
            }
        })
        
    }
    
}
