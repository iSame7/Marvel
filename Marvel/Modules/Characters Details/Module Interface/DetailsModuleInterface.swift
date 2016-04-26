//
//  DetailsModuleInterface.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/26/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit
import ImageViewer

protocol DetailsModuleInterface {

    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    func updateView(limit limit: Int, characterId: String)

    func updateViewWithCharacterSeries (limit limit: Int, characterId: String)

    func updateViewWithCharacterStories (limit limit: Int, characterId: String)

    func updateViewWithCharacterEvents (limit limit: Int, characterId: String)

    func openImageViewer(galleryViewController: GalleryViewController)


}
