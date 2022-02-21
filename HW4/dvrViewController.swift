//
//  dvrViewController.swift
//  HW4
//
//  Created by Mauro Mujica-Parodi on 2/20/22.
//

import UIKit

class dvrViewController: UIViewController {

    @IBOutlet weak var stateStatus: UILabel!
    @IBOutlet weak var dvrPowerStatus: UILabel!
    @IBOutlet weak var dvrPowerSwitch: UISwitch!
    @IBOutlet var dvrControls: [UIButton]!
    let stateMapping = [
        "Stop": "Stopped", "Play": "Playing", "Pause": "Paused", "Fast Forward": "Fast forwarding", "Fast Rewind": "Fast rewinding", "Record": "Recording"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dvrPowerStatus.text = (dvrPowerSwitch.isOn ? "on" : "off")
        
        stateStatus.text = "Stopped"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func toggleDVRPower(_ sender: UISwitch) {
        dvrPowerStatus.text = (sender.isOn ? "on": "off")
        if (sender.isOn) {
            for label in dvrControls {
                label.isEnabled = true
            }
            stateStatus.text = "Stopped"
        } else {
            for label in dvrControls {
                label.isEnabled = false
            }
            stateStatus.text = "Stopped"
        }
    }
    
    @IBAction func switchToTV(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func changeState(_ sender: UIButton) {
        if let stateName = stateMapping[sender.currentTitle!] {
            if (stateStatus.text == "Playing") {
                if ((stateName == "Paused") || (stateName == "Fast forwarding") || (stateName == "Fast rewinding") || (stateName == "Playing") || (stateName == "Stopped")) {
                    stateStatus.text = stateName
                } else {
                    stateChangeActionSheet(stateName)
                }
            } else if (stateStatus.text == "Stopped") {
                if ((stateName == "Stopped") || (stateName == "Recording") || (stateName == "Playing")) {
                    stateStatus.text = stateName
                } else {
                    stateChangeActionSheet(stateName)
                }

            } else if (stateStatus.text == "Recording") {
                if (stateName == "Stopped") {
                    stateStatus.text = stateName
                } else {
                    stateChangeActionSheet(stateName)
                }
            } else {
                if ((stateName == "Stopped") || (stateName == "Playing") || (stateName == stateStatus.text)) {
                    stateStatus.text = stateName
                } else {
                    stateChangeActionSheet(stateName)
                }

            }
        }
    }
    
    func stateChangeActionSheet (_ stateName: String) {
        let title : String? = "Your request is not supported in the DVR's current state"
        let message : String? = "How would you like to proceed?"
        var actions: [UIAlertAction] = []
        func actionSheetHandler(alert: UIAlertAction!){
            stateStatus.text = stateName
            forcedStateChangeAlert(stateName)
        }
        
        
        let cancelAction =
        UIAlertAction(title: "Cancel Request",
            style: .default,
            handler: nil)
        let returnAction =
        UIAlertAction(title: "Force Request",
            style: .default,
                      handler: actionSheetHandler(alert:))
        
        actions += [ cancelAction, returnAction ]
        let alertController =
        UIAlertController(title: title,
            message: message,
            preferredStyle: .actionSheet)
        for action in actions {
            alertController.addAction(action)
        }
        present(alertController,
            animated: true,
            completion: nil)
    }
    
    func forcedStateChangeAlert (_ stateName: String) {
        let title = "Confirmation"
        let message = "Your request to switch the state to '\(stateName)' has been forced through"
        let alertController =
            UIAlertController(title: title,
                message: message,
                preferredStyle: .alert)
        let dismissAction =
            UIAlertAction(title: "Dismiss",
                style: .cancel,
                handler: nil)
        alertController.addAction(dismissAction)
        present(alertController,
            animated: true,
            completion: nil)
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
