//
//  File.swift
//  20191231-AlejandroRodriguez-NYCSchools
//
//  Created by José Alejandro Bravo Cedillo on 12/31/19.
//  Copyright © 2019 Terzigma. All rights reserved.
//

import Foundation


class Events {
    var url: URL?
    let session = URLSession.shared

    //MARK: funcion de carga de datos por defecto
    func getData(completion: @escaping (Any?) -> Void){
        url = URL(string: Constants.BASE_URL_SCHOOLS)
          let task = session.dataTask(with: url!){ data, response, error in
            if let error = error {
                print("hubo un error")
                completion(error.localizedDescription)

            }
              if let data = data{
                  do {
                    let res = try JSONDecoder().decode(Array<Model>.self, from: data)
                    completion(res)
                  } catch{
                      print("hubo un error")
                    print(error)
                    completion(error)

                  }
              }
              
              }
        
        task.resume()
      }
    
    //MARK: get the SAT data from the API 
    func getDetail(dbn: String, completion: @escaping (Any?) -> Void){
        let urlRequest = "\(Constants.BASE_URL_DETAIL)?dbn=\(dbn)"
        url = URL(string: urlRequest)
        print(url!)

        let task = session.dataTask(with: url!){ data, response, error in
          
          if let error = error {
              print("hubo un error")
              completion(error.localizedDescription)

          }
            if let data = data{
                do {
                  let res = try JSONDecoder().decode(Array<DetailModel>.self, from: data)
                  completion(res)
                } catch{
                    print("hubo un error")
                  print(error)
                  completion(error)

                }
            }
            
            }
      
      task.resume()
    }
    
}
