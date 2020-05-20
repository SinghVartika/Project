//
//  ViewController.swift
//  Project
//
//  Created by TTN on 20/05/20.
//  Copyright © 2020 TTN. All rights reserved.
//

import UIKit
import Alamofire

struct TBaseModel: Codable {
    var status: String?
    var data: [TEmployee]?
}
struct TEmployee: Codable {
    var id: String?
    var employee_name: String?
    var employee_salary: String?
    var employee_age: String?
}

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var employeesTableView: UITableView!
    
    
    var responseModel: TBaseModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        employeesTableView.delegate = self
        employeesTableView.dataSource = self
        getData()
        let nib = UINib.init(nibName: "EmployeeTableViewCell", bundle: nil)
        employeesTableView.register(nib, forCellReuseIdentifier: "employeeCell")
        
    }
    
    //API call
    func getData() {
        AF.request("http://dummy.restapiexample.com/api/v1/employees", method: .get, parameters: nil, encoding: URLEncoding.default)
            .responseData { [weak self] response in
                switch response.result {
                case .failure(let error):
                    print(error)
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .useDefaultKeys
                        let result = try decoder.decode(TBaseModel.self, from: data)
                        self?.responseModel = result
                        print(result)
                    } catch { print(error) }
                }
                
                self?.employeesTableView.reloadData()
        }
    }
    
    //MARK: TableView Delegates and DataSources
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseModel?.data?.count ?? 0
    }
    

        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell") as? EmployeeTableViewCell{
                cell.dataValue(arr: responseModel?.data?[indexPath.row])
                return cell
            }
            
            return UITableViewCell()
            
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 120
        }
        
}
