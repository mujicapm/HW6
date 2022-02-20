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
    enum state: String {
        case stopped = "Stopped"
        case playing = "Playing"
        case paused = "Paused"
        case fast_Forwarding = "Fast forwarding"
        case fast_Rewinding = "Fast rewinding"
        case recording = "Recording"
        var stateName: String {return self.rawValue}
    }
    let stateMapping = [
        "Stop": "Stopped", "Play": "Playing", "Pause": "Paused", "Fast Forward": "Fast forwarding", "Fast Rewind": "Fast rewinding", "Record": "Recording"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dvrPowerStatus.text = (dvrPowerSwitch.isOn ? "on" : "off")
        stateStatus.text = "Stopped" //TODO need to hold state so doesn't reset everytime you go to TV remote
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func toggleDVRPower(_ sender: UISwitch) {
        dvrPowerStatus.text = (sender.isOn ? "on": "off")
        if (sender.isOn) {
            for label in dvrControls {
                label.isEnabled = true
            }
        } else {
            for label in dvrControls {
                label.isEnabled = false
            }
        }
    }
    
    @IBAction func switchToTV(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeState(_ sender: UIButton) {
        if let stateName = stateMapping[sender.currentTitle!] {
            stateStatus.text = stateName
        }
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
