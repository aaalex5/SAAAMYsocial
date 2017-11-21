//
//  ViewController.swift
//  socialmedia1
//
//  Created by Alex Alajbegovic on 11/20/17.
//  Copyright © 2017 Alex Alajbegovic. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    var eventData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
        //Set firebase Reference
        ref = Database.database().reference()
        
        //Retrieve the posts and listen for changes
        databaseHandle = ref?.child("Events").observe(.childAdded, with: {(snapshot) in
        
            //code to execute when a child added under "Events"
            //Take the value from the snapshot and added it to the postData array
            
            //Changes value of snapshot (the key) to a string (if it can)
            let post = snapshot.value as? String
            //Checks if the post is a string, if not it won't enter conditional
            if let actualPost = post {
                //Add data to eventData array
                self.eventData.append(actualPost)
                //Update the tableView
                self.tableView.reloadData()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        cell?.textLabel?.text = eventData[indexPath.row]
        return cell!
        
    }
    
}

