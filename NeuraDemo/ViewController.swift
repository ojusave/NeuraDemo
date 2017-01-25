//
//  ViewController.swift
//  NeuraDemo
//
//  Created by Ojus Save on 1/24/17.
//  Copyright © 2017 Neura. All rights reserved.
//

import UIKit
import NeuraSDK


class ViewController: UIViewController {

    let nSDK = NeuraSDK.sharedInstance()
    override func viewDidLoad() {
    
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loginToNeura(){
        let permissions: Array = [
            "presenceAtHome"
        ]
        
        NeuraSDK.sharedInstance().authenticate(withPermissions: permissions as [String], userInfo: nil, on: self, withHandler: { (token, error) in
            if (token != nil && error == nil) {
                //Handle post-login actions
            } else {
                //Handle error
                print(error!)
            }
        })
    }
    
    func subscribeToEvents1(){
        NeuraSDK.sharedInstance().subscribe(toEvent: "userArrivedHome", identifier: "_userArrivedHome", webHookID: nil) { (responseData, error) in
            if error != nil {
                print(error!)
                //Handle the error subscribing
            }
        }
        
    }
    
    @IBAction func SignIn(_ sender: Any) {
        loginToNeura()
        
    }
    
    @IBAction func subscribeToEvents(_ sender: Any) {
        
    }

}
