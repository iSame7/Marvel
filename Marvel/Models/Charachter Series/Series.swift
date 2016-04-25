//
//	Result.swift
//
//	Create by sameh mabrouk on 22/4/2016
//	Copyright © 2016. All rights reserved.
//

import Foundation

struct Series{

	var characters : Character!
	var comics : Comic!
	var creators : Creator!
	var description : String!
	var endYear : Int!
	var events : Event!
	var id : Int!
	var modified : String!
	var rating : String!
	var resourceURI : String!
	var startYear : Int!
	var stories : Storie!
	var thumbnail : Thumbnail!
	var title : String!
	var type : String!
	var urls : [Url]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let charactersData = dictionary["characters"] as? NSDictionary{
				characters = Character(fromDictionary: charactersData)
			}
		if let comicsData = dictionary["comics"] as? NSDictionary{
				comics = Comic(fromDictionary: comicsData)
			}
		if let creatorsData = dictionary["creators"] as? NSDictionary{
				creators = Creator(fromDictionary: creatorsData)
			}
		description = dictionary["description"] as? String
		endYear = (dictionary["endYear"] as? Int)
		if let eventsData = dictionary["events"] as? NSDictionary{
				events = Event(fromDictionary: eventsData)
			}
		id = (dictionary["id"] as? Int)
		modified = dictionary["modified"] as? String
		rating = dictionary["rating"] as? String
		resourceURI = dictionary["resourceURI"] as? String
		startYear = (dictionary["startYear"] as? Int)
		if let storiesData = dictionary["stories"] as? NSDictionary{
				stories = Storie(fromDictionary: storiesData)
			}
		if let thumbnailData = dictionary["thumbnail"] as? NSDictionary{
				thumbnail = Thumbnail(fromDictionary: thumbnailData)
			}
		title = dictionary["title"] as? String
		type = dictionary["type"] as? String
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
		var dictionary = NSMutableDictionary()
		if characters != nil{
			dictionary["characters"] = characters.toDictionary()
		}
		if comics != nil{
			dictionary["comics"] = comics.toDictionary()
		}
		if creators != nil{
			dictionary["creators"] = creators.toDictionary()
		}
		if description != nil{
			dictionary["description"] = description
		}
		if endYear != nil{
			dictionary["endYear"] = endYear
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
		if rating != nil{
			dictionary["rating"] = rating
		}
		if resourceURI != nil{
			dictionary["resourceURI"] = resourceURI
		}
		if startYear != nil{
			dictionary["startYear"] = startYear
		}
		if stories != nil{
			dictionary["stories"] = stories.toDictionary()
		}
		if thumbnail != nil{
			dictionary["thumbnail"] = thumbnail.toDictionary()
		}
		if title != nil{
			dictionary["title"] = title
		}
		if type != nil{
			dictionary["type"] = type
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