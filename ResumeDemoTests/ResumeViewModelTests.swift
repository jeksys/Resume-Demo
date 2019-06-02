//
//  NetworkManagerTests.swift
//  ResumeDemoTests
//
//  Created by Evgeny Yagrushkin on 2019-06-02.
//  Copyright © 2019 Evgeny Yagrushkin. All rights reserved.
//

import XCTest


@testable import ResumeDemo

class NetworkManagerMock: NetworkResumeProtocol {

    func getResume(completion: @escaping (Resume?, Error?) -> Void){
        
        guard let pathString = Bundle.main.path(forResource: "resume", ofType: ".json") else {
            completion(nil, nil)
            return
        }
        print("json path: \(pathString)")

        do {
            let pathURL = URL(fileURLWithPath: pathString)
            let data = try Data(contentsOf: pathURL)
            let resume = try? newJSONDecoder().decode(Resume.self, from: data)
            completion(resume, nil)
        } catch  {
            completion(nil, nil)
        }
    }
    
}

class NetworkManagerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testResumeViewModel() {

        let networkManager = NetworkManagerMock()
        
        let viewModel = ResumeViewModel(network: networkManager)
        
        let expectationResume = expectation(description: "ResumeViewModel network")
        viewModel.reloaData {
            
            expectationResume.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)

        XCTAssertNotNil(viewModel.resume)
        XCTAssertEqual(viewModel.resume.experience?.count, 2)
        
        XCTAssertEqual(viewModel.resume.experience?.first?.period, "2017 Nov - present")
        XCTAssertEqual(viewModel.resume.experience?[1].period, "2016 Oct - 2017 Nov")

    }
    
}
