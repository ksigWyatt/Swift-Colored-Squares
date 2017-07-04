//  ViewController.swift
//  RenewedVision1
//
//  Created by Wyatt Baggett on 10/27/16.
//  Copyright © 2016 Wyatts Mobile Development. All rights reserved.

/*
 NOTES:
 
 10/28) Gradient is a lot harder than I thought... take a look later
 
 11/4) Added much of the UI and functionality for button presses ... Just now
 need to add logic to it all.
 
 11/5) Made a lot of progress on the project today ... Got most of the work done
 on much of the logic. Gradient is still a pain - but I think we can get something
 that works well enough. I have an idea on how to make it work but it still will
 create issues for a user when they are trying to reconfigure settings later on.
 
 11/6) Trying to implent some kind of if statement for the gradient options...
 might end up being a huge if statement much like the fill color selection box is.
 I want it to create a .title String value and if the string value equals the 
 name of the color then it will work. But it's not working properly. :/
 
    Part 2 - Got it to work ... it's 100 lines so it's immensely inefficient but
    it works. 

 11/7) FINALLY WE DID IT! I got the Adding/Removing bordersto work... 
 Had to look up some libraries for an extension for NSView to make it work.
 
    Part 2 - I feel like the removing is slightly cheating a bit because it looks
    removed but it's really just another border the same color on top of it.
    Because there isn't a way that I've seen to use something like removeBorderSide()
 
    Part 3 - Added some Launch icons and some other goodies. All Done! 
 
 -- Wyatt Baggett
 */

import Cocoa
import CoreGraphics
import AppKit

class ViewController: NSViewController {

    @IBOutlet weak var borderSize: NSTextField!
    @IBOutlet weak var borderSideRemove: NSButton!
    @IBOutlet weak var gradientButtons: NSButton!
    @IBOutlet weak var RVCustomView: NSView!
    @IBOutlet weak var colorFillSelector: NSPopUpButton!
    @IBOutlet weak var colorSelection1: NSPopUpButton!
    @IBOutlet weak var colorSelection2: NSPopUpButton!
    @IBOutlet weak var addTopButton: NSButton!
    @IBOutlet weak var addBottomButton: NSButton!
    @IBOutlet weak var addRightButton: NSButton!
    @IBOutlet weak var addLeftButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let alert: NSAlert = NSAlert()
        alert.messageText = "Please Note"
        alert.informativeText = "Please use the gradient button last, as it " +
            "still isn't working properly. It will remove all other functions " +
            "that have been selected as well as prevent future edits. \n\nSorry " +
            "for any inconvenience. " 
        alert.alertStyle = NSAlertStyle.warning
        alert.addButton(withTitle: "OK")
        alert.addButton(withTitle: "Cancel")
        alert.runModal()
        
        //Setting color for Custom NSView
        RVCustomView.wantsLayer = true
        RVCustomView.layer?.backgroundColor = CGColor.init(red: 255, green: 255, blue: 255, alpha: 1)
        
        //Setting title for buttons and such
        gradientButtons.title = "Add Gradient"
        borderSideRemove.title = "Remove Border"
        
        //adding items to the color selector pannel
        colorFillSelector.removeAllItems()
        colorFillSelector.addItem(withTitle: "Clear")
        colorFillSelector.addItem(withTitle: "Red")
        colorFillSelector.addItem(withTitle: "Green")
        colorFillSelector.addItem(withTitle: "Blue")
        colorFillSelector.addItem(withTitle: "Black")
        colorFillSelector.addItem(withTitle: "White")
        colorFillSelector.addItem(withTitle: "Cyan")
        colorFillSelector.addItem(withTitle: "Yellow")
        colorFillSelector.addItem(withTitle: "Pink")
        colorFillSelector.addItem(withTitle: "Purple")
        colorFillSelector.addItem(withTitle: "Orange")
        
