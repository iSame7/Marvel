//
//  String+ UppercaseFirst.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/22/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

/** Extension to String class that add utility method to convert first character of string to uppercase letter*/
extension String {
    var first: String {
        return String(characters.prefix(1))
    }
    var last: String {
        return String(characters.suffix(1))
    }
    var uppercaseFirst: String {
        return first.uppercaseString + String(characters.dropFirst())
    }
}