//
//  OrderListViewController.swift
//  wolfpackTest
//
//  Created by Todea  Catalin on 15/02/2020.
//  Copyright © 2020 Todea  Catalin. All rights reserved.
//

import UIKit

class OrderListViewController: UIViewController {
    
    private let viewModel = OrderViewModel()
    
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.setupTableView()
        self.secureConnection()
    }
    
    private func setupUI() {
        self.titleLabel.text = self.viewModel.title
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    private func secureConnection() {
        self.viewModel.getItems { (error) in
            if error == nil {
                self.loadingView.isHidden = true
                self.tableView.reloadData()
            } else {
                self.loadingView.isHidden = true
                self.showAlert(withError: error!)
            }
        }
    }
    
    private func showAlert(withError err: Error) {
        let alertController = UIAlertController(title: self.viewModel.errorAlertTitle, message: err.localizedDescription, preferredStyle: .alert)
        
        let reloadAction = UIAlertAction(title: self.viewModel.reloadAlertButton, style: .default) { (_) in
            self.loadingView.isHidden = false
            self.secureConnection()
        }
        alertController.addAction(reloadAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

extension OrderListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getNrOfItems()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "orderCell") as! TableViewCell
        let order = self.viewModel.getOrder(fromIndex: indexPath.row)
        cell.setDetails(description: order.description, customerName: order.deliverTo, price: order.price)
        cell.setSelected(false, animated: false)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedOrder = self.viewModel.getOrder(fromIndex: indexPath.row)
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
        detailVC.order = selectedOrder
        self.present(detailVC, animated: true, completion: nil)
        self.tableView.cellForRow(at: indexPath)?.setSelected(false, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 101
    }
}

