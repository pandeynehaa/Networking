//
//  ViewController.swift
//  Networking
//
//  Created by ek-mac-02 on 20/09/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let api = Networking()
    var articles: [Article]?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        fetchAriticle()
    }
}

//MARK: methods
extension ViewController{
    private func fetchAriticle(){
        api.apiCall(url: "") { [weak self]
            data, error in
            DispatchQueue.main.async {
                self?.articles = data
                self?.tableView.reloadData()
            }
            print(data)
            print(error)
        }
    }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
        cell.titleLabel.text = articles?[indexPath.row].title
        cell.authorLabel.text = articles?[indexPath.row].author
        cell.sourceLabel.text = articles?[indexPath.row].source?.name
        cell.publishedLabel.text = articles?[indexPath.row].publishedAt
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stordboard = UIStoryboard(name: "Main", bundle: nil)
               let controller = stordboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        controller.titles = (articles?[indexPath.row].title)!
        controller.author = (articles?[indexPath.row].author)!
        controller.descriptions = (articles?[indexPath.row].description)!
        controller.contents = (articles?[indexPath.row].content)!
        navigationController?.pushViewController(controller, animated: true)
    }
}
