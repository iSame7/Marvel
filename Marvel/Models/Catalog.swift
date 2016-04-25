//
//  Catalog.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/21/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

/***
 This is a singleton that contains a hard-coded collection of charachter categories like comics, series, stories, events.
 */
class Catalog: NSObject {

    static let sharedInstance = Catalog()
    let categories:[String]
    var limits:[Int]     // Shared array used for loading more data in horizontal collection views.
    var comics = [Comic]()

    override init(){
        categories = ["", "COMICS", "SERIES", "Stories", "Events", "RELATED LINKS"]
        limits = [0, 6, 6, 6, 6, 0]
    }
}
