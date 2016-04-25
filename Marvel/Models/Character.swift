//
//	Result.swift
//
//	Create by sameh mabrouk on 18/4/2016
//	Copyright © 2016. All rights reserved.
//

import Foundation

struct Character{

	var comics : ComicList!
	var description : String?
	var events : Event!
	var id : Int!
	var modified : String!
	var name : String?
	var resourceURI : String!
	var series : Serie!
	var stories : Storie!
	var thumbnail : Thumbnail!
	var urls : [Url]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let comicsData = dictionary["comics"] as? NSDictionary{
				comics = ComicList(fromDictionary: comicsData)
			}
		description = dictionary["description"] as? String
		if let eventsData = dictionary["events"] as? NSDictionary{
				events = Event(fromDictionary: eventsData)
			}
		id = (dictionary["id"] as? Int)
		modified = dictionary["modified"] as? String
		name = dictionary["name"] as? String
		resourceURI = dictionary["resourceURI"] as? String
		if let seriesData = dictionary["series"] as? NSDictionary{
				series = Serie(fromDictionary: seriesData)
			}
		if let storiesData = dictionary["stories"] as? NSDictionary{
				stories = Storie(fromDictionary: storiesData)
			}
		if let thumbnailData = dictionary["thumbnail"] as? NSDictionary{
				thumbnail = Thumbnail(fromDictionary: thumbnailData)
			}
		urls = [Url]()
		if let urlsArray = dictionary["urls"] as? [NSDictionary]{
			for dic in urlsArray{
				let value = Url(fromDictionary: dic)
				urls.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if comics != nil{
			dictionary["comics"] = comics.toDictionary()
		}
		if description != nil{
			dictionary["description"] = description
		}
		if events != nil{
			dictionary["events"] = events.toDictionary()
		}
		if id != nil{
			dictionary["id"] = id
		}
		if modified != nil{
			dictionary["modified"] = modified
		}
		if name != nil{
			dictionary["name"] = name
		}
		if resourceURI != nil{
			dictionary["resourceURI"] = resourceURI
		}
		if series != nil{
			dictionary["series"] = series.toDictionary()
		}
		if stories != nil{
			dictionary["stories"] = stories.toDictionary()
		}
		if thumbnail != nil{
			dictionary["thumbnail"] = thumbnail.toDictionary()
		}
		if urls != nil{
			var dictionaryElements = [NSDictionary]()
			for urlsElement in urls {
				dictionaryElements.append(urlsElement.toDictionary())
			}
			dictionary["urls"] = dictionaryElements
		}
		return dictionary
	}

}