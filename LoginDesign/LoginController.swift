//
//  ViewController.swift
//  LoginDesign
//
//  Created by Orange Apps on 17/11/2016.
//  Copyright © 2016 Orange Apps. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet var loginContainer: UIView!
    @IBOutlet var btnSignIn: UIButton!
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    lazy var actIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginContainer.layer.cornerRadius = 5
        btnSignIn.layer.cornerRadius = 5
        
        // Function for hiding the keyboard.
        self.hideKeyboardWhenTappedAround()
        // Move the view
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        btnSignIn.isEnabled = false
        email.addTarget(self, action: #selector(textFieldDidChange), for: UIControlEvents.editingChanged)
        password.addTarget(self, action: #selector(textFieldDidChange), for: UIControlEvents.editingChanged)
        
        // Change the text color of button
        btnSignIn.setTitleColor(UIColor(r: 255, g: 255, b: 255, a: 0.5), for: .normal)
        
        activitIndicator()
        
        // Transform the button
        btnSignIn.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        btnSignIn.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
    }
    
    // Create an activity indicator
    func activitIndicator() {
        actIndicator.isHidden = false
        actIndicator.center = self.view.center
        actIndicator.hidesWhenStopped = true
        actIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.white
        // Position the activity indicator inside the button
        actIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification) {
        
        if ((notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= 100
            }
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if ((notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += 100
            }
        }
    }
    
    
    @IBAction func btnSignIn(_ sender: UIButton) {
        if email.text == "admin" && password.text == "admin" {
            /*let mainController =
             self.storyboard?.instantiateViewController(withIdentifier: "MainController") as! MainController
             present(mainController, animated: true, completion: nil)*/
            
            // Create an activity indicator
//            let xCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: actIndicator, attribute: .centerX, multiplier: 1, constant: 0)
//            self.addConstraint(xCenterConstraint)
//            
//            let yCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: actIndicator, attribute: .centerY, multiplier: 1, constant: 0)
//            self.addConstraint(yCenterConstraint)
//            
            btnSignIn.addSubview(actIndicator)
            
            // Start the activity indicator
            actIndicator.startAnimating()
            
            // Disable the user intercation in the app
            UIApplication.shared.beginIgnoringInteractionEvents()
            
        } else {
            self.initAlertDialog(title: "Login Failed", message: "Invalid email address or password!", action: "OK")
        }
    }
    
    func initAlertDialog(title: String, message: String, action: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: action, style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func textFieldDidChange(textField: UITextField) {
        if email.text == "" || password.text == "" {
            btnSignIn.isEnabled = false
            btnSignIn.setTitleColor(UIColor(r: 255, g: 255, b: 255, a: 0.5), for: .normal)
        } else {
            btnSignIn.isEnabled = true
            btnSignIn.setTitleColor(UIColor(r: 255, g: 255, b: 255, a: 1), for: .normal)
        }
    }
    
    // Change the color the status bar to white background.
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
