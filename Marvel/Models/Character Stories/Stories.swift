//
//	Result.swift
//
//	Create by sameh mabrouk on 22/4/2016
//	Copyright © 2016. All rights reserved.
//

import Foundation

struct Stories{

	var characters : CharacterList!
	var comics : ComicList!
	var creators : Creator!
	var description : String!
	var events : Event!
	var id : Int!
	var modified : String!
	var originalIssue : OriginalIssue!
	var resourceURI : String!
	var series : Serie!
	var thumbnail : Thumbnail!
	var title : String!
	var type : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let charactersData = dictionary["characters"] as? NSDictionary{
				characters = CharacterList(fromDictionary: charactersData)
			}
		if let comicsData = dictionary["comics"] as? NSDictionary{
				comics = ComicList(fromDictionary: comicsData)
			}
		if let creatorsData = dictionary["creators"] as? NSDictionary{
				creators = Creator(fromDictionary: creatorsData)
			}
		description = dictionary["description"] as? String
		if let eventsData = dictionary["events"] as? NSDictionary{
				events = Event(fromDictionary: eventsData)
			}
		id = (dictionary["id"] as? Int)
        
		modified = dictionary["modified"] as? String
		if let originalIssueData = dictionary["originalIssue"] as? NSDictionary{
				originalIssue = OriginalIssue(fromDictionary: originalIssueData)
			}
		resourceURI = dictionary["resourceURI"] as? String
		if let seriesData = dictionary["series"] as? NSDictionary{
				series = Serie(fromDictionary: seriesData)
			}

        if let thumbnailData = dictionary["thumbnail"] as? NSDictionary{
            thumbnail = Thumbnail(fromDictionary: thumbnailData)
        }
        
		title = dictionary["title"] as? String
		type = dictionary["type"] as? String
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
		if events != nil{
			dictionary["events"] = events.toDictionary()
		}
		if id != nil{
			dictionary["id"] = id
		}
		if modified != nil{
			dictionary["modified"] = modified
		}
		if originalIssue != nil{
			dictionary["originalIssue"] = originalIssue.toDictionary()
		}
		if resourceURI != nil{
			dictionary["resourceURI"] = resourceURI
		}
		if series != nil{
			dictionary["series"] = series.toDictionary()
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
		return dictionary
	}

}