//
//  MarvelFactory+Comics.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/21/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit
import Alamofire

extension MarvelFactory {

    func charactersComics(limitMarvelNumberOfResources: Int, charachterId: String, completionHandler: (comics: [Comic]) -> Void, failure: (error: ErrorType?) -> Void) {

        // Get url params
        if let urlParams = self.URLParameters() {
            // Show status bar network indicator.
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            // call characters API.
            Alamofire.request(Router.CharactersComics(endpoint: KMarvelFactory_CharactersEndpoint + "/" + charachterId + KMarvelFactory_CharactersComicsEndpoint , limit: String(limitMarvelNumberOfResources) , urlParams: urlParams)).responseJSON { result in
                switch result.result {
                case .Success(let data):

                    if let JSON: AnyObject = data {
    
                        // Get json as Dictionary to be parsed.
                        if let jsonDict: NSDictionary = JSON as? NSDictionary {
                            let rootClass:ComicRootClass = ComicRootClass(fromDictionary: jsonDict)
                            completionHandler(comics: rootClass.data.results)
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
