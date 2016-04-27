//
//  DetailsViewInterface.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/26/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

// Defines the public interface that something else can use to drive the user interface
protocol DetailsViewInterface {
    func showCharacterComics(comics: [Comic])
    func showCharacterSeries(series: [Series])
    func showCharacterStories(stories: [Stories])
    func showCharacterEvents(events: [Events])
}
