//
//  mapView.swift
//  Chill
//
//  Created by Luis Gonzalez on 7/31/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import UIKit
import MapKit

let map = MKMapView()
var lat = Double()
var long = Double()
let location = CLLocationCoordinate2DMake(lat, long)
let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.09, longitudeDelta: 0.09))
let pin = CustomPin(pinTitle: "", pinSubTitle: "", location: location)


class mapView: UIView, MKMapViewDelegate {
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = .gray
        setupMap()
    }
    
    func setupMap() {
        addSubview(map)
        map.delegate = self
        map.setRegion(region, animated: true)
        map.addAnnotation(pin)
        map.isZoomEnabled = false
        map.isScrollEnabled = false
        map.translatesAutoresizingMaskIntoConstraints = false
        
        map.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        map.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        map.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        map.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customannotation")
        annotationView.image = UIImage(named: "pin")
        annotationView.canShowCallout = true
        return annotationView
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
