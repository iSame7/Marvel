//
//  ListInteractor.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/20/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

class ListInteractor: NSObject, ListInteractorInput {

    var output:ListInteractorOutput?

    // Gateway that is our abstraction for all operation of getting data from network.
    var gateway:MarvelGateway?

    init<T:MarvelGateway>(marvelgateway: T) {
        self.gateway = marvelgateway
    }

    // MARK: - ListInteractorInput implementation

    func getCharacters(limit limit: Int) {

        self.gateway!.characters(limit, completionHandler: { (characters) in

            self.output?.foundCharacters(characters)

        }) { (error) -> Void in
/*
            let nsError = error as! NSError

            let alert = UIAlertController(title: "Error", message: nsError.localizedDescription, preferredStyle: UIAlertControllerStyle.Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alert.addAction(defaultAction)
            self.presentViewController(alert, animated: true, completion: nil)
 */
        }
    }
    
}
