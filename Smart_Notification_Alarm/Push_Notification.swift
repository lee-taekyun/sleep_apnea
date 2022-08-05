//
//  Push_Notification.swift
//  Smart_Notification_Alarm
//
//  Created by SanwanLee on 2020/10/16.
//  Copyright © 2020 SanwanLee. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseMessaging
// To get it, touch the handleLogTokenTouch button and see log
let ReceiverFCMToken = "diqoDK4BJ0Sykj187B5khH:APA91bFa4rYeioJ9rMeQbkDxv9T47rIjtdD2cIp1Sr1vj2RdUQ6leVl6xipStkPgHE5iMOrlSXE6ThDNA8uD4HcbdQZCR9CgqGlGBHmezjQKU7kyYqepThoaK_ZQeQFxeOZ2np9xeOgs"
let db = Firestore.firestore()
// Please change it your Firebase Legacy server key
// Firebase -> Project settings -> Cloud messaging -> Legacy server key
let legacyServerKey = "AAAAUaY9JrA:APA91bHTZb3C450fKhftyw3bwN2Z5_ouT8s__iksMNHJl1gHI-XrnMS4qnL60etnT3E9s2sqdYnZbMra1CIg6oLn6dYc09W1ByWTNekka8TzeYvkPxQdACM444NbYG1se1gFUJqaL2I6"

struct Push_Notification: View {
    @State private var fcmTokenMessage = "fcmTokenMessage"
    @State private var instanceIDTokenMessage = "instanceIDTokenMessage"
    
    @State private var notificationTitle: String = ""
    @State private var notificationContent: String = ""
    var body: some View {
        VStack {
            Text(fcmTokenMessage).padding(20)
            Text(instanceIDTokenMessage).padding(20)
            Button(action: {
                self.handleLogTokenTouch()
                db.collection("Peripheral").document("FCMToken").setData(["Token": ReceiverFCMToken])
            }) {
                Text("Get user FCM Token String").font(.title)
            }.padding(20)
            TextField("Add Notification Title", text: $notificationTitle).textFieldStyle(RoundedBorderTextFieldStyle()).padding(20)
            TextField("Add Notification Content", text: $notificationContent).textFieldStyle(RoundedBorderTextFieldStyle()).padding(20)
            Button(action: {self.sendMessageTouser(to: ReceiverFCMToken, title: self.notificationTitle, body: self.notificationContent)
                self.notificationTitle = ""
                self.notificationContent = ""
            }) {
                Text("Send message to User").font(.title)
            }.padding(20)
        }
    }
    
    func sendMessageTouser(to token: String, title: String, body: String) {
        print("sendMessageTouser()")
        let urlString = "https://fcm.googleapis.com/fcm/send"
        let url = NSURL(string: urlString)!
        let paramString: [String : Any] = ["to" : token,
                                           "notification" : ["title" : title, "body" : body],
                                           "data" : ["user" : "test_id"]
        ]
        let request = NSMutableURLRequest(url: url as URL)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject:paramString, options: [.prettyPrinted])
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("key=\(legacyServerKey)", forHTTPHeaderField: "Authorization")
        let task =  URLSession.shared.dataTask(with: request as URLRequest)  { (data, response, error) in
            do {
                if let jsonData = data {
                    if let jsonDataDict  = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: AnyObject] {
                        NSLog("Received data:\n\(jsonDataDict))")
                    }
                }
            } catch let err as NSError {
                print(err.debugDescription)
            }
        }
        task.resume()
    }
    
    func handleLogTokenTouch() {
        // [START log_fcm_reg_token]
        let token = Messaging.messaging().fcmToken
        print("FCM token: \(token ?? "")")
        // [END log_fcm_reg_token]
        self.fcmTokenMessage  = "Logged FCM token: \(token ?? "")"

        // [START log_iid_reg_token]
        // [END log_iid_reg_token]
    }
}

