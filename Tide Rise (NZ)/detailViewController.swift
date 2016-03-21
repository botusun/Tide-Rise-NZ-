//
//  detailViewController.swift
//  Tide Rise (NZ)
//
//  Created by Botu Sun on 22/03/16.
//  Copyright © 2016 Botu Sun. All rights reserved.
//

import Foundation
import UIKit

class detailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var selectedBeach = NSUserDefaults.standardUserDefaults().stringForKey("selectedBeach")
        self.title = selectedBeach
    }

}