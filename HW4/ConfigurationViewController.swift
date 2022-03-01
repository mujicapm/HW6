//
//  ConfigurationViewController.swift
//  HW4
//
//  Created by Mauro Mujica-Parodi on 3/1/22.
//

import UIKit

var favoriteChannelLabels: [String] = ["ABC", "NBC", "CBS", "FOX"]
var favoriteChannelValues: [Int] = [7, 4, 9, 5]

class ConfigurationViewController: UIViewController {

    @IBOutlet weak var favoriteConfigSegmentControl: UISegmentedControl!
    @IBOutlet weak var favoriteChannelValueDisplay: UILabel!
    @IBOutlet weak var favoriteLabelConfig: UITextField!
    @IBOutlet weak var favoriteChannelValueConfig: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteChannelValueConfig.value = 1
        favoriteChannelValueDisplay.text = Int(favoriteChannelValueConfig.value).description
        favoriteConfigSegmentControl.selectedSegmentIndex = 0

        // Do any additional setup after loading the view.
    }
    
    @IBAction func incrementfavoriteChannelValueConfig(_ sender: UIStepper) {
        favoriteChannelValueDisplay.text = Int(favoriteChannelValueConfig.value).description
    }
    
    @IBAction func updateFavoriteChannel(_ sender: UIButton) {
        let currentSegmentIndex = favoriteConfigSegmentControl.selectedSegmentIndex
        favoriteChannelLabels[currentSegmentIndex] = favoriteLabelConfig.text!
        favoriteChannelValues[currentSegmentIndex] = Int(favoriteChannelValueConfig.value)
        
        
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
