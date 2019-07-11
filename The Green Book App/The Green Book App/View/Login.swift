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
import UITextField_Shake
import SwiftyButton
import FirebaseAuth
import NVActivityIndicatorView
import SCLAlertView
import FBSDKLoginKit
import FacebookLogin

class Login: UIViewController {
    
    var emailAddressField = HoshiTextField()
    var passwordField = HoshiTextField()
    var activityIndicator = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), type: .ballTrianglePath, color: UIColor.white, padding: 0)

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
        
        emailAddressField.placeholder = "Email Address or Phone Number"
        emailAddressField.textColor = UIColor.white
        emailAddressField.placeholderColor = UIColor.white
        emailAddressField.borderActiveColor = UIColor.white
        emailAddressField.borderInactiveColor = UIColor.white
        emailAddressField.font = UIFont(name: "FjallaOne-Regular", size: 18)

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
        forgotPasswordButton.addTarget(self, action: #selector(forgotPassword), for: .touchUpInside)
        
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
        facebookLogin.addTarget(self, action: #selector(facebookLoginButtonClicked), for: .touchUpInside)

        
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
        
        let screenHeight = self.view.bounds.height
        let screenWdith = self.view.bounds.width
        
        logoView.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(168)
            make.top.equalToSuperview().offset(screenHeight * 1/25)
            make.centerX.equalToSuperview()
        }
        
        self.view.addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(233)
            make.height.equalTo(40)
            make.top.equalTo(logoView.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(screenWdith * 1/10)
        }
        
        self.view.addSubview(loginLabel)
        loginLabel.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(250)
            make.height.equalTo(25)
            make.top.equalTo(welcomeLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(screenWdith * 1/10)
        }
        
        self.view.addSubview(emailAddressField)
        emailAddressField.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.top.equalTo(loginLabel.snp.bottom).offset(10)
            make.left.equalTo(loginLabel.snp.left)
            make.right.equalToSuperview().offset(-screenWdith * 1/10)
        }
        
        self.view.addSubview(passwordField)
        passwordField.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.top.equalTo(emailAddressField.snp.bottom).offset(25)
            make.left.equalTo(loginLabel.snp.left)
            make.right.equalToSuperview().offset(-screenWdith * 1/10)
        }
        
        self.view.addSubview(forgotPasswordButton)
        forgotPasswordButton.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(50)
            make.height.equalTo(17)
            make.top.equalTo(passwordField.snp.bottom).offset(5)
            make.right.equalTo(passwordField.snp.right).inset(5)
        }
        
        self.view.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(passwordField.snp.bottom).offset(screenHeight * 1/15)
            make.width.equalTo(300)
            make.height.equalTo(52)
            make.centerX.equalToSuperview()
        }
        
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        self.view.addSubview(registerButton)
        registerButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(loginButton.snp.bottom).offset(15)
            make.width.equalTo(77)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
        }
        
        self.view.addSubview(orView)
        orView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(registerButton.snp.bottom).offset(screenHeight * 1/20)
            make.left.equalTo(loginLabel.snp.left)
            make.right.equalToSuperview().offset(-screenWdith * 1/10)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
        }
        
        self.view.addSubview(facebookLogin)
        facebookLogin.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(orView.snp.bottom).offset(25)
            make.width.equalTo(75)
            make.height.equalTo(75)
            make.centerX.equalToSuperview().offset(-60)
        }
        
        self.view.addSubview(googleLogin)
        googleLogin.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(facebookLogin.snp.top)
            make.width.equalTo(75)
            make.height.equalTo(75)
            make.left.equalTo(facebookLogin.snp.right).offset(40)
        }
        
        self.view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { (make) -> Void in
            make.center.equalToSuperview()
            make.width.height.equalTo(100)
        }
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    @objc func login() {
        let email = emailAddressField.text ?? ""
        let password = passwordField.text ?? ""
        
        //shakes UITextFields if they are empty
        if email == "" || password == "" {
            self.emailAddressField.shake(2, withDelta: 5, speed: 0.1, shakeDirection: .vertical)
            self.passwordField.shake(2, withDelta: 5, speed: 0.1, shakeDirection: .vertical)
            activityIndicator.stopAnimating()
        } else if isValidEmail(testStr: email) {
            activityIndicator.startAnimating()
            loginToFirebase(email: email, password: password, phoneNumber: nil)
        } else {
            showIncompleteError(errorMessage: "Please use the following email format: test@email.com")
        }
        
    }
    
    func loginToFirebase(email: String, password: String, phoneNumber: String?) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                
                self.emailAddressField.shake(2, withDelta: 5, speed: 0.1, shakeDirection: .vertical)
                self.passwordField.shake(2, withDelta: 5, speed: 0.1, shakeDirection: .vertical)
                
                self.showIncompleteError(errorMessage: error.localizedDescription)
                
            } else if Auth.auth().currentUser != nil {
                self.activityIndicator.stopAnimating()
                self.showSuccessMessage()
            }
        }
    }
    
    @objc func forgotPassword() {

        let alert = SCLAlertView()
        let emailAddress = alert.addTextField("Enter your email address.")
        alert.addButton("Reset Password") {
            self.resetPassword(email: emailAddress.text!)
        }

        let timeoutAction: SCLAlertView.SCLTimeoutConfiguration.ActionType = {
            // action here
        }
        
        alert.showCustom("Reset Your Password", subTitle: "Please enter your email address below and we will send you an email to reset your password.", color: UIColor.white, icon: UIImage(named: "mustache")!, closeButtonTitle: "Cancel", timeout: SCLAlertView.SCLTimeoutConfiguration(timeoutValue: 30.0, timeoutAction:timeoutAction), colorStyle: 1, colorTextButton: 2, circleIconImage: UIImage(named: "mustache")!, animationStyle: .leftToRight)
    }
    
    //shows incomplete error message alert view
    func showIncompleteError(errorMessage: String) {
        
        self.activityIndicator.stopAnimating()
        
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: true,
            showCircularIcon: false
        )
        let alertView = SCLAlertView(appearance: appearance)
        alertView.showError("Something went wrong!", subTitle: errorMessage)
        
        _ = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
            alertView.hideView()
            
        }
        
    }
    
    //shows success message alert View
    func showSuccessMessage() {
        let appearance = SCLAlertView.SCLAppearance(
            showCloseButton: false,
            showCircularIcon: true
        )
        let alertView = SCLAlertView(appearance: appearance)
        let alertViewIcon = UIImage(named: "bigGLogo")
        let alertViewColor = UIColor.white
        
        alertView.showCustom("Welcome To The Green Book!", subTitle: "You've successfully logged in.", color: alertViewColor, icon: alertViewIcon!)
        
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
            self.activityIndicator.stopAnimating()
            alertView.hideView()
        }
    }
    
    //Resets password with Firebase
    func resetPassword(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if error != nil {
                let alertView = SCLAlertView()
                self.showIncompleteError(errorMessage: (error?.localizedDescription)!)
            } else {
                self.showIncompleteError(errorMessage: "Please check your inbox for an email.")
            }
        }
    }
    
    // Once the button is clicked, show the login dialog
    @objc func facebookLoginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: [ .publicProfile ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in!")
            }
        }
    }

}
