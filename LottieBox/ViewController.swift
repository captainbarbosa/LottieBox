//
//  ViewController.swift
//  LottieBox
//
//  Created by Nadia Barbosa on 6/13/18.
//  Copyright © 2018 nbsa. All rights reserved.
//

import UIKit
import Mapbox
import Lottie

// Example view controller
class ViewController: UIViewController, MGLMapViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mapView = MGLMapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.styleURL = MGLStyle.lightStyleURL
        mapView.tintColor = .lightGray
        mapView.centerCoordinate = CLLocationCoordinate2D(latitude: 0, longitude: 66)
        mapView.zoomLevel = 2
        mapView.delegate = self
        view.addSubview(mapView)

        // Specify coordinates for our annotations.
        let coordinates = [
            CLLocationCoordinate2D(latitude: 0, longitude: 33),
            CLLocationCoordinate2D(latitude: 0, longitude: 66),
            CLLocationCoordinate2D(latitude: 0, longitude: 99),
            ]

        // Fill an array with point annotations and add it to the map.
        var pointAnnotations = [MGLPointAnnotation]()
        for coordinate in coordinates {
            let point = MGLPointAnnotation()
            point.coordinate = coordinate
            point.title = "\(coordinate.latitude), \(coordinate.longitude)"
            pointAnnotations.append(point)
        }

        mapView.addAnnotations(pointAnnotations)
    }
    
    // MARK: - MGLMapViewDelegate methods
    
    // This delegate method is where you tell the map to load a view for a specific annotation. To load a static MGLAnnotationImage, you would use `-mapView:imageForAnnotation:`.
    func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
        // This example is only concerned with point annotations.
        guard annotation is MGLPointAnnotation else {
            return nil
        }

        // Use the point annotation’s longitude value (as a string) as the reuse identifier for its view.
        let reuseIdentifier = "\(annotation.coordinate.longitude)"

        // For better performance, always try to reuse existing annotations.
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)

        // If there’s no reusable annotation view available, initialize a new one.
        if annotationView == nil {
           annotationView = CustomAnnotationView(reuseIdentifier: reuseIdentifier)
           annotationView?.scalesWithViewingDistance = true
           annotationView?.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        }

        return annotationView
    }
}


class CustomAnnotationView: MGLAnnotationView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let animationView = LOTAnimationView(name: "confetti")
        animationView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        animationView.frame = self.bounds
        animationView.loopAnimation = true
        animationView.play(fromProgress: 0,
                            toProgress: 0.5,
                            withCompletion: nil)
        
        self.addSubview(animationView)
    }
}

