//
//  seaTide.swift
//  Tide Rise (NZ)
//
//  Created by Botu Sun on 22/03/16.
//  Copyright © 2016 Botu Sun. All rights reserved.
//

import Foundation


class seaTide {
    var time: Int
    var tideHeight: Double
    
    init?(time: Int, tideHeight: Double) {
        self.time = time
        self.tideHeight = tideHeight
    }
}