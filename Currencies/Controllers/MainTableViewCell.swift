//
//  MainTableViewCell.swift
//  Currencies
//
//  Created by Дмитрий Кремлев on 25.07.2023.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var shortNameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var countryImageView: UIImageView!
    
    var oldTextFieldValue = 0.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        countryImageView.load(url: URL(string: Constants.Urls.getFlagImage(countryName: "ua"))!)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func editingDidBegin(_ sender: UITextField) {
        sender.selectAll(nil)
    }
    @IBAction func valueChanged(_ sender: UITextField) {
        if let newValue = Double(sender.text!) {
            Webservice.multiplier = newValue / oldTextFieldValue

            var view = self.superview
            while (view != nil && (view as? UITableView) == nil) {
              view = view?.superview
            }

            if let tableView = view as? UITableView {
//                tableView.reloadData()
                var allOtherIndexPath = [IndexPath]()
                for i in 0..<Webservice.currencies.count where i != sender.tag  {
                   allOtherIndexPath.append(IndexPath(row: i, section: 0))
                }
                tableView.reloadRows(at: allOtherIndexPath, with: .none)
//                tableView.beginUpdates()
//                tableView.endUpdates()
            }
        }
    }
    
    func fill(currency: Currency) {
        oldTextFieldValue = currency.value
        
        valueTextField.text = String(format: "%.4f", currency.value * Webservice.multiplier)
//        valueTextField.text = String(format: "%.4f", value * (Webservice.currencies.first?.value ?? 1.0) * Webservice.multiplier)
        shortNameLabel.text = currency.shortName
        fullNameLabel.text = currency.fullName
        countryImageView.image = currency.image
    }
}
