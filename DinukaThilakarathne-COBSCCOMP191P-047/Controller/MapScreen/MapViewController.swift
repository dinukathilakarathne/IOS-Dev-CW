//
//  MapViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/6/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {
    
    var locations : [MKPointAnnotation] = []
    var currentLocation : CLLocation!
    var isAlertShown : Bool! = false
    
    @IBOutlet weak var navigationBar: NavigationBar!{
        didSet{
            navigationBar.delegate = self
            navigationBar.notifications.isHidden = true
            navigationBar.title.text = L10n.map
        }
    }
    
    @IBOutlet weak var mapView: MKMapView!{
        didSet{
            mapView.delegate = self
            mapView.userTrackingMode = .follow
        }
    }
    
    @IBOutlet weak var alertView: UIView!{
        didSet{
            alertView.layer.cornerRadius = AppConstants.viewCornerRadius
            
        }
    }
    @IBOutlet weak var alertVIewHeight: NSLayoutConstraint!
    @IBOutlet weak var alertViewLabel: UILabel!{
        didSet{
            alertViewLabel.text = L10n.infectedProximityMessage
            alertViewLabel.textColor = Asset.white.color
            alertViewLabel.font = FontFamily.Abel.regular.font(size: 18)
        }
    }
    
    let locationManager = CLLocationManager()
    var timer : Timer?
    let db = DatabaseController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAnnotations()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer?.invalidate()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            self.db.getAllLocations()
            self.mapView.removeAnnotations(self.locations)
            self.addAnnotations()
        })
    }
    
    func addAnnotations(){
        if let location = currentLocation{
            self.calculateDistanceBetweenAnnotations(location)
        }
        self.showAlert()
        
        let count = Location.getNumberOfCoordinates()
        for x in 0..<count{
            let location = Location.getCoordinates()[x]
            if location.count > 0 {
                let lat = location[0]
                let lon = location[1]
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
                locations.append(annotation)
            }
        }
        self.mapView.addAnnotations(locations)
    }
    
    func calculateDistanceBetweenAnnotations(_ location :
        CLLocation){
        
        for location in locations{
            isAlertShown = false
            let loc = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let distance = currentLocation.distance(from: loc)
            if distance < 200{
                isAlertShown = true
            }
        }
    }
    
    func showAlert(){
        if isAlertShown{
            alertVIewHeight.constant = 70
            alertView.isHidden = false
        }else{
            alertVIewHeight.constant = 0
            alertView.isHidden = true
        }
    }
}

extension MapViewController : NavigationBarDelegate {
    func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showNotifications() {
        //unused
    }
    
    
}

extension MapViewController : CLLocationManagerDelegate, MKMapViewDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            currentLocation = location
            render(location)
        }
    }
    
    func render(_ location: CLLocation){
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude )
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
}

class CustomPointAnnotation: MKPointAnnotation {
    var imageName: String!
}
