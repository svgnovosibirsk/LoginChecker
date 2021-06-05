//
//  LoginCheckerTests.swift
//  LoginCheckerTests
//
//  Created by Sergey Golovin on 05.06.2021.
//

import XCTest
@testable import LoginChecker

class LoginCheckerTests: XCTestCase {
    
    var sut: ViewController!
    
    override func setUpWithError() throws {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "LoginVC") as? ViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        super.tearDown()
        sut = nil
    }

    func testTextFieldIsConnected() throws {
        _ = try XCTUnwrap(sut.textField, "ViewController.textField is not connected")
    }

    func testEmptyTextFieldAlert() throws {
        sut.textField.text = ""
        sut.submitBtnPressed(UIButton())
        
        XCTAssertEqual(sut.testMessage, "Login can contain from 3 to 32 Latinic letters, numbers, minus or dot", "Alert text is not: Login can contain from 3 to 32 Latinic letters, numbers, minus or dot")
    }
    
    func testSpaceTextFieldAlert() throws {
        sut.textField.text = " "
        sut.submitBtnPressed(UIButton())
        
        XCTAssertEqual(sut.testMessage, "Login can contain from 3 to 32 Latinic letters, numbers, minus or dot", "Alert text is not: Login can contain from 3 to 32 Latinic letters, numbers, minus or dot")
    }
    
    func testMinusTextFieldAlert() throws {
        sut.textField.text = "-"
        sut.submitBtnPressed(UIButton())
        
        XCTAssertEqual(sut.testMessage, "Login can contain from 3 to 32 Latinic letters, numbers, minus or dot", "Alert text is not: Login can contain from 3 to 32 Latinic letters, numbers, minus or dot")
    }
    
    func testOneLetterTextFieldAlert() throws {
        sut.textField.text = "a"
        sut.submitBtnPressed(UIButton())
        
        XCTAssertEqual(sut.testMessage, "Login can contain from 3 to 32 Latinic letters, numbers, minus or dot", "Alert text is not: Login can contain from 3 to 32 Latinic letters, numbers, minus or dot")
    }
    
    func testOneCapitalLetterTextFieldAlert() throws {
        sut.textField.text = "A"
        sut.submitBtnPressed(UIButton())
        
        XCTAssertEqual(sut.testMessage, "Login can contain from 3 to 32 Latinic letters, numbers, minus or dot", "Alert text is not: Login can contain from 3 to 32 Latinic letters, numbers, minus or dot")
    }
    
    func testOneDigitTextFieldAlert() throws {
        sut.textField.text = "1"
        sut.submitBtnPressed(UIButton())
        
        XCTAssertEqual(sut.testMessage, "Login can contain from 3 to 32 Latinic letters, numbers, minus or dot", "Alert text is not: Login can contain from 3 to 32 Latinic letters, numbers, minus or dot")
    }
    
    func testOneEmojiTextFieldAlert() throws {
        sut.textField.text = "😎"
        sut.submitBtnPressed(UIButton())
        
        XCTAssertEqual(sut.testMessage, "Login can contain from 3 to 32 Latinic letters, numbers, minus or dot", "Alert text is not: Login can contain from 3 to 32 Latinic letters, numbers, minus or dot")
    }
    
    func testTwoCharactersTextFieldAlert() throws {
        sut.textField.text = "a1"
        sut.submitBtnPressed(UIButton())
        
        XCTAssertEqual(sut.testMessage, "Login can contain from 3 to 32 Latinic letters, numbers, minus or dot", "Alert text is not: Login can contain from 3 to 32 Latinic letters, numbers, minus or dot")
    }
    
    func testThreeCharactersTextFieldAlert() throws {
        sut.textField.text = "b2-"
        sut.submitBtnPressed(UIButton())
        
        XCTAssertEqual(sut.testMessage, "Loggin is correct😃", "Alert text is not: Loggin is correct😃")
    }
    
    func testEmailFormatTextFieldAlert() throws {
        sut.textField.text = "bar@foo.com"
        sut.submitBtnPressed(UIButton())
        
        XCTAssertEqual(sut.testMessage, "Loggin is correct😃", "Alert text is not: Loggin is correct😃")
    }
    
    func testBeginWithMinusTextFieldAlert() throws {
        sut.textField.text = "-bar@foo.com"
        sut.submitBtnPressed(UIButton())
        
        XCTAssertEqual(sut.testMessage, "Login should start with letter", "Alert text is not: Login should start with letter")
    }
    
    func testBeginWithDotTextFieldAlert() throws {
        sut.textField.text = ".bar@foo.com"
        sut.submitBtnPressed(UIButton())
        
        XCTAssertEqual(sut.testMessage, "Login should start with letter", "Alert text is not: Login should start with letter")
    }
    
    func testBeginWithDigitTextFieldAlert() throws {
        sut.textField.text = "4bar@foo.com"
        sut.submitBtnPressed(UIButton())
        
        XCTAssertEqual(sut.testMessage, "Login should start with letter", "Alert text is not: Login should start with letter")
    }
    
    func testContainsSlashTextFieldAlert() throws {
        sut.textField.text = "bar/foo.com"
        sut.submitBtnPressed(UIButton())
        
        XCTAssertEqual(sut.testMessage, "Login can contain from 3 to 32 Latinic letters, numbers, minus or dot", "Alert text is not: Login can contain from 3 to 32 Latinic letters, numbers, minus or dot")
    }
    
    func testContainsBracketTextFieldAlert() throws {
        sut.textField.text = "bar]foo.com"
        sut.submitBtnPressed(UIButton())
        
        XCTAssertEqual(sut.testMessage, "Login can contain from 3 to 32 Latinic letters, numbers, minus or dot", "Alert text is not: Login can contain from 3 to 32 Latinic letters, numbers, minus or dot")
    }
    
    func testContainsBraceTextFieldAlert() throws {
        sut.textField.text = "bar(foo.com"
        sut.submitBtnPressed(UIButton())
        
        XCTAssertEqual(sut.testMessage, "Login can contain from 3 to 32 Latinic letters, numbers, minus or dot", "Alert text is not: Login can contain from 3 to 32 Latinic letters, numbers, minus or dot")
    }
    
    func testContainsExclamationMarkTextFieldAlert() throws {
           sut.textField.text = "barfoo!com"
           sut.submitBtnPressed(UIButton())
           
           XCTAssertEqual(sut.testMessage, "Login can contain from 3 to 32 Latinic letters, numbers, minus or dot", "Alert text is not: Login can contain from 3 to 32 Latinic letters, numbers, minus or dot")
       }
    
    
}
