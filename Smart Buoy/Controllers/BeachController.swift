//
//  BeachController.swift
//  Smart Buoy
//
//  Created by Nijat Mukhtarov on 01.08.22.
//

import UIKit

class BeachController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    
    var beaches = [Beach]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BeachController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        beaches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collection.dequeueReusableCell(withReuseIdentifier: "BeachCell", for: indexPath) as! 
        
    }
    
    
}
