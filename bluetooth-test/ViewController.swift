//
//  ViewController.swift
//  bluetooth-test
//
//  Created by Richie Shilton on 1/2/19.
//  Copyright © 2019 Richie Shilton. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController {
    
    var bluetoothPeripheralManager: CBPeripheralManager?

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bluetoothPeripheralManager = CBPeripheralManager(delegate: self, queue: nil, options: [:])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        if label.text != "Bluetooth turned on" {
            guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

extension ViewController: CBPeripheralManagerDelegate {
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        switch peripheral.state {
        case .poweredOn: label.text = "Bluetooth is on"
        case .poweredOff: label.text = "Bluetooth is off"
        case .resetting: label.text = "Bluetooth is resetting"
        case .unauthorized: label.text = "Bluetooth is not authorized"
        case .unsupported: label.text = "Bluetooth is not supported"
        case .unknown: label.text = "Bluetooth something something 🤷‍♀️"
        }
    }
    
}

