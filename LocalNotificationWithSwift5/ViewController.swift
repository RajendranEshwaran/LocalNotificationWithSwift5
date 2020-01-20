//
//  ViewController.swift
//  LocalNotificationWithSwift5
//
//  Created by gomathi saminathan on 1/18/20.
//  Copyright © 2020 Rajendran Eshwaran. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController , UNUserNotificationCenterDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
// Requesting for authorization
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert , .badge , .sound , .announcement , .criticalAlert], completionHandler: {didAllow , error in })

    }

    @IBAction func createNotification(sender : UIButton)
    {
        // creating notification content
        let content = UNMutableNotificationContent()
        
        content.title = "Local Notification"
        content.subtitle = "Here You Go"
        content.body = "Hi...Welcome to SwiftGenius"
        content.badge = 1
        
        // creating notification trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        
        // creating notification request
        let request = UNNotificationRequest(identifier: "LocalNotification", content: content, trigger: trigger)

        // assinging delegate to self
        UNUserNotificationCenter.current().delegate = self
        
        // adding notification to notification center
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // display the notification when apps in foreground
        completionHandler([.alert , .badge , .sound ])
    }
}

