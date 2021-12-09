//
//  FriendsDetailViewController.swift
//  FacebookFriends
//
//  Created by Rumeysa Yücel on 6.12.2021.
//

import UIKit
import MapKit

class FriendsDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
    
    var friends: Results!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        nameLabel.text = "\(friends!.name.first) \(friends.name.last) | \(friends.dob.age)"
        emailLabel.text = "✉️ \(friends.email)"
        phoneLabel.text = "📞 \(friends.phone)"
        locationLabel.text = "📍 \(friends.location.country) | \(friends.location.city)"
        
        let photoUrl = friends.picture.medium
        imageView.downloaded(from: photoUrl)
        imageView.makeCircular()
        
        showLocation()

    }
}

extension FriendsDetailViewController: MKMapViewDelegate {
    
    func showLocation() {
        let latitude = Double(friends.location.coordinates.latitude)!
        let longitude = Double(friends.location.coordinates.longitude)!
        
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        pin.title = "\(friends.name.first)'s Home."
        mapView.addAnnotation(pin)
        
    }
}

