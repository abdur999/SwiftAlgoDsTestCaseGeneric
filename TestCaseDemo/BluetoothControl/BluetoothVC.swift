//
//  BluetoothVC.swift
//  TestCaseDemo
//
//  Created by Abhisek Ghosh on 20/09/22.
//

import UIKit
import CoreBluetooth

class BluetoothVC: UIViewController {
    
    var centralManager: CBCentralManager!
    
    // STEP 0.0: specify GATT "Assigned Numbers" as
    // constants so they're readable and updatable
     
    // MARK: - Core Bluetooth service IDs
    let BLE_Heart_Rate_Service_CBUUID = CBUUID(string: "0x180D")
     
    // MARK: - Core Bluetooth characteristic IDs
    let BLE_Heart_Rate_Measurement_Characteristic_CBUUID = CBUUID(string: "0x2A37")
    let BLE_Body_Sensor_Location_Characteristic_CBUUID = CBUUID(string: "0x2A38")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    
    }
}
extension BluetoothVC: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state{
        case .unknown:
          print("central state is .unknown")
        case .resetting:
          print("central state is .resetting")
        case .unsupported:
          print("central state is .unsupported")
        case .unauthorized:
          print("central state is .unauthorized")
        case .poweredOff:
          print("central state is .poweredOff")
        case .poweredOn:
            print("central state is .poweredOn")
            centralManager.scanForPeripherals(withServices: nil)
        @unknown default:
           break
        }
    }
}
