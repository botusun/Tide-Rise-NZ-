//
//  ViewController.swift
//  Tide Rise (NZ)
//
//  Created by Botu Sun on 21/03/16.
//  Copyright © 2016 Botu Sun. All rights reserved.
//

import UIKit
import MapKit


//Cutomized MapPin data, as an array
class MapPin : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String) {
        self.coordinate = coordinate
        self.title = title
    }
}

class mapViewController: UIViewController, MKMapViewDelegate {
    //Define variables
    var userDefaults = NSUserDefaults.standardUserDefaults()
    
    var viewMap: MKMapView!
    var locations = [MapPin]()
    var toSetTitle: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialization of viewMap
        self.viewMap = MKMapView(frame: self.view.frame)
        self.view.addSubview(self.viewMap)
        
        self.viewMap.mapType = .Standard
        
        locations += [(MapPin(coordinate: CLLocationCoordinate2D(latitude: -36.8626926, longitude: 174.5845932), title: "Auckland"))]
        
        locations += [(MapPin(coordinate: CLLocationCoordinate2D(latitude: -37.8626926, longitude: 174.5845932), title: "Some Where"))]
        
        self.viewMap.addAnnotations(locations)
        self.viewMap.delegate = self
    }
    
    
    //Customize Pin Style and callout Bubble, from Internet
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation)
        -> MKAnnotationView? {
            if annotation is MKUserLocation {
                return nil
            }
            
            let reuserId = "pin"
            var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuserId)
                as? MKPinAnnotationView
            if pinView == nil {
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuserId)
                pinView?.canShowCallout = true
                pinView?.animatesDrop = true
                pinView?.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure)
            }else{
                pinView?.annotation = annotation
            }
            
            return pinView
    }
    
    
    //Response when click one callout bubble
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let popupDetailWindow = detailViewController()
        popupDetailWindow.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        //self.presentViewController(popupDetailWindow, animated: true, completion: nil)
        userDefaults.setObject((view.annotation?.title!!)!, forKey: "selectedBeach")
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.pushViewController(popupDetailWindow, animated: false)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

