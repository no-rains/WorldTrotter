//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by norains on 2019/9/5.
//  Copyright © 2019 norains. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController
{
    var mapView: MKMapView!
    
    override func loadView()
    {
        mapView = MKMapView()
        
        view = mapView
        
        let standardString = NSLocalizedString("Standard", comment:"Standard map view")
        let satelliteString = NSLocalizedString("Satellite",comment:"Satellite mab view")
        let hybridString = NSLocalizedString("Hybrid",comment:"Hybrid map view")
        
        let segmentedControl = UISegmentedControl(items:[standardString,satelliteString,hybridString])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        //let topConstraint = segmentedControl.topAnchor.constraint(equalTo:view.topAnchor)
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor ,constant:8)
        topConstraint.isActive = true
        
        let margins = view.layoutMarginsGuide
        
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo:margins.leadingAnchor)
        leadingConstraint.isActive = true
        
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo:margins.trailingAnchor)
        trailingConstraint.isActive = true
        
        segmentedControl.addTarget(self,
                                   action: #selector(MapViewController.mapTypeChanged(_:)),
                                   for: .valueChanged)
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl)
    {
        switch segControl.selectedSegmentIndex
        {
            case 0:
                mapView.mapType = .standard
            case 1:
                mapView.mapType = .hybrid
            case 2:
                mapView.mapType = .satellite
            default:
                break
        }
    }
}
