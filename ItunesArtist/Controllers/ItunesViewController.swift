//
//  ViewController.swift
//  ItunesArtist
//
//  Created by Jack Bordner on 7/29/21.
//

import UIKit

class ItunesViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    private let viewModel = ItunesViewControllerViewModel(service: ItunesAPIClientFactory.create())
    private var spinner = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        viewModel.delegate = self
        configureSpinner()
    }
    
    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.accessibilityIdentifier = "itunesTableView"
        tableView.register(UINib(nibName: "ItunesTableViewCell", bundle: nil), forCellReuseIdentifier: "itunesTableViewCell")
    }

    @IBAction func searchButtonAction(_ sender: Any) {
        guard let text = searchBar.text else { return }
        self.spinner.startAnimating()
        viewModel.fetchData(for: text)
    }
    
    private func configureSpinner() {
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension ItunesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itunesTableViewCell") as! ItunesTableViewCell
        cell.configure(with: viewModel.data[indexPath.row])
        cell.accessibilityIdentifier = "itunesTableViewCell_\(indexPath.row)"
        return cell
    }
}

extension ItunesViewController: ItunesViewControllerViewModelDelegate {
    
    func didRetrieveData() {
        // Push work onto to main thread
        DispatchQueue.main.async { [weak self] in
            self?.spinner.stopAnimating()
            self?.tableView.reloadData()
        }
    }
}
