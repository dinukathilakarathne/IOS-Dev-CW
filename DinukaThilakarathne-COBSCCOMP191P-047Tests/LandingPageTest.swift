//
//  DinukaThilakarathne_COBSCCOMP191P_047Tests.swift
//  DinukaThilakarathne-COBSCCOMP191P-047Tests
//
//  Created by Dinuka Thilakarathne on 9/15/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import XCTest
import Firebase

@testable import DinukaThilakarathne_COBSCCOMP191P_047


class LandingPageTest: XCTestCase{
    
    var controller : LandingController!
    
    override func setUp() {
        super.setUp()
        controller  = LandingController()
        controller.coordinator = self
    }
    
    override func tearDown() {
        controller = nil
        super.tearDown()
    }
    
    func test_if_email_empty() {
        controller.setEmail("")
        controller.setPassword("123456")
        
        let isValidEmail =  controller.loginButtonPressed()
        XCTAssertEqual(false, isValidEmail)
    }
    
    func test_if_password_empty() {
        controller.setEmail("test")
        controller.setPassword("")
        
        let isValidEmail =  controller.loginButtonPressed()
        XCTAssertEqual(false, isValidEmail)
    }
    
    func test_fields_not_empty(){
        controller.setEmail("test")
        controller.setPassword("123456")
        
        let isValidEmail =  controller.loginButtonPressed()
        XCTAssertEqual(true, isValidEmail)
    }
    
    func test_is_successfully_authenticated(){
        let email = "test@gmail.com"
        let password = "123456"

        let _ = controller.logUser(email, password)
    }
        
    func test_unsuccessfull_authentication(){
        //unavailable email
        let email = "test@someemail.com"
        let password = "123456"
        
        let isLogged = controller.logUser(email, password)
        XCTAssertEqual(false, isLogged)
    }
}

extension LandingPageTest : LoginCoordinator{
    func loggedIn(_ status : Bool) {
        
        XCTAssertEqual(true, status)
    }
    
    
}
