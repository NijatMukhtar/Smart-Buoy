//
//  CitiesController.swift
//  Smart Buoy
//
//  Created by Nijat Mukhtarov on 01.08.22.
//

import UIKit

class CitiesController: UIViewController {
    @IBOutlet weak var table: UITableView!
    
    var cities = [City(name: "Varna", beaches: [Beach(name: "Beach1", coorX: "43.259585" , coorY: "28.032409", colorOfFlag:"Green", tempratureOfWater: "20.5", cleanlinessOfWater: "Clean", image: "beach1"),
                                                Beach(name: "Beach2", coorX: "43.241213", coorY: "28.017522", colorOfFlag: "Yellow", tempratureOfWater: "26", cleanlinessOfWater: "Okay", image: "beach2")]),
                  City(name: "Baku", beaches: [Beach(name: "Beach1", coorX: "40.305218" , coorY: "49.802499", colorOfFlag:"Green", tempratureOfWater: "20.5", cleanlinessOfWater: "Clean", image: "beach3"),
                                                Beach(name: "Beach2", coorX: "40.299496", coorY: "49.771650", colorOfFlag: "Yellow", tempratureOfWater: "26", cleanlinessOfWater: "Okay", image: "beach4")])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(UINib(nibName: "LabelTableViewCell", bundle: nil), forCellReuseIdentifier: "LabelTableViewCell")
    }
}

extension CitiesController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "LabelTableViewCell", for: indexPath) as! LabelTableViewCell
        cell.label.text = cities[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "BeachController") as! BeachController
        controller.title = cities[indexPath.row].name
        controller.beaches = cities[indexPath.row].beaches
        navigationController?.show(controller, sender: nil)
    }
    
}

