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
        self.arrow.layer.borderColor = UIColor.redColor().CGColor
        self.arrow.layer.borderWidth = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

