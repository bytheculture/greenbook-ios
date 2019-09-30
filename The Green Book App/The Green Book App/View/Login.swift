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
import GoogleSignIn

class Login: UIViewController, GIDSignInUIDelegate {
    
    var emailAddressField = HoshiTextField()
    var phoneNumberField = HoshiTextField()
    var passwordField = HoshiTextField()
    var activityIndicator = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), type: .ballTrianglePath, color: UIColor.white, padding: 0)

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationItem.setHidesBackButton(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().delegate = self as? GIDSignInDelegate
        GIDSignIn.sharedInstance().uiDelegate = self
        
        // Uncomment to automatically sign in the user.

        //GIDSignIn.sharedInstance().signInSilently()

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
        
        emailAddressField.placeholder = "Email Address"
        emailAddressField.textColor = UIColor.white
        emailAddressField.placeholderColor = UIColor.white
        emailAddressField.borderActiveColor = UIColor.white
        emailAddressField.borderInactiveColor = UIColor.white
        emailAddressField.font = UIFont(name: "FjallaOne-Regular", size: 18)
        
        phoneNumberField.placeholder = "Phone Number"
        phoneNumberField.keyboardType = .numberPad
        phoneNumberField.textColor = UIColor.white
        phoneNumberField.placeholderColor = UIColor.white
        phoneNumberField.borderActiveColor = UIColor.white
        phoneNumberField.borderInactiveColor = UIColor.white
        phoneNumberField.font = UIFont(name: "FjallaOne-Regular", size: 18)

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
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)

        let registerButton = UIButton()
        registerButton.setTitle("REGISTER NOW", for: .normal)
        registerButton.setTitleColor(UIColor.white, for: .normal)
        registerButton.titleLabel?.font = UIFont(name: "FjallaOne-Regular", size: 14)
        registerButton.addTarget(self, action: #selector(goToRegister), for: .touchUpInside)

        
        let or = UIImage(named: "or")
        let orView = UIImageView(image: or!)
        let orView2 = UIImageView(image: or!)
        
        let signInWithLabel = UILabel()
        signInWithLabel.text = "SIGN IN WITH"
        signInWithLabel.font = UIFont(name: "FjallaOne-Regular", size: 17)
        signInWithLabel.textColor = UIColor.white
        
        let facebookLogin = UIButton()
        let facebookButton = UIImage(named: "facebookButton")
        facebookLogin.setImage(facebookButton, for: .normal)
        facebookLogin.addTarget(self, action: #selector(facebookLoginButtonClicked), for: .touchUpInside)

        
        let googleLogin = UIButton()
        let googleButton = UIImage(named: "googleButton")
        googleLogin.setImage(googleButton, for: .normal)
        googleLogin.addTarget(self, action: #selector(googleLoginButtonClicked), for: .touchUpInside)

        
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
            make.width.height.equalTo(80)
            make.top.equalToSuperview().offset(screenHeight * 1/17)
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
        
        self.view.addSubview(phoneNumberField)
        phoneNumberField.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(loginLabel.snp.bottom).offset(5)
            make.width.equalTo(300)
            make.height.equalTo(40)
            make.left.equalTo(loginLabel.snp.left)
            make.right.equalToSuperview().offset(-screenWdith * 1/10)
        }
        
        self.view.addSubview(orView)
        orView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(phoneNumberField.snp.bottom).offset(20)
            make.left.equalTo(loginLabel.snp.left)
            make.right.equalToSuperview().offset(-screenWdith * 1/10)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
        }
        
        self.view.addSubview(emailAddressField)
        emailAddressField.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(orView.snp.bottom).offset(-15)
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.left.equalTo(loginLabel.snp.left)
            make.right.equalToSuperview().offset(-screenWdith * 1/10)
        }
        
        self.view.addSubview(passwordField)
        passwordField.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.top.equalTo(emailAddressField.snp.bottom).offset(10)
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
        
        self.view.addSubview(registerButton)
        registerButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(loginButton.snp.bottom).offset(15)
            make.width.equalTo(77)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
        }
        
        self.view.addSubview(orView2)
        orView2.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(registerButton.snp.bottom).offset(screenHeight * 1/40)
            make.left.equalTo(loginLabel.snp.left)
            make.right.equalToSuperview().offset(-screenWdith * 1/10)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
        }
        
        self.view.addSubview(signInWithLabel)
        signInWithLabel.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(100)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
            make.top.equalTo(orView2.snp.bottom).offset(15)
        }
        
        self.view.addSubview(facebookLogin)
        facebookLogin.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(signInWithLabel.snp.bottom).offset(15)
            make.width.equalTo(75)
            make.height.equalTo(75)
            make.centerX.equalToSuperview().offset(-60)
        }
        
        self.view.addSubview(googleLogin)
        googleLogin.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(facebookLogin.snp.top)
            make.width.equalTo(75)
            make.height.equalTo(75)
            make.centerX.equalToSuperview().offset(60)
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
    
    func isPhoneNumberValid(testNumber:String) -> Bool {
        //        TODO:  ADD PHONE NUMBER REG EXPRESSION
        let phoneNumberRegEx = "^\\d{3}-\\d{3}-\\d{4}$"
        
        let numberTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegEx)
        return numberTest.evaluate(with: testNumber)
    }
    
    @objc func login() {
        let email = emailAddressField.text ?? ""
        let password = passwordField.text ?? ""
        let phoneNumber = phoneNumberField.text ?? ""
        
        if email != "" {
            if password == "" {
                self.passwordField.shake(2, withDelta: 5, speed: 0.1, shakeDirection: .vertical)
            } else {
                if isValidEmail(testStr: email) {
                    activityIndicator.startAnimating()
                    loginToFirebase(email: email, password: password, phoneNumber: nil)
                } else {
                    showIncompleteError(errorMessage: "Please use the following email format: name@email.com")
                }
            }
        } else if phoneNumber != "" {
//            if isPhoneNumberValid(testNumber: phoneNumber) {
                activityIndicator.startAnimating()
                loginToFirebase(email: "", password: password, phoneNumber: phoneNumber)
//            } else {
//                showIncompleteError(errorMessage: "Please use the following phone number format: 334-000-0000")
//            }
        }
         
    }
    
    @objc func goToRegister() {
        self.navigationController?.pushViewController(SignUp(), animated: true)
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
        
        alert.showCustom("Reset Your Password", subTitle: "Please enter your email address below and we will send you an email to reset your password.", color: UIColor.white, icon: UIImage(named: "bigGLogo")!, closeButtonTitle: "Cancel", timeout: SCLAlertView.SCLTimeoutConfiguration(timeoutValue: 30.0, timeoutAction:timeoutAction), colorStyle: 1, colorTextButton: 2, circleIconImage: UIImage(), animationStyle: .rightToLeft)
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
                self.showIncompleteError(errorMessage: (error?.localizedDescription)!)
            } else {
                self.showIncompleteError(errorMessage: "Please check your inbox for an email.")
            }
        }
    }
    
    // LOGGING INTO FIREBASE
    func loginToFirebase(email: String?, password: String, phoneNumber: String?) {
        let userEmail = email
        
        if userEmail!.isEmpty {
            phoneNumberLogin(phoneNumber: phoneNumber!, password: password)
        } else {
            Auth.auth().signIn(withEmail: email!, password: password) { (user, error) in
                if let error = error {
                    let alert = SCLAlertView()
                    self.showIncompleteError(errorMessage: error.localizedDescription)

                    self.emailAddressField.shake(2, withDelta: 5, speed: 0.1, shakeDirection: .vertical)
                    self.passwordField.shake(2, withDelta: 5, speed: 0.1, shakeDirection: .vertical)
                    
                    
                } else if Auth.auth().currentUser != nil {
                    self.activityIndicator.stopAnimating()
                    self.showSuccessMessage()
                }
            }
        }
    }
    
    func phoneNumberLogin(phoneNumber: String!, password: String) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
            
            if let error = error {

                let alert = SCLAlertView()
                alert.showError("Oh No!", subTitle: error.localizedDescription)
                self.activityIndicator.stopAnimating()
                return
            } else {
                // Sign in using the verificationID and the code sent to the user
                
    //            ask user for verificationCode
                let alert = SCLAlertView()
                let verificationCodeField = alert.addTextField("Verificaiton code.")
                alert.addButton("Enter") {
                    if verificationCodeField.text != "" {
                        let verificationCode = verificationCodeField.text
                        let verificationID = UserDefaults.standard.string(forKey: "authVerificationID")

                        let credential = PhoneAuthProvider.provider().credential(
                            withVerificationID: verificationID!,
                            verificationCode: verificationCode!)
                        
                        Auth.auth().signIn(with: credential) { (authResult, error) in
                            if let error = error {
                                self.activityIndicator.stopAnimating()
                                self.showIncompleteError(errorMessage: error.localizedDescription)
                        
                                return
                            }
                            // User is signed in
                            self.showSuccessMessage()
                        }
                    }
                }
                
                let timeoutAction: SCLAlertView.SCLTimeoutConfiguration.ActionType = {
                    // action here
                }
                alert.showCustom("Please enter the verification code that was sent to your phone number. ", subTitle: "Standard SMS charges may apply.", color: UIColor.white, icon: UIImage(named: "bigGLogo")!, closeButtonTitle: "Cancel", timeout: SCLAlertView.SCLTimeoutConfiguration(timeoutValue: 30.0, timeoutAction:timeoutAction), colorStyle: 1, colorTextButton: 2, circleIconImage: UIImage(), animationStyle: .rightToLeft)
                
        }
        }
    }
    
//  FACEBOOK LOGIN
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
                self.showSuccessMessage()
            }
        }
    }
    
//  GOOGLE LOGIN
    @objc func googleLoginButtonClicked() {
        GIDSignIn.sharedInstance().signIn()
    }
    
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
    }
    
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
        showSuccessMessage()
    }
    
    public func signIn(_ signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                       withError error: Error!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
//            let userId = user.userID                  // For client-side use only!
//            let idToken = user.authentication.idToken // Safe to send to the server
//            let fullName = user.profile.name
//            let givenName = user.profile.givenName
//            let familyName = user.profile.familyName
//            let email = user.profile.email
            showSuccessMessage()
        } else {
            print("\(error.localizedDescription)")
            showIncompleteError(errorMessage: error.localizedDescription)

        }
    }

}
