//
//  MarvelFactory.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/18/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit
import CryptoSwift

class MarvelFactory: MarvelGateway {

    // Constants
    let KMarvelFactory_CharactersEndpoint                                   = "/public/characters"

    let KMarvelFactory_CharactersComicsEndpoint                             = "/comics"

    let KMarvelFactory_CharactersSeriesEndpoint                             = "/series"

    let KMarvelFactory_CharactersStoriesEndpoint                            = "/stories"

    let KMarvelFactory_CharactersEventsEndpoint                             = "/events"

    /* Marvel API keys */
    let KMarvelFactory_PublicKey:String                                     = "737b82b39ad17bd9d9dd8ad43a1dca7c"

    let KMarvelFactory_PrivateKey:String                                    = "a198e65e4b5bd6a95d68e9949fc24a880022eef9"

    var timeStamp:String?

    var hash:String?

    var publicKey:String?

    var privateKey:String?


    // Shared Instance
    let networkingManager:Networking = Networking.sharedInstance


    func getPublicKey() -> String?{
        if self.publicKey == nil {
            self.publicKey = KMarvelFactory_PublicKey
        }
        return self.publicKey
    }

    func getPrivateKey() -> String?{
        if self.privateKey == nil {
            self.privateKey = KMarvelFactory_PrivateKey
        }
        return self.privateKey
    }

    // MARK: - Hashcode Generation

    /** Generating hashcode for marvel API*/
    // Using CommonCrypto in Swift is tricky because it is not a standalone module, so you cannot just import CommonCrypto. Of course we can make a Bridging Header and and #import <CommonCrypto/CommonCrypto.h> in that header.
    // So we will use CryptoSwift library for generating MD5.

    func generateTimeStamp() -> String? {
        if self.timeStamp == nil {
            self.timeStamp = String (NSDate.timeIntervalSinceReferenceDate())
            //print("timeStamp \(self.timeStamp)")
        }
        return self.timeStamp
    }

    /**
     Get time stamp, privateKey and publicKey concatenated as one string.

     - returns: timestampedKeys as ts+privateKey+publicKey
     */
    func timestampedKeys() -> String? {

        guard let time = self.generateTimeStamp()
            else {
                return nil
        }
        guard let publicKey = self.getPublicKey()
            else {
                return nil
        }
        guard let privateKey = self.getPrivateKey()
            else {
                return nil
        }
        return time + privateKey + publicKey
    }

    /**
     Generate hash a md5 digest of the ts parameter, your private key and your public key.

     - parameter timestampedKeys: ts+privateKey+publicKey

     - returns: Hashed String
     */
    func calculateMD5(timestampedKeys: String?) -> String? {

        guard let keys = timestampedKeys
            else {
                return nil
        }

        guard let hash = self.hash
            else{
                self.hash = keys.md5()
                return self.hash
        }
        return hash
    }


    /**
     Get url parameters that consists of ts, apikey and hash

     - returns: url parameters as tuple grouping multiple values(ts, apiKey, hash) into a single compound value (URLParameters).
     */
    func URLParameters() -> (String, String, String)?  {

        guard let hashedKey = self.calculateMD5(self.timestampedKeys())
            else {
                return nil
        }
        guard let time = self.timeStamp
            else {
                return nil
        }
        guard let apiKey = self.getPublicKey()
            else {
                return nil
        }

        return (time, apiKey, hashedKey)
//        return "ts=" + time + "&apikey=" + privateKey + "&hash=" + hashedKey
    }
}
