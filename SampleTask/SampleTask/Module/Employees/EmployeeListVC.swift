//
//  EmployeeListVC.swift
//  SampleTask
//
//  Created by Shrief Nasr on 2/23/20.
//  Copyright © 2020 Shrief Nasr. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    var presenter:BasePresenter?
}
class EmployeeListVC: BaseViewController {
    var employees: [EmployeeModel]?
    
    @IBOutlet weak var employeeListTable: UITableView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.presenter =  EmployeeListPresenter()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        employeeListTable.delegate = self
        employeeListTable.dataSource = self
        (self.presenter as? EmployeeListPresenter)?.delegate = self
        (self.presenter as? EmployeeListPresenter)?.getEmployeeList()
    }
}

extension EmployeeListVC: EmployeeListPresenterDelegate{
    func didgetEmployeeList(employees: [EmployeeModel]){
        self.employees = employees
        DispatchQueue.main.async {[weak self] in
            self?.employeeListTable.reloadData()
        }
    }
}

extension EmployeeListVC: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.employees?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell =  tableView.dequeueReusableCell(withIdentifier: "emloyeeCell")
        cell?.textLabel?.text = employees?[indexPath.row].name
        cell?.contentView.backgroundColor = indexPath.row % 2 == 0 ? .white : .lightGray
        return cell ?? UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let employee = employees?[indexPath.row] else {return}
        (presenter as? EmployeeListPresenter)?.showDetails(of: employee)
    }
    
}
