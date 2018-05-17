//
//  SettingsViewController.swift
//  Pensamentos
//
//  Created by School Picture Dev on 16/05/18.
//  Copyright © 2018 Joao Rocha. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var swAutoRefresh: UISwitch!
    @IBOutlet weak var slTimeInverval: UISlider!
    @IBOutlet weak var scColorSkin: UISegmentedControl!
    @IBOutlet weak var lbTimeInverval: UILabel!
    
    let config = Configuration.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Refresh"), object: nil, queue: nil) { (notification) in
            self.formatView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
    }
    
    func formatView() {
        swAutoRefresh.setOn(config.autorefresh, animated: false)
        slTimeInverval.setValue(Float(config.timeInterval), animated: false)
        scColorSkin.selectedSegmentIndex = config.colorScheme
        changeTimerInvervalLabel(with: config.timeInterval)
    }
    
    func changeTimerInvervalLabel(with value: Double) {
        lbTimeInverval.text = "Mudar após \(Int(value)) segundos"
    }

    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
        config.autorefresh = sender.isOn
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        let value = Double(round(sender.value))
        changeTimerInvervalLabel(with: value)
        config.timeInterval = value
    }
    
    @IBAction func changeColorSkin(_ sender: UISegmentedControl) {
        config.colorScheme = sender.selectedSegmentIndex
    }
}
