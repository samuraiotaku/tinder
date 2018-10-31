//
//  ProfileViewController.swift
//  tinder
//
//  Created by Brandon Shimizu on 10/30/18.
//  Copyright © 2018 Brandon Shimizu. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    var newImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        profileImage.image = newImage

    }
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "tappedDone", sender: self)

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
