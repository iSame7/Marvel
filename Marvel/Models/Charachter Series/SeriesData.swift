//
//	Data.swift
//
//	Create by sameh mabrouk on 22/4/2016
//	Copyright © 2016. All rights reserved.
//

import Foundation

struct SeriesData{

	var count : Int!
	var limit : Int!
	var offset : Int!
	var results : [Series]!
	var total : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		count = (dictionary["count"] as? Int)
		limit = (dictionary["limit"] as? Int)
		offset = (dictionary["offset"] as? Int)
		results = [Series]()
		if let resultsArray = dictionary["results"] as? [NSDictionary]{
			for dic in resultsArray{
				let value = Series(fromDictionary: dic)
				results.append(value)
			}
		}
		total = (dictionary["total"] as? Int)
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if count != nil{
			dictionary["count"] = count
		}
		if limit != nil{
			dictionary["limit"] = limit
		}
		if offset != nil{
			dictionary["offset"] = offset
		}
		if results != nil{
			var dictionaryElements = [NSDictionary]()
			for resultsElement in results {
				dictionaryElements.append(resultsElement.toDictionary())
			}
			dictionary["results"] = dictionaryElements
		}
		if total != nil{
			dictionary["total"] = total
		}
		return dictionary
	}

}