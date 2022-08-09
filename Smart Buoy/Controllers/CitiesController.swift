//
//  CitiesController.swift
//  Smart Buoy
//
//  Created by Nijat Mukhtarov on 01.08.22.
//

import UIKit

class CitiesController: UIViewController {
    @IBOutlet weak var table: UITableView!
    
    var cities = [City] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonSetup()
        table.register(UINib(nibName: "LabelTableViewCell", bundle: nil), forCellReuseIdentifier: "LabelTableViewCell")
    }
    func jsonSetup() {
        if let jsonFile = Bundle.main.url(forResource: "database", withExtension: "json"), let data = try? Data(contentsOf: jsonFile) {
            do {
                cities = try JSONDecoder().decode([City].self, from: data)
                table.reloadData()
            } catch{
                print(error.localizedDescription)
            }
        }
        
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

