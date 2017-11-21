//
//  LoginSignInViewController.swift
//  socialmedia1
//
//  Created by Alex Alajbegovic on 11/20/17.
//  Copyright © 2017 Alex Alajbegovic. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginSignInViewController: UIViewController {

    @IBOutlet weak var signInSelector: UISegmentedControl!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    var isSignIn:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInSelectorChanged(_ sender: UISegmentedControl) {
        
        //Changes signIn selector from true to false or vise versa
        isSignIn = !isSignIn
        if isSignIn {
            signInLabel.text = "Sign In"
            signInButton.setTitle("Sign In", for: .normal)
        } else {
            signInLabel.text = "Sign Up"
            signInButton.setTitle("Sign Up", for: .normal)
        }
    }
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        
        // Do some form validation on email and password
        // Can check for # of chars or correct chars
        if let email = emailTextField.text, let password = passwordTextField.text {
            //Check if it's sign in
            if isSignIn {
                //Sign in the User with Firebase
                Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                    //Check that user != nil
                    if let u = user {
                        //User exists, go to home screen
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                    } else {
                        //Error, check error
                    }
                }
                
            } else {
                // Create a new user with Firebase
                Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                    //Check that user != nil
                    if let u = user {
                        //User exists, go to home screen
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                    } else {
                        //Error, check error
                    }
                }
                
            }
        }
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Dismiss keyboard when view is tapped
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }

}
