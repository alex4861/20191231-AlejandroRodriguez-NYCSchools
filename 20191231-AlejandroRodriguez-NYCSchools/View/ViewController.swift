//
//  ViewController.swift
//  20191231-AlejandroRodriguez-NYCSchools
//
//  Created by José Alejandro Bravo Cedillo on 12/31/19.
//  Copyright © 2019 Terzigma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    private var data = [Model]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //inicializacion de alfa y posicion pre-animacion
        activityIndicator.startAnimating()
        logo.alpha = 0
        logo.transform = CGAffineTransform(translationX: 0, y: -20)
        welcomeLabel.alpha = 0
        chargeData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //animacion
        UIView.animate(withDuration: 1, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.logo.alpha = 1
            self.logo.transform = CGAffineTransform(translationX: 0, y: 0)
            self.welcomeLabel.alpha = 1

        }, completion: nil)
    }
    
    //MARK: - Funcion de llamada del ViewModel

    private func chargeData() {
                let event = Events()
             event.getData { (data) in
               if let data = data as? [Model]{
                   self.data = data
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "start", sender: nil)
                }
               }
               else{
                DispatchQueue.main.async {
                    self.alert(message: data as! String)
                }
               }
           }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Crea recorrido desde el segue hasta el tableView, y en caso de que el recorrido sea correcto, le pasa los valores obtenidos de la API
        if let splitVC = ((segue.destination as? UISplitViewController)?.viewControllers[0] as?  UINavigationController)?.viewControllers[0] as? SchoolsTableView {
                    splitVC.data = data
        }
    }
    
//MARK: - Crea una alerta en caso de error, la accion reintenta la carga de datos
    private func alert(message: String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Retry", style: .default) { (action) in
            self.chargeData()
        }
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}

