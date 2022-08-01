//
//  CitiesController.swift
//  Smart Buoy
//
//  Created by Nijat Mukhtarov on 01.08.22.
//

import UIKit

class CitiesController: UIViewController {
    @IBOutlet weak var table: UITableView!
    
    var cities = [City(name: "City1", beaches: [Beach(name: "Beach1", coorX: "43.259585" , coorY: "28.032409", colorOfFlag:"Green", tempratureOfWater: 20.5, cleanlinessOfWater: "Clean"), Beach(name: "Beach2", coorX: "43.241213", coorY: "28.017522", colorOfFlag: "Yellow", tempratureOfWater: 26, cleanlinessOfWater: "Okay")])]
    
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
    
    
}

