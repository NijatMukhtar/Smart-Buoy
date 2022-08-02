//
//  BeachController.swift
//  Smart Buoy
//
//  Created by Nijat Mukhtarov on 01.08.22.
//

import UIKit
import MapKit
import CoreLocation

class BeachController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    var beaches = [Beach]()
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    @IBAction func segmentTapped(_ sender: Any) {
        switch segment.selectedSegmentIndex{
        case 0:
            collection.isHidden = false
            map.isHidden = true
        case 1:
            collection.isHidden = true
            map.isHidden = false
        default:
            break;
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        manager.stopUpdatingLocation()
        
        //            let span = MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100)
        //
        //            let region = MKCoordinateRegion(center: coordinate, span: span)
        //                                        map.setRegion(region, animated: true)
        //            map.setRegion(region, animated: true)
        
        var pins = [MKAnnotation]()
        print("ne")
        for beach in beaches {
            print("ne")
            let pin = MKPointAnnotation()
            pin.coordinate = CLLocationCoordinate2D(latitude: Double(beach.coorX)!, longitude: Double(beach.coorY)!)
            pin.title = beach.name
            pins.append(pin)
            
        }
        map.showAnnotations(pins, animated: true)
//        map.addAnnotations(pins)
    }
    
}

extension BeachController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        beaches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "BeachCell", for: indexPath) as! BeachCell
        cell.label.text = beaches[indexPath.item].name
        cell.image.image = UIImage(named: beaches[indexPath.item].image)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / CGFloat(2), height: collectionView.frame.width / CGFloat(2))
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "BeachDataController") as! BeachDataController
        controller.beach = beaches[indexPath.row]
        controller.title = beaches[indexPath.row].name
        navigationController?.show(controller, sender: nil)
    }
}
