//
//	Result.swift
//
//	Create by sameh mabrouk on 23/4/2016
//	Copyright © 2016. All rights reserved.
//

import Foundation

struct Events{

	var characters : Character!
	var comics : Comic!
	var creators : Creator!
	var description : String!
	var end : String!
	var id : Int!
	var modified : String!
	var next : Next!
	var previous : Previou!
	var resourceURI : String!
	var series : Serie!
	var start : String!
	var stories : Storie!
	var thumbnail : Thumbnail!
	var title : String!
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
		end = dictionary["end"] as? String
		id = (dictionary["id"] as? Int)
		modified = dictionary["modified"] as? String
		if let nextData = dictionary["next"] as? NSDictionary{
				next = Next(fromDictionary: nextData)
			}
		if let previousData = dictionary["previous"] as? NSDictionary{
				previous = Previou(fromDictionary: previousData)
			}
		resourceURI = dictionary["resourceURI"] as? String
		if let seriesData = dictionary["series"] as? NSDictionary{
				series = Serie(fromDictionary: seriesData)
			}
		start = dictionary["start"] as? String
		if let storiesData = dictionary["stories"] as? NSDictionary{
				stories = Storie(fromDictionary: storiesData)
			}
		if let thumbnailData = dictionary["thumbnail"] as? NSDictionary{
				thumbnail = Thumbnail(fromDictionary: thumbnailData)
			}
		title = dictionary["title"] as? String
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
		if end != nil{
			dictionary["end"] = end
		}
		if id != nil{
			dictionary["id"] = id
		}
		if modified != nil{
			dictionary["modified"] = modified
		}
		if next != nil{
			dictionary["next"] = next.toDictionary()
		}
		if previous != nil{
			dictionary["previous"] = previous.toDictionary()
		}
		if resourceURI != nil{
			dictionary["resourceURI"] = resourceURI
		}
		if series != nil{
			dictionary["series"] = series.toDictionary()
		}
		if start != nil{
			dictionary["start"] = start
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