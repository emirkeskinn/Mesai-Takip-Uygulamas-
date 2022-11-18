//
//  OvertimeViewController.swift
//  Mesai_Takip
//
//  Created by Emir Keskin on 19.10.2022.
//

import UIKit

class OvertimeViewController: UIViewController {

    @IBOutlet weak var totalEarningsLabelT: UILabel!
    @IBOutlet weak var totalEarningsLabel: UILabel!
    @IBOutlet weak var netSalaryLabel: UILabel!
    @IBOutlet weak var numberOfAchBonusLabel: UILabel!
    @IBOutlet weak var numberOfAchBonusLabelFee: UILabel!
    @IBOutlet weak var AgDeductionLabel: UILabel!
    
    @IBOutlet weak var weekdayOvertimeLabel: UILabel!
    @IBOutlet weak var weekdayOvertimeFee: UILabel!
    
    @IBOutlet weak var weekendOvertimeLabel: UILabel!
    @IBOutlet weak var weekendOvertimeFee: UILabel!
    
    @IBOutlet weak var otherLabel: UILabel!
    @IBOutlet weak var otherValueLabel: UILabel!
    @IBOutlet weak var otherTextField: UITextField!
    
    
    var toplamKazanc: String?
    var netMaasDouble: Double?
    var netMaasString: String?
    var toplamKazancS: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let klavyeyiKapatmakIcin = UITapGestureRecognizer(target: self, action: #selector(klavyeyiKapat))
        view.addGestureRecognizer(klavyeyiKapatmakIcin)
            
      
        myData()
    }
    
     override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         myData()
     }

    @objc func klavyeyiKapat() {
        view.endEditing(true)
    }
    
    func myData(){
        
        let data = UserDefaults.standard
        
        let girilenMaas = data.object(forKey: "maas") ?? "Boş"
        if let girilenMaasD = girilenMaas as? Double {
            netMaasDouble = girilenMaasD
            netSalaryLabel.text = "\(netMaasDouble!)"
        }
        
        if let guncelMaas = girilenMaas as? String {
            netMaasString = guncelMaas
            netSalaryLabel.text = "\(guncelMaas)"
        }
        
        let girilenPrim = data.object(forKey: "prim") ?? "Boş"
        if let primAdeti = girilenPrim as? String {
            numberOfAchBonusLabel.text = primAdeti
        }
        
        let girilenAgi = data.object(forKey: "agi") ?? "Boş"
        if let agiUcreti = girilenAgi as? String {
            AgDeductionLabel.text = " \(agiUcreti) TL"
        }
        
        let toplamKazanci = data.object(forKey: "tkazanc") ?? "Boş"
        if let toplamKazancT = toplamKazanci as? String {
            toplamKazancS = toplamKazancT
            totalEarningsLabel.text = "\(toplamKazancS!) "
            print(toplamKazancS!)
        }
        let primUcretim = data.object(forKey: "primUcreti") ?? "Boş"
        if let netPrimim = primUcretim as? String {
            numberOfAchBonusLabelFee.text = "\(netPrimim)"
        }
        
        let girilen50Mesai = data.object(forKey: "himesai") ?? "Boş"
        if let guncel50Saat = girilen50Mesai as? String {
            weekdayOvertimeLabel.text = "\(guncel50Saat)"
        }
        let girilen100Mesai = data.object(forKey: "hsmesai") ?? "Boş"
        if let guncel100Saat = girilen100Mesai as? String {
            weekendOvertimeLabel.text = "\(guncel100Saat)"
        }
        
        let hi50MesaiUcreti = data.object(forKey: "50kazanc") ?? "Boş"
        if let hi50MesaiUcretiR = hi50MesaiUcreti as? String {
            toplamKazanc = hi50MesaiUcretiR
            weekdayOvertimeFee.text = toplamKazanc
        }
        
        let hs100MesaiUcreti = data.object(forKey: "100kazanc") ?? "Boş"
        if let hs100MesaiUcretiR = hs100MesaiUcreti as? String {
            weekendOvertimeFee.text = "\(hs100MesaiUcretiR)"
        }
        
        let otherFeeS = data.object(forKey: "other") ?? "Boş"
        if let otherFee = otherFeeS as? String {
            otherValueLabel.text = "\(otherFee)"
        }
        
        let otherFeeS2 = data.object(forKey: "otherLabel") ?? "Boş"
        if let otherFee2 = otherFeeS2 as? String {
            otherLabel.text = "\(otherFee2)"
        }
    }
    
    @IBAction func okButton(_ sender: Any) {
        otherLabel.text = otherTextField.text
        let otherFee = otherLabel.text
        
        let data = UserDefaults.standard
        data.set(otherFee, forKey: "otherLabel")
        myData()
    }
}