        //Initializing to Top Color Selector
        colorSelection1.removeAllItems()
        colorSelection1.addItem(withTitle: "Black")
        colorSelection1.addItem(withTitle: "White")
        colorSelection1.addItem(withTitle: "Red")
        colorSelection1.addItem(withTitle: "Green")
        colorSelection1.addItem(withTitle: "Blue")
        
        //Initializing to Bottom Color Selector
        colorSelection2.removeAllItems()
        colorSelection2.addItem(withTitle: "White")
        colorSelection2.addItem(withTitle: "Black")
        colorSelection2.addItem(withTitle: "Red")
        colorSelection2.addItem(withTitle: "Green")
        colorSelection2.addItem(withTitle: "Blue")
    }
    
//********************************** COLOR *************************************
    
    @IBAction func fillColor(_ sender: AnyObject) {
        
        if (colorFillSelector.titleOfSelectedItem == "Clear") {
            RVCustomView.layer?.backgroundColor = CGColor.clear
        }
        else if (colorFillSelector.titleOfSelectedItem == "Red") {
            RVCustomView.layer?.backgroundColor = CGColor.init(red: 1, green: 0, blue: 0, alpha: 1)
        }
        else if (colorFillSelector.titleOfSelectedItem == "Green") {
            RVCustomView.layer?.backgroundColor = CGColor.init(red: 0, green: 1, blue: 0, alpha: 1)
        }
        else if (colorFillSelector.titleOfSelectedItem == "Blue") {
            RVCustomView.layer?.backgroundColor = CGColor.init(red: 0, green: 0, blue: 1, alpha: 1)
        }
        else if (colorFillSelector.titleOfSelectedItem == "Black") {
            RVCustomView.layer?.backgroundColor = CGColor.black
        }
        else if (colorFillSelector.titleOfSelectedItem == "White") {
            RVCustomView.layer?.backgroundColor = CGColor.white
        }
        else if (colorFillSelector.titleOfSelectedItem == "Cyan") {
            RVCustomView.layer?.backgroundColor = CGColor.init(red: 0, green: 1, blue: 1, alpha: 1)
        }
        //For the rest of these I had to use genericCMYKC because the RGB was glitchy
        // When you try to get fancy with the colors
        else if (colorFillSelector.titleOfSelectedItem == "Yellow") {
            RVCustomView.layer?.backgroundColor = CGColor.init(genericCMYKCyan: 0, magenta: 0, yellow: 1, black: 0, alpha: 1)
        }
        else if (colorFillSelector.titleOfSelectedItem == "Pink") {
            RVCustomView.layer?.backgroundColor = CGColor.init(genericCMYKCyan: 0, magenta: 0.73, yellow: 0, black: 0, alpha: 1)
        }
        else if (colorFillSelector.titleOfSelectedItem == "Purple") {
            RVCustomView.layer?.backgroundColor = CGColor.init(genericCMYKCyan: 0.6, magenta: 0.8, yellow: 0, black: 0, alpha: 1)
        }
        else if (colorFillSelector.titleOfSelectedItem == "Orange") {
            RVCustomView.layer?.backgroundColor = CGColor.init(genericCMYKCyan: 0, magenta: 0.62, yellow: 1, black: 0, alpha: 1)
        }
        else {
            RVCustomView.layer?.backgroundColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
//************************* GRADIENT *******************************************
    
    @IBAction func gradientButton(_ sender: AnyObject) {
        
        print(gradientButtons.title)
        self.preferredContentSize = CGSize.init(width: 479, height: 292)
        RVCustomView.layer?.backgroundColor = CGColor.clear
        
        if (gradientButtons.title == "Add Gradient"){
            
            let layer = CAGradientLayer()
            layer.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
            
            let Red = CGColor.init(genericCMYKCyan: 0, magenta: 1, yellow: 1, black: 0, alpha: 1)
            let Green = CGColor.init(genericCMYKCyan: 1, magenta: 0, yellow: 1, black: 0, alpha: 1)
            let Blue = CGColor.init(genericCMYKCyan: 1, magenta: 1, yellow: 0, black: 0, alpha: 1)
            let Black = CGColor.black
            let White = CGColor.white
            
            let color1 = colorSelection1.title
            let color2 = colorSelection2.title
            
            print("Gradient is now", color1, "and", color2)
            
        //This is the most efficient way I thought that I could do the validation 
        //I was trying to use the name of the selected index and assign that as
        //the index but it didn't work as I was hoping.
            
            if (colorSelection1.titleOfSelectedItem == "Black" && colorSelection2.titleOfSelectedItem == "White") {
                layer.colors = [Black,White]
                RVCustomView.layer?.addSublayer(layer)
            }
            else if (colorSelection1.titleOfSelectedItem == "Black" && colorSelection2.titleOfSelectedItem == "Black") {
                layer.colors = [Black,Black]
                RVCustomView.layer?.addSublayer(layer)
            }
            else if (colorSelection1.titleOfSelectedItem == "Black" && colorSelection2.titleOfSelectedItem == "Blue") {
                layer.colors = [Black,Blue]
                RVCustomView.layer?.addSublayer(layer)
            }
            else if (colorSelection1.titleOfSelectedItem == "Black" && colorSelection2.titleOfSelectedItem == "Green") {
                layer.colors = [Black,Green]
                RVCustomView.layer?.addSublayer(layer)
            }
            else if (colorSelection1.titleOfSelectedItem == "Black" && colorSelection2.titleOfSelectedItem == "Red") {
                layer.colors = [Black,Red]
                RVCustomView.layer?.addSublayer(layer)
            }
            else if (colorSelection1.titleOfSelectedItem == "White" && colorSelection2.titleOfSelectedItem == "Black") {
                layer.colors = [White,Black]
                RVCustomView.layer?.addSublayer(layer)
            }
            else if (colorSelection1.titleOfSelectedItem == "White" && colorSelection2.titleOfSelectedItem == "White") {
                layer.colors = [White,White]
                RVCustomView.layer?.addSublayer(layer)
            }
            else if (colorSelection1.titleOfSelectedItem == "White" && colorSelection2.titleOfSelectedItem == "Blue") {
                layer.colors = [White,Blue]
                RVCustomView.layer?.addSublayer(layer)
            }
            else if (colorSelection1.titleOfSelectedItem == "White" && colorSelection2.titleOfSelectedItem == "Green") {
                layer.colors = [White,Green]
                RVCustomView.layer?.addSublayer(layer)
            }
            else if (colorSelection1.titleOfSelectedItem == "White" && colorSelection2.titleOfSelectedItem == "Red") {
                layer.colors = [White,Red]
                RVCustomView.layer?.addSublayer(layer)
            }
            else if (colorSelection1.titleOfSelectedItem == "Blue" && colorSelection2.titleOfSelectedItem == "Black") {
                layer.colors = [Blue,Black]
                RVCustomView.layer?.addSublayer(layer)
            }
            else if (colorSelection1.titleOfSelectedItem == "Blue" && colorSelection2.titleOfSelectedItem == "White") {
                layer.colors = [Blue,White]
                RVCustomView.layer?.addSublayer(layer)
            }
            else if (colorSelection1.titleOfSelectedItem == "Blue" && colorSelection2.titleOfSelectedItem == "Blue") {
                layer.colors = [Blue,Blue]
                RVCustomView.layer?.addSublayer(layer)
            }
            else if (colorSelection1.titleOfSelectedItem == "Blue" && colorSelection2.titleOfSelectedItem == "Green") {
                layer.colors = [Blue,Green]
                RVCustomView.layer?.addSublayer(layer)
            }
            else if (colorSelection1.titleOfSelectedItem == "Blue" && colorSelection2.titleOfSelectedItem == "Red") {
                layer.colors = [Blue,Red]
                RVCustomView.layer?.addSublayer(layer)
            }
            else if (colorSelection1.titleOfSelectedItem == "Green" && colorSelection2.titleOfSelectedItem == "Black") {
                layer.colors = [Green,Black]
                RVCustomView.layer?.addSublayer(layer)
            }
            else if (colorSelection1.titleOfSelectedItem == "Green" && colorSelection2.titleOfSelectedItem == "White") {
                layer.colors = [Green,White]
                RVCustomView.layer?.addSublayer(layer)
            }
            else if (colorSelection1.titleOfSelectedItem == "Green" && colorSelection2.titleOfSelectedItem == "Blue") {
                layer.colors = [Green,Blue]
                RVCustomView.layer?.addSublayer(layer)
            }
            else if (colorSelection1.titleOfSelectedItem == "Green" && colorSelection2.titleOfSelectedItem == "Green") {
                layer.colors = [Green,Green]
                RVCustomView.layer?.addSublayer(layer)
            }
            else if (colorSelection1.titleOfSelectedItem == "Green" && colorSelection2.titleOfSelectedItem == "Red") {
                layer.colors = [Green,Red]
                RVCustomView.layer?.addSublayer(layer)
            }
            else if (colorSelection1.titleOfSelectedItem == "Red" && colorSelection2.titleOfSelectedItem == "Black") {
                layer.colors = [Red,Black]
                RVCustomView.layer?.addSublayer(layer)
            }
            else if (colorSelection1.titleOfSelectedItem == "Red" && colorSelection2.titleOfSelectedItem == "White") {
                layer.colors = [Red,White]
                RVCustomView.layer?.addSublayer(layer)
            }
            else if (colorSelection1.titleOfSelectedItem == "Red" && colorSelection2.titleOfSelectedItem == "Blue") {
                layer.colors = [Red,Blue]
                RVCustomView.layer?.addSublayer(layer)
            }
            else if (colorSelection1.titleOfSelectedItem == "Red" && colorSelection2.titleOfSelectedItem == "Green") {
                layer.colors = [Red,Green]
                RVCustomView.layer?.addSublayer(layer)
            }
            else if (colorSelection1.titleOfSelectedItem == "Red" && colorSelection2.titleOfSelectedItem == "Red") {
                layer.colors = [Red,Red]
                RVCustomView.layer?.addSublayer(layer)
            }
            else {
                layer.colors = [White,White]
                RVCustomView.layer?.addSublayer(layer)
            }
        }
        else{
            print("Whoops. This can't be right")
        }
    }
    
//********************************** BORDER ************************************
    
    @IBAction func borderColor(_ sender: AnyObject) {
        
        let randomNumber = Int(arc4random_uniform(5) + 1)
        
        if (randomNumber == 1) {
            RVCustomView.layer?.borderColor = CGColor.black
            print("Border is now Black")
        }
        else if (randomNumber == 2) {
            RVCustomView.layer?.borderColor = CGColor.init(red: 1, green: 0, blue: 0, alpha: 1)
            print("Border is now Red")
        }
        else if (randomNumber == 3) {
            RVCustomView.layer?.borderColor = CGColor.init(red: 0, green: 1, blue: 0, alpha: 1)
            print("Border is now Green")
        }
        else if (randomNumber == 4) {
            RVCustomView.layer?.borderColor = CGColor.init(red: 0, green: 0, blue: 1, alpha: 1)
            print("Border is now Blue")
        }
        else if (randomNumber == 5) {
            RVCustomView.layer?.borderColor = CGColor.white
            print("Border is now White")
        }
    }
    
    //this function is used when the user hits the "Enter" key inside the textField
    @IBAction func borderValue(_ sender: AnyObject) {
        print(borderSize.stringValue)
        
        if let number = NumberFormatter().number(from: borderSize.stringValue) {
            let value = CGFloat(number)
            RVCustomView.layer?.borderWidth = value
            
            if (value < 0) {
                
                //Reset the value to 0
                RVCustomView.layer?.borderWidth = 0
                
                func dialogOKCancel(question: String, text: String) -> Bool {
                    let alert: NSAlert = NSAlert()
                    alert.messageText = "Error!"
                    alert.informativeText = "You cannot have a negative Border Width. "
                    alert.alertStyle = NSAlertStyle.warning
                    alert.addButton(withTitle: "OK")
                    alert.addButton(withTitle: "Cancel")
                    return alert.runModal() == NSAlertFirstButtonReturn
                }
                
                _ = dialogOKCancel(question: "Ok?", text: "Choose your answer.")
            }
            else if (value == 0) {
                borderSideRemove.title = "Border Removed"
                
                func dialogOKCancel(question: String, text: String) -> Bool {
                    let alert: NSAlert = NSAlert()
                    alert.messageText = "Error!"
                    alert.informativeText = "The border was already removed. "
                    alert.alertStyle = NSAlertStyle.warning
                    alert.addButton(withTitle: "OK")
                    alert.addButton(withTitle: "Cancel")
                    return alert.runModal() == NSAlertFirstButtonReturn
                }
                
                _ = dialogOKCancel(question: "Ok?", text: "Choose your answer.")
            }
            else if (value >= 500) {
                
                //Reset the value to 0
                RVCustomView.layer?.borderWidth = 0
                
                func dialogOKCancel(question: String, text: String) -> Bool {
                    let alert: NSAlert = NSAlert()
                    alert.messageText = "Error!"
                    alert.informativeText = "That number is way too big. " +
                        "Try using a smaller number. "
                    alert.alertStyle = NSAlertStyle.warning
                    alert.addButton(withTitle: "OK")
                    alert.addButton(withTitle: "Cancel")
                    return alert.runModal() == NSAlertFirstButtonReturn
                }
                
                _ = dialogOKCancel(question: "Ok?", text: "Choose your answer.")
            }
            else {
                borderSideRemove.title = "Remove Border"
            }
        }
        
        if (borderSize.stringValue.isEmpty && borderSideRemove.title == "Remove Border") {
            
            RVCustomView.layer?.borderWidth = 0
            
            func dialogOKCancel(question: String, text: String) -> Bool {
                let alert: NSAlert = NSAlert()
                alert.messageText = "Error!"
                alert.informativeText = "You did not enter a number for Border Width. "
                alert.alertStyle = NSAlertStyle.warning
                alert.addButton(withTitle: "OK")
                alert.addButton(withTitle: "Cancel")
                return alert.runModal() == NSAlertFirstButtonReturn
            }

            _ = dialogOKCancel(question: "Ok?", text: "Choose your answer.")
        }
    }
    
    @IBAction func borderToggle(_ sender: AnyObject) {
        
        //Assigning int value to be used with CGFloat
        if let number = NumberFormatter().number(from: borderSize.stringValue) {
            let value = CGFloat(number)
            RVCustomView.layer?.borderWidth = value
        
            if (value > 0) {

                //Set new title
                RVCustomView.layer?.borderWidth = 0
                borderSize.stringValue = "0"
                borderSideRemove.title = "Border Removed"
            }
            else if (value == 0) {
            
                func dialogOKCancel(question: String, text: String) -> Bool {
                    let alert: NSAlert = NSAlert()
                    alert.messageText = "Error!"
                    alert.informativeText = "The border was already removed. "
                    alert.alertStyle = NSAlertStyle.warning
                    alert.addButton(withTitle: "OK")
                    alert.addButton(withTitle: "Cancel")
                    return alert.runModal() == NSAlertFirstButtonReturn
                }
            
                _ = dialogOKCancel(question: "Ok?", text: "Choose your answer.")
            }
        }
        
        if (borderSize.stringValue.isEmpty && borderSideRemove.title == "Remove Border") {
            
            RVCustomView.layer?.borderWidth = 0
            
            func dialogOKCancel(question: String, text: String) -> Bool {
                let alert: NSAlert = NSAlert()
                alert.messageText = "Error!"
                alert.informativeText = "You did not enter a number for Border Width. "
                alert.alertStyle = NSAlertStyle.warning
                alert.addButton(withTitle: "OK")
                alert.addButton(withTitle: "Cancel")
                return alert.runModal() == NSAlertFirstButtonReturn
            }
            
            _ = dialogOKCancel(question: "Ok?", text: "Choose your answer.")
        }
    }

//******************************* END BORDER ***********************************
//**************************** ADD BORDER SIDE *********************************
    
    @IBAction func addLeft(_ sender: AnyObject) {
        
        RVCustomView.layer?.backgroundColor = CGColor.white
        
        if (addLeftButton.title == "Add Left") {
            addLeftButton.title = "Remove Left"
            RVCustomView.layer?.borderWidth = 0
            RVCustomView.addBorderLeft(size: 10, color: CGColor.black)
        }
        else if (addLeftButton.title == "Remove Left") {
            addLeftButton.title = "Add Left"
            RVCustomView.addBorderLeft(size: 10, color: CGColor.white)
        }
    }
    
    @IBAction func addRight(_ sender: Any) {
        
        RVCustomView.layer?.backgroundColor = CGColor.white
        
        if (addRightButton.title == "Add Right") {
            addRightButton.title = "Remove Right"
            RVCustomView.layer?.borderWidth = 0
            RVCustomView.addBorderRight(size: 10, color: CGColor.black)
        }
        else if (addRightButton.title == "Remove Right") {
            addRightButton.title = "Add Right"
            RVCustomView.addBorderRight(size: 10, color: CGColor.white)
        }
    }

    //For some reason top and bottom are reversed - so I changed them to fix that
    @IBAction func addTop(_ sender: Any) {
        
        RVCustomView.layer?.backgroundColor = CGColor.white
        
        if (addTopButton.title == "Add Top") {
            addTopButton.title = "Remove Top"
            RVCustomView.layer?.borderWidth = 0
            RVCustomView.addBorderBottom(size: 10, color: CGColor.black)
        }
        else if (addTopButton.title == "Remove Top") {
            addTopButton.title = "Add Top"
            RVCustomView.addBorderBottom(size: 10, color: CGColor.white)
        }
    }
    
    //For some reason top and bottom are reversed - so I changed them to fix that
    @IBAction func addBottom(_ sender: Any) {
        
        RVCustomView.layer?.backgroundColor = CGColor.white
        
        if (addBottomButton.title == "Add Bottom") {
            addBottomButton.title = "Remove Bottom"
            RVCustomView.layer?.borderWidth = 0
            RVCustomView.addBorderTop(size: 10, color: CGColor.black)
        }
        else if (addBottomButton.title == "Remove Bottom") {
            addBottomButton.title = "Add Bottom"
            RVCustomView.addBorderTop(size: 10, color: CGColor.white)
        }
    }
    
//*************************** END ADD BORDER SIDE ******************************
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

//Use this for removing or adding the border sides.
extension NSView {
    
    public func addBorder(width: CGFloat, color: CGColor) {
        layer?.borderWidth = width
        layer?.borderColor = color
        layer?.masksToBounds = true
    }
    
    public func addBorderTop(size: CGFloat, color: CGColor) {
        addBorderUtility(x: 0, y: 0, width: frame.width, height: size, color: color)
    }
    
    public func addBorderTopWithPadding(size: CGFloat, color: CGColor, padding: CGFloat) {
        addBorderUtility(x: padding, y: 0, width: frame.width - padding*2, height: size, color: color)
    }
    
    public func addBorderBottom(size: CGFloat, color: CGColor) {
        addBorderUtility(x: 0, y: frame.height - size, width: frame.width, height: size, color: color)
    }
    
    public func addBorderLeft(size: CGFloat, color: CGColor) {
        addBorderUtility(x: 0, y: 0, width: size, height: frame.height, color: color)
    }
    
    public func addBorderRight(size: CGFloat, color: CGColor) {
        addBorderUtility(x: frame.width - size, y: 0, width: size, height: frame.height, color: color)
    }
    
    fileprivate func addBorderUtility(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, color: CGColor) {
        let border = CALayer()
        border.backgroundColor = color
        border.frame = CGRect(x: x, y: y, width: width, height: height)
        layer?.addSublayer(border)
    }
}
