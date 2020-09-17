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


class LandingPageTest: XCTestCase {
    
    var controller : LandingController!
    
    override func setUp() {
        super.setUp()
        controller  = LandingController()
        controller.delegate = self
    }
    
    override func tearDown() {
        controller = nil
        super.tearDown()
    }
    
    func test_is_valid_email() {
        controller.setEmail("testcase")
        controller.setPassword("123456")
        controller.loginButtonPressed()
    }
    
    func test_unformatted_email(_ e : Error) {
        XCTAssertEqual(e.localizedDescription, FIRAuthErrorCodeInvalidEmail)
    }
}

extension LandingPageTest : LandingControllerDelegate{
    func passwordIsEmpty() {
        
    }
    
    func emailIsEmpty() {
        //
    }
    
    func authError(_ e: Error) {
        test_auth_errors(e)
    }
    
    func isAuthenticating(_ value: Bool) {
        //
    }
    
    func showParentScreen() {
        //
    }
}
