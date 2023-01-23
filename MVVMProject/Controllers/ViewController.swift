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

    private var dataSource: EmployeeTableViewDataSource<UITableViewCell, ProductsData>!
    
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
        self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "myCell", items: self.employeeViewModel.productsData.products, configureCell: { (cell, product) in
            cell.textLabel?.text = product.title
        })
        
        DispatchQueue.main.async {
            self.employeeTableView.dataSource = self.dataSource
            self.employeeTableView.reloadData()
        }
    }
}

