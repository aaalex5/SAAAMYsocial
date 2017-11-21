//
//  AddressViewController.swift
//  socialmedia1
//
//  Created by Alex Alajbegovic on 11/20/17.
//  Copyright © 2017 Alex Alajbegovic. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddressViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    var ref:DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addEvent(_ sender: Any) {
        //Like JSON-tree, setting a post under the name "Events"
        //Set's value of the "event" to text inputted by user!
        ref?.child("Events").childByAutoId().setValue(textView.text)
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelEvent(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
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
