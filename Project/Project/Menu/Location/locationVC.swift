//
//  locationVC.swift
//  Project
//
//  Created by TTN on 16/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit
//import MapKit
import GoogleMaps
import GooglePlaces

class locationVC: UIViewController {

//        @IBOutlet weak var mapView : MKMapView!

    override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.
          // Create a GMSCameraPosition that tells the map to display the
          // coordinate -33.86,151.20 at zoom level 6.
          let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
          let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
          self.view.addSubview(mapView)

          // Creates a marker in the center of the map.
          let marker = GMSMarker()
          marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
          marker.title = "Sydney"
          marker.snippet = "Australia"
          marker.map = mapView
    }
}
//}
////
//        fileprivate let locationManager: CLLocationManager = {
//            let manager = CLLocationManager()
//            manager.requestWhenInUseAuthorization()
//            return manager
//        }()
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            self.setMap()
//            // Do any additional setup after loading the view.
//        }
//
//        func addAnnotationsOnMapView(cordinates: CLLocationCoordinate2D) {
//            let lucknow = MKPointAnnotation()
//            lucknow.title = "Annotation"
//            lucknow.subtitle = "Annotation subtitle"
//            lucknow.coordinate = cordinates
//            mapView.addAnnotation(lucknow)
//        }
//
//        func setMap(){
//            mapView.showsUserLocation = true
//            mapView.isZoomEnabled = true
//            mapView.showsCompass = true
//            mapView.showsScale = true
//            mapView.mapType = .standard
//            self.getUsercurrentLocation()
//        }
//
//        func geocode(latitude: Double, longitude: Double)  {
//                    CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: latitude, longitude: longitude)) { placemark, error in
//                        guard let placemark = placemark, error == nil else {
//                            return
//                        }
//                        print(placemark)
//                    }
//                }
//
//
//        func getUsercurrentLocation() {
//            locationManager.delegate = self as? CLLocationManagerDelegate
//            locationManager.desiredAccuracy = kCLLocationAccuracyBest
//            if #available(iOS 11.0, *) {
//                locationManager.showsBackgroundLocationIndicator = true
//            }
//            locationManager.startUpdatingLocation()
//        }
//}
//    extension locationVC: CLLocationManagerDelegate {
//        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//            let location = locations.last! as CLLocation
//            let currentLocation = location.coordinate
//            let coordinateRegion = MKCoordinateRegion(center: currentLocation, latitudinalMeters: 800, longitudinalMeters: 800)
//            self.geocode(latitude: currentLocation.latitude, longitude: currentLocation.longitude)
//            mapView.setRegion(coordinateRegion, animated: true)
//           // locationManager.stopUpdatingLocation()
//        }
//
//        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//            print(error.localizedDescription)
//        }
//
//        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//            print(status)
//        }
//    }



