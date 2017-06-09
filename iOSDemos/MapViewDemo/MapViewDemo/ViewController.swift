//
//  ViewController.swift
//  MapViewDemo
//
//  Created by Codekul on 01/03/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    
    @IBOutlet var myMapView : MKMapView!
    var locationManager : CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager?.startUpdatingLocation()
        
        myMapView.userTrackingMode = .followWithHeading
        myMapView.showsUserLocation = true
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        print("didSelect")
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        print("didAdd")
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        print("didUpdate location lat: \(userLocation.coordinate.latitude) Long: \(userLocation.coordinate.longitude)")
        
        let an = MKPointAnnotation()
        an.coordinate = userLocation.coordinate
        an.title = "Pune"
        
        let reg = MKCoordinateRegion(center: userLocation.coordinate, span: .init(latitudeDelta: 1, longitudeDelta: 1))
        mapView.setRegion(reg, animated: true)
        
        myMapView.addAnnotation(an)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            //return nil so map view draws "blue dot" for standard user location
            return nil
        }
        
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.animatesDrop = true
            pinView!.pinTintColor = .green
        }
        else {
            pinView!.annotation = annotation
        }
        
        return pinView

    }
   
    // not explained yet ----------------------------------------
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("calloutAccessoryControlTapped")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

