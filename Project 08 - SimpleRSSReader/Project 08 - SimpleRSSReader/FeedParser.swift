//
//  FeedParser.swift
//  Project 08 - SimpleRSSReader
//
//  Created by Durand on 11/6/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import UIKit


public typealias item = (title: String, description: String, pubDate: String);
public typealias ItemHandler = (([item]) -> Void);

class FeedParser: NSObject, XMLParserDelegate {

    fileprivate var rssItems = [item]();
    
    fileprivate var currentElement = ""
    
    fileprivate var currentTitle = "" {
        didSet {
            currentTitle = currentTitle.stringByTrimming();
        }
    }
    
    fileprivate var currentDescription = "" {
        didSet {
            currentDescription = currentDescription.stringByTrimming();
        }
    }
    
    fileprivate var currentPubDate = "" {
        didSet  {
            currentPubDate = currentPubDate.stringByTrimming();
        }
    }
    
    fileprivate var  parseCompletionHandler: ItemHandler?
    
    func parseFeed(feedURL: String, completionHandler: ItemHandler?) -> Void {
        parseCompletionHandler = completionHandler;
        
        guard let feedURL = URL(string: feedURL) else {
            print("feed URL is invaild");
            return;
        }
        
        URLSession.shared.dataTask(with: feedURL) { (data, response, error) in
            if let error = error {
                print(error);
                return;
            }
            
            guard let data = data else {
                print("No data fetched");
                return;
            }
            
            let parser = XMLParser.init(data: data);
            parser.delegate = self;
            parser.parse();
            }.resume();
    }
    
    // mark: parser delegate
    func parserDidStartDocument(_ parser: XMLParser) {
        rssItems.removeAll();
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName;
        
        if currentElement == "item" {
            currentTitle = ""
            currentDescription = ""
            currentPubDate = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
        case "title":
            currentTitle += string
        case "description":
            currentDescription += string
        case "pubDate":
            currentPubDate += string
        default:
            break
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            let rssItem = (title: currentTitle, description: currentDescription, pubDate: currentPubDate)
            rssItems.append(rssItem)
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        parseCompletionHandler?(rssItems)
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print(parseError.localizedDescription)
    }
}

extension String {
    
    func stringByTrimming () -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines);
    }
    
}
