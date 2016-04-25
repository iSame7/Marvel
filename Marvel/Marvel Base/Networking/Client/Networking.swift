//
//  APIManager.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/18/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit
import Alamofire


@objc public protocol ResponseObjectSerializable {
    init(response: NSHTTPURLResponse, representation: AnyObject)
}
extension Alamofire.Request {

}


/**
 * Response Object Collection Extension
 */

@objc public protocol ResponseCollectionSerializable {
    //    static func collection(response response: NSHTTPURLResponse, representation: AnyObject) -> [Self]
}

/**
 * Our Networking class
 */
final class Networking {

    // SharedInstance
    static let sharedInstance:Networking = Networking()

    // Get nearby events by a provided Zip Code
    class func getEventsNearby() {
    }

    class func checkUserNameAvailability(userName:String) {
        Alamofire.request(.GET, "https://fbackendnew.azurewebsites.net/api/Users", parameters:  ["Username": userName])
            .responseJSON { result in
                print(result)
                debugPrint(result)

                print("Parsed JSON: \(result)")
        }
    }


    class func signUpNewUser() {
        Alamofire.request(.POST, "https://fbackendnew.azurewebsites.net/api/Users", parameters:  ["Email": "mabrouksameh@gmail.com", "Username": "smapps", "Password": "123", "Client_Id": "iOS", "Client_Secret": "42d83b0e-02d1-4cba-894c-e337f7efe11e"])
            .responseJSON { result in
                print(result)
                debugPrint(result)

                print("Parsed JSON: \(result)")
        }
    }
}


enum Router: URLRequestConvertible{

    static let baseURLString = kMarvelAPIClient_BaseURL + kMarvelAPIVersion
    static let clientId = "iOS"
    static let clientSecret = "42d83b0e-02d1-4cba-894c-e337f7efe11e"


    case characters(endpoint:String,limit:String , urlParams:(String, String, String))
    case FilterCharacters(endpoint:String, name:String, limit:String , urlParams:(String, String, String))
    case CharactersComics(endpoint:String,limit:String , urlParams:(String, String, String))
    case NewUser(String, String, String)
    case checkUserNameAvailability(String)
    case checkEmailAvailability(String)


    var method: Alamofire.Method {
        switch self {
        case .NewUser:
            return .POST
        case .checkUserNameAvailability:
            return .GET
        case .checkEmailAvailability:
            return .GET
        case .characters:
            return .GET
        case .CharactersComics:
            return .GET
        case .FilterCharacters:
            return .GET
        }

    }

    var path: String {
        switch self {
        case .NewUser, .checkEmailAvailability, .checkUserNameAvailability:
            return "/users"
        case .characters(let endpoint, _, (_, _, _)):
            return endpoint
        case .CharactersComics(let endpoint, _, (_, _, _)):
            return endpoint
        case .FilterCharacters(let endpoint, _, _, (_, _, _)):
            return endpoint
        }
    }

    var parameters: [String: AnyObject]? {
        switch self {
        case .NewUser (let userName, let email, let password):
            let params = ["Username": userName, "Email": "\(email)", "Password": password, "Client_Id": Router.clientId,  "Client_Secret": Router.clientSecret]
            return params

        case .checkUserNameAvailability(let userName):
            let params = ["Username": userName]
            return params

        case .checkEmailAvailability(let email):
            let params = ["Email": email]
            return params

        case .characters(_,  let limit, (let ts,  let apiKey, let hash)):
            let params = ["ts": ts, "apikey": apiKey, "hash": hash, "limit": limit]
            return params

        case .CharactersComics(_,  _, (let ts,  let apiKey, let hash)):
            let params = ["ts": ts, "apikey": apiKey, "hash": hash]
            return params

        case .FilterCharacters(_, let name, let limit, (let ts,  let apiKey, let hash)):
            let params = ["nameStartsWith": name, "ts": ts, "apikey": apiKey, "hash": hash, "limit": limit]
            return params
        }


    }

    // MARK: URLRequestConvertible
    var URLRequest: NSMutableURLRequest {
        let URL = NSURL(string: Router.baseURLString)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        print("DEBUG: Marvel API URL: \(mutableURLRequest)")
        mutableURLRequest.HTTPMethod = method.rawValue
        let encoding = Alamofire.ParameterEncoding.URL
        return encoding.encode(mutableURLRequest, parameters: parameters).0
    }
}
