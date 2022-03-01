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
    
    @IBAction func cancelFavoriteConfig(_ sender: UIButton) {
        favoriteLabelConfig.text = nil
        favoriteChannelValueConfig.value = 1
        favoriteChannelValueDisplay.text = Int(favoriteChannelValueConfig.value).description
        favoriteConfigSegmentControl.selectedSegmentIndex = 0
    }
    
    
    @IBAction func updateFavoriteChannel(_ sender: UIButton) {
        if (labelValidateHandler() == true) {
            let currentSegmentIndex = favoriteConfigSegmentControl.selectedSegmentIndex
            favoriteChannelLabels[currentSegmentIndex] = favoriteLabelConfig.text!
            favoriteChannelValues[currentSegmentIndex] = Int(favoriteChannelValueConfig.value)
        } else {
            
            let title = "Label Error"
            let message = "You label must contain 1-4 characters. Please edit and try to save again"
            let alertController =
                UIAlertController(title: title,
                    message: message,
                    preferredStyle: .alert)
            let dismissAction =
                UIAlertAction(title: "OK",
                    style: .default,
                    handler: nil)
            alertController.addAction(dismissAction)
            present(alertController,
                animated: true,
                completion: nil)
        }
        
        
        
    }
    
    func labelValidateHandler () -> Bool {
        if let label = favoriteLabelConfig.text {
            if ((label.count > 0) && (label.count < 5)) {
               return true
            }
        }
        return false
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
