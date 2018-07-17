//
//  ViewController.swift
//  sample-localpush
//
//  Created by koux2 on 2018/07/17.
//  Copyright © 2018年 koux2. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func didTapButton(_ sender: Any) {
        for i in 0...5 {
            let seconds: Int = 5
            
            let content = UNMutableNotificationContent()
            content.title = "ローカルプッシュだよ"
            content.subtitle = "\(i) test"
            content.body = "test body"
            content.sound = UNNotificationSound.default()
            
            let trigger = UNTimeIntervalNotificationTrigger(
                timeInterval: Double(seconds),
                repeats: false)
            
            let request = UNNotificationRequest(
                identifier: "TIMER\(i)",
                content: content,
                trigger: trigger)
            
            let center = UNUserNotificationCenter.current()
            center.add(request) { (error) in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
            
            print("pushed:\(i)")
        }
    }
}

