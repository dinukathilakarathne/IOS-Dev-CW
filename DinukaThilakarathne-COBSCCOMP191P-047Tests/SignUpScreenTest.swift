//
//  SignUpScreenTest.swift
//  DinukaThilakarathne-COBSCCOMP191P-047Tests
//
//  Created by Dinuka Thilakarathne on 9/17/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//
import Firebase
import XCTest
@testable import DinukaThilakarathne_COBSCCOMP191P_047

class SignUpScreenTest: XCTestCase {

    var controller : SignUpController!
    
    override func setUp() {
        super.setUp()
        controller = SignUpController()
    }
    
    override func tearDown() {
        controller = nil
        super.tearDown()
    }
    
    func test_if_email_empty() {
        controller.setEmail("")
        controller.setPassword("123456")
        controller.setReenteredPassword("123456")
        controller.setID("A-12345")
        controller.setName("Dinuka")
        controller.setAddress("somewhere")
        
        let isValidEmail =  controller.signUpButtonPressed()
        XCTAssertEqual(false, isValidEmail)
    }
    
    func test_if_password_empty() {
        controller.setEmail("test@gmail.com")
        controller.setPassword("")
        controller.setReenteredPassword("123456")
        controller.setID("A-12345")
        controller.setName("Dinuka")
        controller.setAddress("somewhere")
        
        let isValidEmail =  controller.signUpButtonPressed()
        XCTAssertEqual(false, isValidEmail)
    }
    
    func test_if_reenterdpassword_not_empty() {
        controller.setEmail("test@gmail.com")
        controller.setPassword("123456")
        controller.setReenteredPassword("")
        controller.setID("A-12345")
        controller.setName("Dinuka")
        controller.setAddress("somewhere")
        
        let isValidEmail =  controller.signUpButtonPressed()
        XCTAssertEqual(false, isValidEmail)
    }
    
    func test_is_id_empty() {
        controller.setEmail("test@gmail.com")
        controller.setPassword("123456")
        controller.setReenteredPassword("123456")
        controller.setID("")
        controller.setName("Dinuka")
        controller.setAddress("somewhere")
        
        let isValidEmail =  controller.signUpButtonPressed()
        XCTAssertEqual(false, isValidEmail)
    }
    
    func test_is_name_empty() {
        controller.setEmail("test@gmail.com")
        controller.setPassword("123456")
        controller.setReenteredPassword("123456")
        controller.setID("A-12345")
        controller.setName("")
        controller.setAddress("somewhere")
        
        let isValidEmail =  controller.signUpButtonPressed()
        XCTAssertEqual(false, isValidEmail)
    }
    
    func test_is_address_empty() {
        controller.setEmail("test@gmail.com")
        controller.setPassword("123456")
        controller.setReenteredPassword("123456")
        controller.setID("A-12345")
        controller.setName("Dinuka")
        controller.setAddress("")
        
        let isValidEmail =  controller.signUpButtonPressed()
        XCTAssertEqual(false, isValidEmail)
    }
    
    func test_all_fields() {
        controller.setEmail("test@gmail.com")
        controller.setPassword("123456")
        controller.setReenteredPassword("123456")
        controller.setID("A-12345")
        controller.setName("Dinuka")
        controller.setAddress("Somewhere")
        
        let isValidEmail =  controller.signUpButtonPressed()
        XCTAssertEqual(true, isValidEmail)
    }
    
    
}
