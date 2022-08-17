//
//  ViewController.swift
//  SearchBar_Swift_Tutorial
//
//  Created by Himanshu Nag on 17/08/22.
//

import UIKit

class ViewController: UIViewController
{


  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var searchBar: UISearchBar!

  let carData = ["Ford", "Mercedes", "Audi", "BMW", "Lamborghini", "Ferrari"]
  var filterdata: [String]!

  override func viewDidLoad() {
    super.viewDidLoad()
    filterdata = carData
    tableView.delegate = self
    tableView.dataSource = self
    // Do any additional setup after loading the view.
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return filterdata.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = filterdata[indexPath.row]
    return cell
  }
}

extension ViewController: UISearchBarDelegate
{
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    filterdata = []
    if searchText == ""
    {
      filterdata = carData
    }

    for word in carData
    {
      if word.uppercased().contains(searchText.uppercased())
      {
        filterdata.append(word)
      }
    }
    self.tableView.reloadData()
  }
}
