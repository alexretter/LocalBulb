//
//  MakePostViewController.swift
//  LocalBulb
//
//  Created by Alex Retter on 3/5/16.
//  Copyright © 2016 ReGroup. All rights reserved.
//

import UIKit
import Firebase

class MakePostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var ref = Firebase(url: URL_BASE)
    
    @IBOutlet weak var postTextView: UITextView!
    
    @IBOutlet weak var postButton: MaterialButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var timer: NSTimer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("reload"), userInfo: nil, repeats: true)

        // Do any additional setup after loading the view.
    }
    
    func reload() {
        
        if postTextView.text == "" {
            postButton.enabled = false
        } else if postTextView.text != "" {
            postButton.enabled = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func postButtonTapped(sender: AnyObject) {
    
    
        
    ref.childByAppendingPath("Posts").childByAutoId().setValue(postTextView.text)
    ref.childByAppendingPath("users/\(ref.authData.uid)/post").childByAutoId().setValue(postTextView.text)
        
        
    self.navigationController?.popViewControllerAnimated(true)
    
    }

    @IBAction func cameraButtonTapped(sender: AnyObject) {
    
}


}