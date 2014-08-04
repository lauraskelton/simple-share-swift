//
//  ViewController.swift
//  TipCalculator
//
//  Created by Main Account on 7/7/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SimpleShareDelegate {
  
  @IBOutlet var sharingItemIDs : UILabel!
    @IBOutlet var foundItemIDs : UILabel!
   
  func refreshUI() {
    sharingItemIDs.text = "Sharing Item IDs: \(SimpleShare.sharedInstance().myItemIDs)"
    SimpleShare.sharedInstance().delegate = self
  }
                                                                                
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    setRandomItemIDs()
    
    refreshUI()

  }
    func setRandomItemIDs() {
        func randomItemIDs() -> [NSString] {
            var itemIDArray = [NSString]()
            for i in 0..<12 {
                let randInt = Int(arc4random_uniform(10094))
                let randString = String(randInt)
                itemIDArray.append(randString)
            }
            return itemIDArray
        }
        
        SimpleShare.sharedInstance().myItemIDs = NSMutableArray(array:randomItemIDs())
        println("simpleshare item ids set: \(SimpleShare.sharedInstance().myItemIDs)")
    }
    
    @IBAction func findBluetoothItems(sender : AnyObject) {
        println("should find bluetooth items")
        SimpleShare.sharedInstance().findNearbyItems(self)
    }
    
    @IBAction func shareBluetoothItems(sender : AnyObject) {
        println("should share bluetooth items")
        SimpleShare.sharedInstance().shareMyItems(self)
    }

    func simpleShareDidFailWithMessage(failMessage: String!) {
        println("SimpleShare failed with message: \(failMessage)")

    }
    
    func simpleShareFoundFirstItems(itemIDs: [AnyObject]!) {
        println("SimpleShare found first items: \(itemIDs)")
        foundItemIDs.text = "Found Item IDs: \(itemIDs)"

    }
    
    func simpleShareFoundMoreItems(itemIDs: [AnyObject]!) {
        println("SimpleShare found more items: \(itemIDs)")

    }
    
    func simpleShareFoundNoItems(simpleShare: SimpleShare!) {
        println("SimpleShare found no items")
    }
}

