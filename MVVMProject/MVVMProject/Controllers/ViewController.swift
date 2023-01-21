//
//  ViewController.swift
//  MVVMProject
//
//  Created by Santos, Rafael Costa on 21/01/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var employeeTableView: UITableView!
    private var employeeViewModel: EmployeesViewModel!

    private var dataSource: EmployeeTableViewDataSource<UITableViewCell, EmployeeData>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        callToViewModelForUIUpdate()
    }

    func callToViewModelForUIUpdate() {
        self.employeeViewModel = EmployeesViewModel()
        self.employeeViewModel.bindEmployeeViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource() {
        self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "UITableViewCell", items: self.employeeViewModel.empData.data, configureCell: { (cell, evm) in
            cell.textLabel?.text = evm.employeeName
        })
        
        DispatchQueue.main.async {
            self.employeeTableView.dataSource = self.dataSource
            self.employeeTableView.reloadData()
        }
    }
}

