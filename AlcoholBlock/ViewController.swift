//
//  ViewController.swift
//  AlcoholBlock
//
//  Created by joseewu on 2018/9/7.
//  Copyright © 2018年 com.js. All rights reserved.
//

import UIKit
import Geth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         let datadir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let keyStoreJson:[String:Any] = ["version":9999] //follow keyStore data format
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: keyStoreJson, options: JSONSerialization.WritingOptions.init(rawValue: 0))
            let new = GethNewKeyStore("\(datadir)/keystore", GethLightScryptN, GethLightScryptP)
            let oldKeyStore = try new?.importKey(jsonData, passphrase: "12345678a", newPassphrase: "12345678a")
            let accounts = new?.getAccounts()
            print(accounts)
            let firstAccount = try accounts?.get(0)
            print(firstAccount?.getAddress())
            print(oldKeyStore?.getAddress())
        } catch {

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

