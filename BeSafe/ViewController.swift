//
//  ViewController.swift
//  BeSafe
//
//  Created by Macbook on 10/10/16.
//  Copyright © 2016 Raihana A. Souleymane. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MapViewDelegate  {

    var crimeArray = [Crime]()
    var crimeData : Crime?
    let baseUrl = WebService.sharedInstance.baseURL
    
    @IBOutlet weak var mapView: MapView!

    override func viewWillAppear(_ animated: Bool) {
        self.title = "BeSafe"
        mapView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        WebService.sharedInstance.sendData(json: nil, method: "POST", url: baseUrl as NSURL, success: { (json) in
            print(json)
             //Show ActivityController
            ABActivity.showActivityIndicator(self.view, text: "")
        
             //print ("the result", json)
            if let response = json as? NSArray {
                self.crimeArray.removeAll()
                for resp in response {
                    let myresp = Crime(JSON :resp as AnyObject)
                    self.crimeArray.append(myresp)
                    
                }
           self.crimeArray.append(Crime(JSON :response[0] as AnyObject))
            }
            //print ("crimeArray",self.crimeArray)
            
            //Show the result on the map
            self.mapView.clusteringManager.addAnnotations(self.crimeArray)
            WebService.sharedInstance.crimeArray = self.crimeArray
            //hide ActivityController
            ABActivity.hideActivityIndicator(self.view)
            
        }) { (Error) in
            
             //hide ActivityController
            ABActivity.hideActivityIndicator(self.view)
            print(Error)
   
        }
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - MapViewDelegate methods if needed
    
}

