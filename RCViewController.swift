//
//  RCViewController.swift
//  RenewedVision1
//
//  Created by Wyatt Baggett on 11/1/16.
//  Copyright © 2016 Wyatts Mobile Development. All rights reserved.
//

import Cocoa
import CoreGraphics

class RCViewController: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        let colorTop = NSColor(red: 48 / 255, green: 35 / 255, blue: 174 / 255, alpha: 1)
        let colorBottom = NSColor(red: 200 / 255, green: 109 / 255, blue: 215 / 255, alpha: 1)
        let gradient = NSGradient(colors: [colorTop, colorBottom])
        gradient?.draw(in: dirtyRect, angle: 90)
    }
    
}
