//
//	Image.swift
//
//	Create by sameh mabrouk on 21/4/2016
//	Copyright © 2016. All rights reserved.
//

import Foundation

struct Image{

	var imageExtension : String!
	var path : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		imageExtension = dictionary["extension"] as? String
		path = dictionary["path"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if imageExtension != nil{
			dictionary["extension"] = imageExtension
		}
		if path != nil{
			dictionary["path"] = path
		}
		return dictionary
	}

}