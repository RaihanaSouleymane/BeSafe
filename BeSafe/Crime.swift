//
//  Crime.swift
//  BeSafe
//
//  Created by Macbook on 10/10/16.
//  Copyright © 2016 Raihana A. Souleymane. All rights reserved.
//

import Foundation
import MapKit

class Crime: NSObject, MKAnnotation {
    
    var date: String?
    var address: String?
    var resolution: String?
    var pddistrict: String?
    var incidntnum: String?
    var x: String?
    var dayofweek: String?
    var y: String?
    var location: NSDictionary?
    var time: String?
    var pdid: String?
    var category: String?
    var descript: String?
    var latitude: NSNumber?
    var human_address: String?
    var needs_recoding: Bool?
    var longitude: NSNumber?
    
    
    
    //Map Annotations
    var coordinate:CLLocationCoordinate2D = CLLocationCoordinate2D()
    var title: String? { return category }
    var subtitle: String? { return descript }
    
    //var jsoninfo : AnyObject
    
    init(JSON : AnyObject) {
        super.init()
        //jsoninfo = JSON
        
        if let value = JSON["date"] as? String {
            self.date = value
        }
        
        if let value = JSON["address"] as? String {
            self.address = value
        }
        if let value = JSON["resolution"] as? String {
            self.resolution = value
        }
        if let value = JSON["pddistrict"] as? String {
            self.pddistrict = value
        }
        if let value = JSON["incidntnum"] as? String {
            self.incidntnum = value
        }
        else if let value = JSON["incidntnum"] as? NSNumber {
            self.incidntnum = "\(value)"
        }
        if let value = JSON["x"] as? String {
            self.x = value
        }
        else if let value = JSON["x"] as? NSNumber {
            self.x = "\(value)"
        }
        if let value = JSON["y"] as? String {
            self.y = value
        }
        else if let value = JSON["y"] as? NSNumber {
            self.y = "\(value)"
        }
        
        if let value = JSON["dayofweek"] as? String {
            self.dayofweek = value
        }
        if let value = JSON["location"] as? NSDictionary {
            self.location = value
            
            if let lat = value.object(forKey: "latitude") as? String {
                let intLat = (lat as NSString).doubleValue
                self.latitude = NSNumber(value:intLat)
                //print (self.latitude,intLat)

            }
            else if let lat = value.object(forKey: "latitude") as? NSNumber {
                self.latitude = lat
               // print (self.latitude)

            }
            
            if let long = value.object(forKey: "longitude") as? String {
                self.longitude = NSNumber(value:((long as NSString).doubleValue))
            }
            else if let long = value.object(forKey: "longitude") as? NSNumber {
                self.longitude = long
            }
            
            if let humanAddress = value.object(forKey: "human_address") as? String {
                self.human_address = humanAddress
            }
            if let needsRecoding = value.object(forKey: "human_address") as? Bool {
                self.needs_recoding = needsRecoding
            }
        
            
            
        if(self.latitude!.doubleValue != 0.0 && self.longitude?.doubleValue != 0.0){
            self.coordinate = CLLocationCoordinate2D(latitude: self.latitude!.doubleValue , longitude: (self.longitude?.doubleValue)!)
        }
        }
        if let value = JSON["time"] as? String {
            self.time = value
        }
        if let value = JSON["pdid"] as? String {
            self.pdid = value
        }
        if let value = JSON["descript"] as? String {
            self.descript = value
        }
        if let value = JSON["category"] as? String {
            self.category = value
        }

    }
}
