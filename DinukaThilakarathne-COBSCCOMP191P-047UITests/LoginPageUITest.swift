//
//  LoginPageUITest.swift
//  DinukaThilakarathne-COBSCCOMP191P-047UITests
//
//  Created by Dinuka Thilakarathne on 9/17/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import XCTest

class LoginPageUITest: XCTestCase {
    
    var app : XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
    }
    
    
    //testing login with valid credentials
    func test_valid_credentials(){

        let validEmail = "ashan@gmail.com"
        let validPassword = "123456"

        app.launch()
        app.tabBars.buttons["Settings"].tap()

        app.scrollViews.otherElements/*@START_MENU_TOKEN@*/.staticTexts[" - L O G I N - "]/*[[".buttons[\" - L O G I N - \"].staticTexts[\" - L O G I N - \"]",".staticTexts[\" - L O G I N - \"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let emailTextField = app/*@START_MENU_TOKEN@*/.textFields["Email"]/*[[".otherElements[\"LoginView\"].textFields[\"Email\"]",".textFields[\"Email\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(emailTextField.exists)
        emailTextField.tap()
        emailTextField.typeText(validEmail)

        let passwordSecureTextField = app/*@START_MENU_TOKEN@*/.secureTextFields["Password"]/*[[".otherElements[\"LoginView\"].secureTextFields[\"Password\"]",".secureTextFields[\"Password\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(passwordSecureTextField.exists)
        passwordSecureTextField.tap()
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(validPassword)

        app/*@START_MENU_TOKEN@*/.buttons["Done"]/*[[".keyboards",".buttons[\"done\"]",".buttons[\"Done\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()

        app/*@START_MENU_TOKEN@*/.buttons["L O G I N"]/*[[".otherElements[\"LoginView\"].buttons[\"L O G I N\"]",".buttons[\"L O G I N\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.scrollViews.otherElements.buttons["L O G  O U T"].tap()
    }

    //testing error message
    func test_invalid_credentials(){
        app.launch()
        app.tabBars.buttons["Settings"].tap()
        app.scrollViews.otherElements.buttons[" - L O G I N - "].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["L O G I N"]/*[[".otherElements[\"LoginView\"]",".buttons[\"L O G I N\"].staticTexts[\"L O G I N\"]",".staticTexts[\"L O G I N\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        let emptyEmailDialog = app.alerts["Empty Email field"]
        XCTAssertTrue(emptyEmailDialog.exists)
        emptyEmailDialog.scrollViews.otherElements.buttons["OK"].tap()
    }
}
