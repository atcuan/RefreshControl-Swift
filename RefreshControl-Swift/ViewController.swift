//
//  ViewController.swift
//  RefreshControl-Swift
//
//  Created by Moch on 10/13/14.
//  Copyright (c) 2014 Moch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var arrow: Arrow!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.arrow.rotation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

