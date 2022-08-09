//
//  BeachDataController.swift
//  Smart Buoy
//
//  Created by Nijat Mukhtarov on 02.08.22.
//

import UIKit

class BeachDataController: UIViewController {

    @IBOutlet weak var beachImage: UIImageView!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var label: UILabel!
    var beach: Beach?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(UINib(nibName: "BeachDataCell", bundle: nil), forCellReuseIdentifier: "BeachDataCell")
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        beachImage.image = UIImage(named: beach!.image)
    }
    
    
    
}

extension BeachDataController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "BeachDataCell", for: indexPath) as! BeachDataCell
        switch indexPath.row{
        case 0:
            cell.label1.text = "Water Temprature: "
            cell.label2.text = beach!.tempratureOfWater
        case 1:
            cell.label1.text = "Wave Height: "
            cell.label2.text = beach!.waveHeight
            
        case 2:
            cell.label1.text = "Cleanliness of Water: "
            cell.label2.text = beach?.cleanlinessOfWater
        default:
            break
        }
        return cell
    }
    
    
}
