//
//  REMintFactory.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/18/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit
import Alamofire

extension MarvelFactory{


    func characters(limitMarvelNumberOfResources: Int, completionHandler: (characters: [Character]) -> Void, failure: (error: ErrorType?) -> Void) {

        // Get url params
        if let urlParams = self.URLParameters() {
            // Show status bar network indicator.
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            // call characters API.
            Alamofire.request(Router.characters(endpoint: KMarvelFactory_CharactersEndpoint, limit: String(limitMarvelNumberOfResources) , urlParams: urlParams)).responseJSON { result in
                switch result.result {
                case .Success(let data):

                    if let JSON: AnyObject = data {
                        //print("JSON: \(JSON)")
                        // Get json as Dictionary to be parsed.
                        if let jsonDict: NSDictionary = JSON as? NSDictionary {
                            let rootClass:RootClass = RootClass(fromDictionary: jsonDict)
                            completionHandler(characters: rootClass.data.results)
                        }
                        else{
                        }
                    }
                case .Failure(let error):
                    // this means there was a network failure - either the request
                    // wasn't sent (connectivity), or no response was received (server
                    // timed out).  If the server responds with a 4xx or 5xx error, that
                    // will be sent as a ".Success"-ful response.
                    print("Request failed with error: \(error)")
                    failure(error: error)
                }
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            }
        }
        
    }

    func filterCharacters(limitMarvelNumberOfResources: Int, name: String, completionHandler: (characters: [Character]) -> Void, failure: (error: ErrorType?) -> Void) {

        // Get url params
        if let urlParams = self.URLParameters() {
            // Show status bar network indicator.
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            // call characters API.
            Alamofire.request(Router.FilterCharacters(endpoint: KMarvelFactory_CharactersEndpoint, name: name, limit: String(limitMarvelNumberOfResources) , urlParams: urlParams)).responseJSON { result in
                switch result.result {
                case .Success(let data):

                    if let JSON: AnyObject = data {
                        //print("JSON: \(JSON)")
                        // Get json as Dictionary to be parsed.
                        if let jsonDict: NSDictionary = JSON as? NSDictionary {
                            let rootClass:RootClass = RootClass(fromDictionary: jsonDict)
                            completionHandler(characters: rootClass.data.results)
                        }
                        else{
                        }
                    }
                case .Failure(let error):
                    // this means there was a network failure - either the request
                    // wasn't sent (connectivity), or no response was received (server
                    // timed out).  If the server responds with a 4xx or 5xx error, that
                    // will be sent as a ".Success"-ful response.
                    print("Request failed with error: \(error)")
                    failure(error: error)
                }
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            }
        }
        
    }
    
}
