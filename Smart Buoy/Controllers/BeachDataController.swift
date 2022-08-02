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
        
        checkBeach()
    }

    override func viewWillAppear(_ animated: Bool) {
        beachImage.image = UIImage(named: beach!.image)
    }
    
    func checkBeach(){
        if beach?.colorOfFlag == "Green"{
            label.text = "Swimming is permitted"
            label.backgroundColor = .green
        }
        else if beach?.colorOfFlag == "Red"{
            label.text = "Swimming is NOT permitted"
            label.backgroundColor = .red
        }
        else{
            label.text = "Swimming with increased attention is permitted"
            label.backgroundColor = .yellow
        }
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
            cell.label2.text = beach!.tempratureOfWater + " °C"
        case 1:
            cell.label1.text = "Color of Flag: "
            cell.label2.text = beach!.colorOfFlag
            if(beach?.colorOfFlag == "Red"){
                cell.label2.textColor = .red
            }
            else if (beach?.colorOfFlag == "Green"){
                cell.label2.textColor = .green
            }
            else {
                cell.label2.textColor = .yellow
            }
        case 2:
            cell.label1.text = "Cleanliness of Water: "
            cell.label2.text = beach?.cleanlinessOfWater
        default:
            break
        }
        return cell
    }
    
    
}
