//
//  SecondViewController.swift
//  Networking
//
//  Created by ek-mac-02 on 21/09/2022.
//

import UIKit

class SecondViewController: UIViewController {


    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    var titles: String = ""
    var author: String = ""
    var descriptions: String = ""
    var contents: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titles
        authorLabel.text = author
        desc.text = descriptions
        contentLabel.text = contents
        
    }
    


}
