//
//  BeachController.swift
//  Smart Buoy
//
//  Created by Nijat Mukhtarov on 01.08.22.
//

import UIKit


class BeachController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    var beaches = [Beach]()

    override func viewDidLoad() {
 
            super.viewDidLoad()

      }

    
    
    @IBAction func segmentTapped(_ sender: Any) {
        switch segment.selectedSegmentIndex{
        case 0:
            collection.isHidden = false
            
        case 1:
            collection.isHidden = true
            
        default:
            break;
        }
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
