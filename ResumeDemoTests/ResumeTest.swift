//
//  ResumeTest.swift
//  ResumeDemoTests
//
//  Created by Evgeny Yagrushkin on 2019-06-02.
//  Copyright © 2019 Evgeny Yagrushkin. All rights reserved.
//

import XCTest

@testable import ResumeDemo

extension Resume {
    
    mutating func update(firstName: String?, lastName: String?){
        self.firstName = firstName
        self.lastName = lastName
    }
    
}

class ResumeTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFullName() {
        
        var resume = Resume()

        resume.update(firstName: "Eugene", lastName: "Yagrushkin")
        XCTAssertEqual(resume.fullName, "Eugene Yagrushkin")

        resume.update(firstName: "Eugene", lastName: nil)
        XCTAssertEqual(resume.fullName, "Eugene")

        resume.update(firstName: nil, lastName: "Yagrushkin")
        XCTAssertEqual(resume.fullName, "Yagrushkin")
    }

}
