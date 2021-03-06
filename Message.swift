//
//  Message.swift
//  LocalBulb
//
//  Created by Alex Retter on 3/6/16.
//  Copyright © 2016 ReGroup. All rights reserved.
//

import Foundation
import Firebase

struct Message: FirebaseType {
    let kSender = "sender"
    let kReceiver = "receiver"
    let kText = "text"
    
    let sender: String
    let receiver: String
    let text: String
    var identifier: String?
    var endpoint: String {
        return "messages"
    }
    var jsonValue: [String: AnyObject] {
        return [kSender:sender, kReceiver:receiver, kText:text]
    }
    
    init(sender: String, receiver: String, text: String) {
        self.sender = sender
        self.receiver = receiver
        self.text =  text
    }
    
    init?(json: [String: AnyObject], identifier: String) {
        guard let sender = json[kSender] as? String,
            receiver = json[kReceiver] as? String,
            text = json[kText] as? String else {return nil}
        self.sender = sender
        self.receiver = receiver
        self.text = text
        self.identifier = identifier
    }
    
}


    
