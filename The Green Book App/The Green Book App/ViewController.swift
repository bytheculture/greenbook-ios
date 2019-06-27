//
//  ViewController.swift
//  The Green Book App
//
//  Created by Alyssa Gable on 6/27/19.
//  Copyright © 2019 By The Culture. All rights reserved.
//

import UIKit
import SnapKit
import TextFieldEffects
import SwiftyButton

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "gradient")!)
        
        setUpView()
    }
    
    func setUpView() {
        let logo = UIImage(named: "whiteG")
        let logoView = UIImageView(image: logo!)
        
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome!"
        welcomeLabel.font = UIFont(name: "Flood", size: 46)
        welcomeLabel.textColor = UIColor.white
        
        let loginLabel = UILabel()
        loginLabel.text = "Please login to your account."
        loginLabel.font = UIFont(name: "FjallaOne-Regular", size: 17)
        loginLabel.textColor = UIColor.white
        
        let emailAddressField = HoshiTextField()
        emailAddressField.placeholder = "Email Address"
        emailAddressField.textColor = UIColor.white
        emailAddressField.placeholderColor = UIColor.white
        emailAddressField.borderActiveColor = UIColor.white
        emailAddressField.borderInactiveColor = UIColor.white
        emailAddressField.font = UIFont(name: "FjallaOne-Regular", size: 18)

        let passwordField = HoshiTextField()
        passwordField.placeholder = "Password"
        passwordField.textColor = UIColor.white
        passwordField.placeholderColor = UIColor.white
        passwordField.borderActiveColor = UIColor.white
        passwordField.borderInactiveColor = UIColor.white
        passwordField.font = UIFont(name: "FjallaOne-Regular", size: 18)
        
        let forgotPasswordButton = UIButton()
        forgotPasswordButton.setTitle("Forgot?", for: .normal)
        forgotPasswordButton.setTitleColor(UIColor.white, for: .normal)
        forgotPasswordButton.titleLabel?.font = UIFont(name: "FjallaOne-Regular", size: 14)
        
        let loginButton = FlatButton()
        loginButton.color = UIColor(red:0.29, green:0.82, blue:0.52, alpha:1.0)
        loginButton.cornerRadius = 5
        loginButton.highlightedColor = UIColor(red:0.30, green:0.30, blue:0.30, alpha:1.0)
        loginButton.setTitle("LOGIN", for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "FjallaOne-Regular", size: 28)
        
        let registerButton = UIButton()
        registerButton.setTitle("REGISTER NOW", for: .normal)
        registerButton.setTitleColor(UIColor.white, for: .normal)
        registerButton.titleLabel?.font = UIFont(name: "FjallaOne-Regular", size: 14)
        
        let or = UIImage(named: "or")
        let orView = UIImageView(image: or!)
        
        let facebookLogin = UIButton()
        let facebookButton = UIImage(named: "facebookButton")
        facebookLogin.setImage(facebookButton, for: .normal)
        
        let googleLogin = UIButton()
        let googleButton = UIImage(named: "googleButton")
        googleLogin.setImage(googleButton, for: .normal)
        
        self.view.addSubview(logoView)
//        if UIDevice().userInterfaceIdiom == .phone {
//            switch UIScreen.main.nativeBounds.height {
//            case 2436:
//                print("iPhone X, XS")
//            case 2688:
//                print("iPhone XS Max")
//            case 2688:
//                print("iPhone XR")
//            default:
//                print("Other phone")
//            }
//
//        }
        
        logoView.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(168)
            make.top.equalToSuperview().offset(45)
            make.centerX.equalToSuperview()
        }
        
        self.view.addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(233)
            make.height.equalTo(40)
            make.top.equalTo(logoView.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(38)
        }
        
        self.view.addSubview(loginLabel)
        loginLabel.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(250)
            make.height.equalTo(25)
            make.top.equalTo(welcomeLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(38)
        }
        
        self.view.addSubview(emailAddressField)
        emailAddressField.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.top.equalTo(loginLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(38)
        }
        
        self.view.addSubview(passwordField)
        passwordField.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.top.equalTo(emailAddressField.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(38)
        }
        
        self.view.addSubview(forgotPasswordButton)
        forgotPasswordButton.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(50)
            make.height.equalTo(17)
            make.top.equalTo(passwordField.snp.bottom).offset(5)
            make.right.equalToSuperview().offset(-40)
        }
        
        self.view.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(passwordField.snp.bottom).offset(self.view.bounds.height / 10)
            make.width.equalTo(300)
            make.height.equalTo(52)
            make.centerX.equalToSuperview()
        }
        
        self.view.addSubview(registerButton)
        registerButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(loginButton.snp.bottom).offset(15)
            make.width.equalTo(77)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
        }
        
        self.view.addSubview(orView)
        orView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(registerButton.snp.bottom).offset(50)
            make.width.equalTo(300)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
        }
        
        self.view.addSubview(facebookLogin)
        facebookLogin.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(orView.snp.bottom).offset(40)
            make.width.equalTo(54)
            make.height.equalTo(54)
            make.centerX.equalToSuperview().offset(-40)
        }
        
        self.view.addSubview(googleLogin)
        googleLogin.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(orView.snp.bottom).offset(40)
            make.width.equalTo(54)
            make.height.equalTo(54)
            make.left.equalTo(facebookLogin.snp.right).offset(25)
        }
    }


}

