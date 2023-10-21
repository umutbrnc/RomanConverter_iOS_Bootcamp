//
//  FavoriteViewController.swift
//  RomanConverter
//
//  Created by Emincan Antalyalı on 14.10.2023.
//

import UIKit

final class FavoriteViewController: UIViewController {
    @IBOutlet weak var favoritesTable: UITableView!
    var arr: [String: Any]  = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.arr = UserDefaults.standard.object(forKey:"SavedArray") as! [String : Any]
        reload()
    }

    private func reload() {
        DispatchQueue.main.async {
            self.favoritesTable.reloadData()
        }
    }
}

extension FavoriteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {

            let key = Array(self.arr.keys)[indexPath.row]
            arr.removeValue(forKey: key)
            UserDefaults.standard.setValue(arr, forKey: "SavedArray")
            reload()
            self.presentAlert(status: .succes, message: "Silme işleminiz başarılı")
        }
    }
}

extension FavoriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let key = Array(self.arr.keys)[indexPath.row]
        let value = Array(self.arr.values)[indexPath.row]
        var config = cell.defaultContentConfiguration()
        config.text =  "\(key)"
        config.secondaryText = "\(value)"
        cell.contentConfiguration = config

        return cell

    }
}
