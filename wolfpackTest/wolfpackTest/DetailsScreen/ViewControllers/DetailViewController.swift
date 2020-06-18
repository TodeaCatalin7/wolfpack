//
//  DetailViewController.swift
//  wolfpackTest
//
//  Created by Todea  Catalin on 07/02/2020.
//  Copyright © 2020 Todea  Catalin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var IDLabel: UILabel!
    @IBOutlet weak var staticIDLabel: UILabel!
    @IBOutlet weak var deliverToLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    
    private let viewModel = DetailViewModel()
    var order: Order?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        self.cancelButton.setTitle(self.viewModel.candelButtonTitle, for: .normal)
        self.cancelButton.backgroundColor = .black
        self.cancelButton.titleLabel?.textColor = .white
        self.cancelButton.layer.cornerRadius = self.cancelButton.layer.bounds.size.height / 3
        self.staticIDLabel.text = self.viewModel.idLabel
        self.IDLabel.text = String(self.order!.id)
        self.descriptionLabel.text = self.order!.description
        self.deliverToLabel.text = "For: \(self.order!.deliverTo)"
        self.priceLabel.text = "\(self.viewModel.price) \(self.order!.price)"
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
