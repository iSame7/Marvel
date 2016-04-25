//
//	Result.swift
//
//	Create by sameh mabrouk on 21/4/2016
//	Copyright © 2016. All rights reserved.
//

import Foundation

struct Comic{

	var characters : Character!
	var collectedIssues : [ComicSummary]!
	var collections : [ComicSummary]!
	var creators : Creator!
	var dates : [Date]!
	var description : String!
	var diamondCode : String!
	var digitalId : Int!
	var ean : String!
	var events : Event!
	var format : String!
	var id : Int!
	var images : [Image]!
	var isbn : String!
	var issn : String!
	var issueNumber : Int!
	var modified : String!
	var pageCount : Int!
	var prices : [Price]!
	var resourceURI : String!
	var series : SeriesSummary!
	var stories : Storie!
	var textObjects : [TextObject]!
	var thumbnail : Thumbnail?
	var title : String!
	var upc : String!
	var urls : [Url]!
	var variantDescription : String!
	var variants : [ComicSummary]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let charactersData = dictionary["characters"] as? NSDictionary{
				characters = Character(fromDictionary: charactersData)
			}
		collectedIssues = [ComicSummary]()
		if let collectedIssuesArray = dictionary["collectedIssues"] as? [NSDictionary]{
			for dic in collectedIssuesArray{
                let value = ComicSummary(fromDictionary: dic)
				collectedIssues.append(value)
			}
		}
		collections = [ComicSummary]()
		if let collectionsArray = dictionary["collections"] as? [NSDictionary]{
			for dic in collectionsArray{
                let value = ComicSummary(fromDictionary: dic)
				collections.append(value)
			}
		}
		if let creatorsData = dictionary["creators"] as? NSDictionary{
				creators = Creator(fromDictionary: creatorsData)
			}
		dates = [Date]()
		if let datesArray = dictionary["dates"] as? [NSDictionary]{
			for dic in datesArray{
				let value = Date(fromDictionary: dic)
				dates.append(value)
			}
		}
		description = dictionary["description"] as? String
		diamondCode = dictionary["diamondCode"] as? String
		digitalId = (dictionary["digitalId"] as? NSString)?.integerValue
		ean = dictionary["ean"] as? String
		if let eventsData = dictionary["events"] as? NSDictionary{
				events = Event(fromDictionary: eventsData)
			}
		format = dictionary["format"] as? String
		id = (dictionary["id"] as? NSString)?.integerValue
		images = [Image]()
		if let imagesArray = dictionary["images"] as? [NSDictionary]{
			for dic in imagesArray{
				let value = Image(fromDictionary: dic)
				images.append(value)
			}
		}
		isbn = dictionary["isbn"] as? String
		issn = dictionary["issn"] as? String
		issueNumber = (dictionary["issueNumber"] as? NSString)?.integerValue
		modified = dictionary["modified"] as? String
		pageCount = (dictionary["pageCount"] as? NSString)?.integerValue
		prices = [Price]()
		if let pricesArray = dictionary["prices"] as? [NSDictionary]{
			for dic in pricesArray{
				let value = Price(fromDictionary: dic)
				prices.append(value)
			}
		}
		resourceURI = dictionary["resourceURI"] as? String
		if let seriesData = dictionary["series"] as? NSDictionary{
				series = SeriesSummary(fromDictionary: seriesData)
			}
		if let storiesData = dictionary["stories"] as? NSDictionary{
				stories = Storie(fromDictionary: storiesData)
			}
		textObjects = [TextObject]()
		if let textObjectsArray = dictionary["textObjects"] as? [NSDictionary]{
			for dic in textObjectsArray{
				let value = TextObject(fromDictionary: dic)
				textObjects.append(value)
			}
		}
		if let thumbnailData = dictionary["thumbnail"] as? NSDictionary{
				thumbnail = Thumbnail(fromDictionary: thumbnailData)
			}
		title = dictionary["title"] as? String
		upc = dictionary["upc"] as? String
		urls = [Url]()
		if let urlsArray = dictionary["urls"] as? [NSDictionary]{
			for dic in urlsArray{
				let value = Url(fromDictionary: dic)
				urls.append(value)
			}
		}
		variantDescription = dictionary["variantDescription"] as? String
		variants = [ComicSummary]()
		if let variantsArray = dictionary["variants"] as? [NSDictionary]{
			for dic in variantsArray{
                let value = ComicSummary(fromDictionary: dic)
				variants.append(value)
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
		if collectedIssues != nil{
			var dictionaryElements = [NSDictionary]()
			for collectedIssuesElement in collectedIssues {
				dictionaryElements.append(collectedIssuesElement.toDictionary())
			}
			dictionary["collectedIssues"] = dictionaryElements
		}
		if collections != nil{
			var dictionaryElements = [NSDictionary]()
			for collectionsElement in collections {
				dictionaryElements.append(collectionsElement.toDictionary())
			}
			dictionary["collections"] = dictionaryElements
		}
		if creators != nil{
			dictionary["creators"] = creators.toDictionary()
		}
		if dates != nil{
			var dictionaryElements = [NSDictionary]()
			for datesElement in dates {
				dictionaryElements.append(datesElement.toDictionary())
			}
			dictionary["dates"] = dictionaryElements
		}
		if description != nil{
			dictionary["description"] = description
		}
		if diamondCode != nil{
			dictionary["diamondCode"] = diamondCode
		}
		if digitalId != nil{
			dictionary["digitalId"] = digitalId
		}
		if ean != nil{
			dictionary["ean"] = ean
		}
		if events != nil{
			dictionary["events"] = events.toDictionary()
		}
		if format != nil{
			dictionary["format"] = format
		}
		if id != nil{
			dictionary["id"] = id
		}
		if images != nil{
			var dictionaryElements = [NSDictionary]()
			for imagesElement in images {
				dictionaryElements.append(imagesElement.toDictionary())
			}
			dictionary["images"] = dictionaryElements
		}
		if isbn != nil{
			dictionary["isbn"] = isbn
		}
		if issn != nil{
			dictionary["issn"] = issn
		}
		if issueNumber != nil{
			dictionary["issueNumber"] = issueNumber
		}
		if modified != nil{
			dictionary["modified"] = modified
		}
		if pageCount != nil{
			dictionary["pageCount"] = pageCount
		}
		if prices != nil{
			var dictionaryElements = [NSDictionary]()
			for pricesElement in prices {
				dictionaryElements.append(pricesElement.toDictionary())
			}
			dictionary["prices"] = dictionaryElements
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
		if textObjects != nil{
			var dictionaryElements = [NSDictionary]()
			for textObjectsElement in textObjects {
				dictionaryElements.append(textObjectsElement.toDictionary())
			}
			dictionary["textObjects"] = dictionaryElements
		}
		if thumbnail != nil{
			dictionary["thumbnail"] = thumbnail!.toDictionary()
		}
		if title != nil{
			dictionary["title"] = title
		}
		if upc != nil{
			dictionary["upc"] = upc
		}
		if urls != nil{
			var dictionaryElements = [NSDictionary]()
			for urlsElement in urls {
				dictionaryElements.append(urlsElement.toDictionary())
			}
			dictionary["urls"] = dictionaryElements
		}
		if variantDescription != nil{
			dictionary["variantDescription"] = variantDescription
		}
		if variants != nil{
			var dictionaryElements = [NSDictionary]()
			for variantsElement in variants {
				dictionaryElements.append(variantsElement.toDictionary())
			}
			dictionary["variants"] = dictionaryElements
		}
		return dictionary
	}

}