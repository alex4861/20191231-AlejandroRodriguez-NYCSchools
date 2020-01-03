//
//  SchoolsTableView.swift
//  20191231-AlejandroRodriguez-NYCSchools
//
//  Created by José Alejandro Bravo Cedillo on 12/31/19.
//  Copyright © 2019 Terzigma. All rights reserved.
//

import UIKit

class SchoolsTableView: UITableViewController {
   
    

    
    var data = [Model]()
    private var Detaildata = [DetailModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableRow", bundle: nil), forCellReuseIdentifier: "TableRow")
        tableView.rowHeight = UITableView.automaticDimension
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return data.count
       }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableRow", for: indexPath) as! TableViewCell
        let tabledata = data[indexPath.row]
        
        cell.name.text = tabledata.school_name
        cell.location.text = "\(tabledata.state_code) - \(tabledata.city)"
        cell.Description.text = tabledata.website
        cell.number.text = tabledata.phone_number
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let select = data[indexPath.row]
        let event = Events()
        event.getDetail(dbn: select.dbn) { (data) in
            if let data = data as? [DetailModel]{
                if data.count != 0{
                    DispatchQueue.main.async {
                        self.Detaildata = data
                        self.performSegue(withIdentifier: "showDetail", sender: nil)
                    }
                }
                else{
                    //muestra mensaje de error si la escuela seleccionada no esta en la base de datos

                    DispatchQueue.main.async {
                        self.alert(message: "This school haven't SAT data")
                    }
                }


            }
                
                //muestra mensaje de error si falla el fetch
            else{
                DispatchQueue.main.async {
                    self.alert(message: data as! String)
                }
            }
        }
    }
    
    
    private func alert(message: String){
        let alert = UIAlertController(title: "Something wrong :(", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)


    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? PrincipalViewController{
            detailVC.data = Detaildata
        }
    }

}
