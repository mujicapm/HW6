//
//  ViewController.swift
//  HW4
//
//  Created by Mauro Mujica-Parodi on 2/6/22.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var channel9: UIButton!
    @IBOutlet weak var channel8: UIButton!
    @IBOutlet weak var channel7: UIButton!
    @IBOutlet weak var channel6: UIButton!
    @IBOutlet weak var channel5: UIButton!
    @IBOutlet weak var channel4: UIButton!
    @IBOutlet weak var channel3: UIButton!
    @IBOutlet weak var channel2: UIButton!
    @IBOutlet weak var channel1: UIButton!
    @IBOutlet weak var channel0: UIButton!
    @IBOutlet weak var channelUp: UIButton!
    @IBOutlet weak var channelDown: UIButton!
    @IBOutlet weak var powerStatus: UILabel!
    @IBOutlet weak var volumeValue: UILabel!
    @IBOutlet weak var channelValue: UILabel!
    @IBOutlet weak var powerSwitch: UISwitch!
    @IBOutlet weak var volumeSlider: UISlider!
    var tmpChannel: String?
    @IBOutlet weak var favoriteChannelSegmentControl: UISegmentedControl!
    @IBOutlet weak var channelStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        powerStatus.text = (powerSwitch.isOn ? "on" : "off")
        volumeValue.text = "\(Int(volumeSlider.value))"
        channelStepper.value = 1
        channelValue.text = "1"
    }

    @IBAction func togglePower(_ sender: UISwitch) {
        powerStatus.text = (sender.isOn ? "on": "off")
        if (sender.isOn) {
            channel0.isEnabled = true
            channel1.isEnabled = true
            channel2.isEnabled = true
            channel3.isEnabled = true
            channel4.isEnabled = true
            channel5.isEnabled = true
            channel6.isEnabled = true
            channel7.isEnabled = true
            channel8.isEnabled = true
            channel9.isEnabled = true
            channelUp.isEnabled = true
            channelDown.isEnabled = true
            volumeSlider.isEnabled = true
            favoriteChannelSegmentControl.isEnabled = true
        } else {
            channel0.isEnabled = false
            channel1.isEnabled = false
            channel2.isEnabled = false
            channel3.isEnabled = false
            channel4.isEnabled = false
            channel5.isEnabled = false
            channel6.isEnabled = false
            channel7.isEnabled = false
            channel8.isEnabled = false
            channel9.isEnabled = false
            channelUp.isEnabled = false
            channelDown.isEnabled = false
            volumeSlider.isEnabled = false
            favoriteChannelSegmentControl.isEnabled = false
        }
        
    }
    
    @IBAction func volumeChange(_ sender: UISlider) {
        volumeValue.text = "\(Int(sender.value))"
    }
    
    @IBAction func incrementChannel(_ sender: UIButton) {
        if sender.currentTitle == "Ch +" {
            channelStepper.value = channelStepper.value + 1
        } else if sender.currentTitle == "Ch -" {
            channelStepper.value = channelStepper.value - 1
        }
        channelValue.text = "\(Int(channelStepper.value))"
        favoriteChannelSegmentControl.selectedSegmentIndex = -1
    }
    @IBAction func channelSelection(_ sender: UIButton) {
        if tmpChannel != nil {
            tmpChannel = tmpChannel! + sender.currentTitle!
            channelValue.text = tmpChannel
            channelStepper.value = Double(Int(tmpChannel!)!)
            tmpChannel = nil
        } else {
            if let a = sender.currentTitle {
                tmpChannel = a
                channelValue.text = tmpChannel
            }
        }
        favoriteChannelSegmentControl.selectedSegmentIndex = -1
    }
    @IBAction func favoriteChannelSelection(_ sender: UISegmentedControl) {
        if let channel = sender.titleForSegment(at: sender.selectedSegmentIndex) {
            switch channel {
            case "ABC":
                channelStepper.value = 7
                channelValue.text = "7"
            case "NBC":
                channelStepper.value = 4
                channelValue.text = "4"
            case "CBS":
                channelStepper.value = 9
                channelValue.text = "9"
            case "FOX":
                channelStepper.value = 5
                channelValue.text = "5"
            default:
                sender.selectedSegmentIndex = -1
            }
            
        }
    }

}

