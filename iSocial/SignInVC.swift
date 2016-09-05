//
//  ViewController.swift
//  iSocial
//
//  Created by Chao Tan on 9/4/16.
//  Copyright © 2016 Chao Tan. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit


class SignInVC: UIViewController {

    @IBOutlet weak var emailField: MainField!
    @IBOutlet weak var pwdField: MainField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func emailField(_ sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    @IBAction func pwdField(_ sender: AnyObject) {
        self.view.endEditing(true)
    }

// Setting up Facebook LogIn btn
    @IBAction func facebookBtnTapped(_ sender: AnyObject) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("JESS: Unable to authenticte with Facebook - \(error)")
            } else if result?.isCancelled == true {
                print("JESS: User canceled Facebook authentication")
            } else {
                print ("JESS: Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)       //run this
            }
        }
    }

    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in     //Authenticating Firebase
            if error != nil {
                print("JESS: Unable to authenticate with Firebase - \(error)")
            } else {
                print("JESS: Successfully authenticated with Firebase")
            }
        })
    }
    
// Checking if field has text
    @IBAction func signInBtn(_ sender: AnyObject) {
        if let email = emailField.text, let pwd = pwdField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("JESS: Email User authenticated with Firebase...2")       // User is good and logged in == YAHHH!!!
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("JESS: Unable to authenticate with Firebase using email")
                        } else {
                            print("JESS: Successfully authenticated with Firebase")
                        }
                    })
                }
            })
        }
    }
}












