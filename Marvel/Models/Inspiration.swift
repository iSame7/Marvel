//
//  Inspiration.swift
//  RWDevCon
//
//  Created by Mic Pringle on 02/03/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class Inspiration: Session {
  
  class func allInspirations() -> [Inspiration] {
    var inspirations = [Inspiration]()
    if let URL = NSBundle.mainBundle().URLForResource("Inspirations", withExtension: "plist") {
      if let tutorialsFromPlist = NSArray(contentsOfURL: URL) {
        for dictionary in tutorialsFromPlist {
          let inspiration = Inspiration(dictionary: dictionary as! NSDictionary)
          inspirations.append(inspiration)
        }
      }
    }
    return inspirations
  }
  
}
