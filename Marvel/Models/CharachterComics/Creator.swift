//
//	Creator.swift
//
//	Create by sameh mabrouk on 21/4/2016
//	Copyright © 2016. All rights reserved.
//

import Foundation

struct Creator{

	var available : Int!
	var collectionURI : String!
	var items : [Item]!
	var returned : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		available = (dictionary["available"] as? NSString)?.integerValue
		collectionURI = dictionary["collectionURI"] as? String
		items = [Item]()
		if let itemsArray = dictionary["items"] as? [NSDictionary]{
			for dic in itemsArray{
				let value = Item(fromDictionary: dic)
				items.append(value)
			}
		}
		returned = (dictionary["returned"] as? NSString)?.integerValue
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if available != nil{
			dictionary["available"] = available
		}
		if collectionURI != nil{
			dictionary["collectionURI"] = collectionURI
		}
		if items != nil{
			var dictionaryElements = [NSDictionary]()
			for itemsElement in items {
				dictionaryElements.append(itemsElement.toDictionary())
			}
			dictionary["items"] = dictionaryElements
		}
		if returned != nil{
			dictionary["returned"] = returned
		}
		return dictionary
	}

}