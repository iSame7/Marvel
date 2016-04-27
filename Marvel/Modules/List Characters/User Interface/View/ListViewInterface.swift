//
//  ListViewInterface.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/25/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

// Defines the public interface that something else can use to drive the user interface
protocol ListViewInterface {
    func showCharacters(characters: [Character])
}
