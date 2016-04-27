//
//  AppConstants.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/16/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit


// Slid Menu Layout constants

/* The heights are declared as constants outside of the class so they can be easily referenced elsewhere */

/* The height of the first visible cell */
let SlidingCellFeatureHeight: CGFloat           = 280
/* The height of the non-featured cell */
let SlidingCellCollapsedHeight: CGFloat         = 100
let SlidingMenuNormalImageCoverAlpha: CGFloat   = 0.5
let SlidingMenuFeaturedImageCoverAlpha: CGFloat = 0.2

/* Environment */
let kMarvelAPIClient_BaseURL                    = "http://gateway.marvel.com:80"

let kMarvelAPIVersion                           = "/v1"


/* ListCharachters constants */
// Count of marvel resources to load for first request. 
let KMarvelResourcesLimit                       = 6

/* Marvel API keys */
let KMarvelFactory_PublicKey:String             = "737b82b39ad17bd9d9dd8ad43a1dca7c"

let KMarvelFactory_PrivateKey:String            = "a198e65e4b5bd6a95d68e9949fc24a880022eef9"
