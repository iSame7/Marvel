//
//  FilterInteractor.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/25/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

class FilterInteractor: NSObject, FilterInteractorInput {

    var output: ListInteractorOutput?

    // Gateway that is our abstraction for all operation of getting data from network.
    var gateway:MarvelGateway?

    init<T:MarvelGateway>(marvelgateway: T) {
        self.gateway = marvelgateway
    }

    // MARK: - ListInteractorInput implementation

    func getCharacters(limit limit: Int, name: String) {

        self.gateway!.filterCharacters(limit, name: name, completionHandler: { (characters) in
            self.output?.foundCharacters(characters)
        }) { (error) -> Void in
        }
    }
    
}
