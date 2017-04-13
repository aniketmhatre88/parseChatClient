//
//  LoginViewController.swift
//  parseChatClient
//
//  Created by Mhatre, Aniket on 4/12/17.
//  Copyright © 2017 Mhatre, Aniket. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func onSignUp(_ sender: UIButton) {
        var user = PFUser()
        user.username = emailTextField.text
        user.password = passwordTextField.text
        user.email = emailTextField.text
        
        // other fields can be set just like with PFObject
        //user["phone"] = "415-392-0202"
        
        user.signUpInBackground {
            (succeeded: Bool, error: Error?) -> Void in
            if let error = error {
                let errorString = error.localizedDescription as? NSString
                // Show the errorString somewhere and let the user try again.
                
                let alert = UIAlertController(title: "Alert", message: errorString as String?, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                
            } else {
                
                // Hooray! Let them use the app now.
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
    }
    
    @IBAction func onLogin(_ sender: UIButton) {
        
        PFUser.logInWithUsername(inBackground: emailTextField.text!, password:passwordTextField.text!) {
            (user: PFUser?, error: Error?) -> Void in
            if user != nil {
                self.performSegue(withIdentifier: "goToChat", sender: self)
                // Do stuff after successful login.
            } else {
                let alert = UIAlertController(title: "Alert", message: "Login not found!" as String?, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                // The login failed. Check error to see why.
            }
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
