//
//  SettingsOvertimeVC.swift
//  Mesai_Takip
//
//  Created by Emir Keskin on 19.10.2022.
//

import UIKit

enum SalaryInfo {
    case netMaas
    case BasariPrimi
    case Agi
    case digerUcretler
    case hiMesUc
    case hsMesUc
    case mesaiToplam
    case mesaisizToplam
}


class SettingsOvertimeVC: UIViewController {

    @IBOutlet weak var bosLabel1: UILabel!
    @IBOutlet weak var bosLabel2: UILabel!
    @IBOutlet weak var bosLabel3: UILabel!
    @IBOutlet weak var bosLabel4: UILabel!
    @IBOutlet weak var bosLabel5: UILabel!
    @IBOutlet weak var bosLabel6: UILabel!
    @IBOutlet weak var bosLabel7: UILabel!
    @IBOutlet weak var bosLabel8: UILabel!
    @IBOutlet weak var bosLabel9: UILabel!
    
    @IBOutlet weak var netSalaryLabel: UILabel!
    @IBOutlet weak var netSalaryText: UITextField!
    
    @IBOutlet weak var numberOfAchBonusLabel: UILabel!
    @IBOutlet weak var numberOfAchBonusText: UITextField!
    
    @IBOutlet weak var AgDeductionLabel: UILabel!
    @IBOutlet weak var AgDeductionText: UITextField!
    
    @IBOutlet weak var otherFeesLabel: UILabel!
    @IBOutlet weak var otherFeesText: UITextField!
    
    @IBOutlet var imageOK: UIImageView!
    
    
    var netMaaas: String?
    var primAdetiL: String?
    var agi: String?
    var netMaasDouble: Double?
    var overTimeTotal: Double?
    var hs100MesaiUcretiR2: Double?
    var hi50MesaiUcretiR2: Double?
    var mesaisizToplamD: Double?
    var netMaasST: String?
    var maas: Double?
    var sonucBP: Double?
    var sonucAgi:Double?
    var resultOtherFees: Double?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let klavyeyiKapatmakIcin = UITapGestureRecognizer(target: self, action: #selector(klavyeyiKapat))
        view.addGestureRecognizer(klavyeyiKapatmakIcin)
        dataMain()
    }
    
     override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         dataMain()
         imageOK.image = .none
     }
     
     override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
         dataMain()
     }
    
    @objc func klavyeyiKapat() {
            view.endEditing(true)
    }
    
    
    func dataMain() {
        myData(on: .netMaas)
        myData(on: .BasariPrimi)
        myData(on: .Agi)
        myData(on: .digerUcretler)
        myData(on: .hiMesUc)
        myData(on: .hsMesUc)
        myData(on: .mesaiToplam)
        myData(on: .mesaisizToplam)
    }
   
    func setData() {

       dataSet(on: .netMaas)
       dataSet(on: .BasariPrimi)
       dataSet(on: .Agi)
       dataSet(on: .digerUcretler)
       dataSet(on: .hiMesUc)
       dataSet(on: .hsMesUc)
       dataSet(on: .mesaiToplam)
       dataSet(on: .mesaisizToplam)
       
    }
    
    func makeAlert(titleM: String, messageM: String) {
    let alert = UIAlertController(title: titleM, message: messageM, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "TAMAM", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func myData(on datas: SalaryInfo){
        switch datas {
        case .netMaas:
            let girilenMaas = UserDefaults.standard.object(forKey: "maas")
            if let girilenMaasD = girilenMaas as? Double {
                netMaasDouble = girilenMaasD
                netSalaryLabel.text =  "Net Maaşınız: \(netMaasDouble!)"
            }
            if let girilenMaasD = girilenMaas as? String {
                netMaasST = girilenMaasD
                netSalaryLabel.text =  "Net Maaşınız: \(netMaasST!)"
            }
        case .BasariPrimi:
            let primUcreti = UserDefaults.standard.object(forKey: "primUcreti")
            if let toplamPrim = primUcreti as? String {
            }
            let girilenPrim = UserDefaults.standard.object(forKey: "prim")
            if let primAdeti = girilenPrim as? String {
                numberOfAchBonusLabel.text = "Başarı Priminiz: \(primAdeti) Adettir"
            }
        case .Agi:
            let girilenAgi = UserDefaults.standard.object(forKey: "agi")
            if let agiUcreti = girilenAgi as? String {
                AgDeductionLabel.text = "Agi Ücretiniz: \(agiUcreti) TL"
            }
        case .digerUcretler:
            let otherFeeS2 = UserDefaults.standard.object(forKey: "otherLabel") ?? "Boş"
            let otherFeeS3 = UserDefaults.standard.object(forKey: "other") ?? "Boş"
            if let otherFee2 = otherFeeS2 as? String {
            if let otherFee3 = otherFeeS3 as? String {
                otherFeesLabel.text = "\(otherFee2): \(otherFee3) TL"
            }
                }
        case .hiMesUc:
            let hi50MesaiUcreti = UserDefaults.standard.object(forKey: "50kazanc")
            if let hi50MesaiUcretiR = hi50MesaiUcreti as? Double {
                hi50MesaiUcretiR2 = hi50MesaiUcretiR
            }
            
        case .hsMesUc:
            let hs100MesaiUcreti = UserDefaults.standard.object(forKey: "100kazanc")
            if let hs100MesaiUcretiR = hs100MesaiUcreti as? Double {
                hs100MesaiUcretiR2 = hs100MesaiUcretiR
            }
            
        case .mesaiToplam:
            let mesaiToplamlari = UserDefaults.standard.object(forKey: "toplamMesai")
            if let mesaiToplam = mesaiToplamlari as? Double {
                overTimeTotal = mesaiToplam
            }
            
        case .mesaisizToplam:
            if let mesaisizToplam = UserDefaults.standard.object(forKey: "mesaisizToplam") as? Double {
                mesaisizToplamD = mesaisizToplam
            }
        }
      }
    
    
    func dataSet(on setData: SalaryInfo){
        switch setData {
        case .netMaas:
            if netSalaryText.text == "" {
                makeAlert(titleM: "HATA", messageM: "MAAŞINI YAZMALISIN")
            } else {
            if let netMaas = Double(netSalaryText.text!) {
                maas = netMaas
                let maasString = "\(maas!) TL"
                netSalaryLabel.text = "Net Maaşınız: \(maas!)"
                UserDefaults.standard.set(maasString, forKey: "maas")
                UserDefaults.standard.set(maas, forKey: "maasD")
            }
            }
        case .BasariPrimi:
            if numberOfAchBonusText.text == "" {
              makeAlert(titleM: "HATA", messageM: "PRİM ADETİ YAZMALISIN")
             } else {
                if let bPrimiAdeti = Double(numberOfAchBonusText.text!) {
                    sonucBP = bPrimiAdeti
                    let primAdeti =  "\(sonucBP!)"
                    numberOfAchBonusLabel.text = "Başarı Priminiz: \(primAdeti) Adettir"
                    UserDefaults.standard.set(primAdeti, forKey: "prim")
                        
                    let basariPrimi =  bPrimiAdeti * maas! / 12
                    let basariPrimiUcreti = "\(ceil(basariPrimi)) TL"
                    bosLabel3.text = "Başarı Priminiz: \(basariPrimiUcreti)"
                    UserDefaults.standard.set(basariPrimiUcreti, forKey: "primUcreti")
                }
             }
        case .Agi:
            if AgDeductionText.text == "" {
                        makeAlert(titleM: "HATA", messageM: "AGİ'Nİ YAZMALISIN")
                        } else {
                    if let agi = Double(AgDeductionText.text!) {
                        sonucAgi = agi
                        let agiUcreti = "\(sonucAgi!)"
                        AgDeductionLabel.text = "Agi Ücretiniz: \(agi) TL"
                        UserDefaults.standard.set(agiUcreti, forKey: "agi")
                    }
                        }
        case .digerUcretler:
                        if let otherFees = Double(otherFeesText.text!) {
                            resultOtherFees = otherFees
                            let otherFee = "\(resultOtherFees!) TL"
                            otherFeesLabel.text =  "Diğer Ücret: \(otherFee) TL"
                            UserDefaults.standard.set(otherFee, forKey: "other")
                        } else {
                            resultOtherFees = 0
                        }
        case .hiMesUc:
            if AgDeductionText.text == "" {
                        makeAlert(titleM: "HATA", messageM: "AGİ'Nİ YAZMALISIN")
                        } else {
            let hi50MesaiSaatUcreti = maas! / 225 * 1.5
            UserDefaults.standard.set(hi50MesaiSaatUcreti, forKey: "50kazanc")
                        }
        case .hsMesUc:
            if AgDeductionText.text == "" {
                        makeAlert(titleM: "HATA", messageM: "AGİ'Nİ YAZMALISIN")
                        } else {
            let hs100MesaiSaatUcreti = maas! / 225 * 2
            UserDefaults.standard.set(hs100MesaiSaatUcreti, forKey: "100kazanc")
                }
        case .mesaiToplam:
            if AgDeductionText.text == "" {
                        makeAlert(titleM: "HATA", messageM: "AGİ'Nİ YAZMALISIN")
                        } else {
            let sonucT = "\((maas!) + ceil((maas! * sonucBP! / 12)) + (sonucAgi!) + (resultOtherFees!)) TL"
            UserDefaults.standard.set(sonucT, forKey: "tkazanc")
                        }
        case .mesaisizToplam:
            if AgDeductionText.text == "" {
                        makeAlert(titleM: "HATA", messageM: "AGİ'Nİ YAZMALISIN")
                        } else {
                            let sonucTop2 = maas! + (maas! * sonucBP! / 12) + sonucAgi! + resultOtherFees!
            UserDefaults.standard.set(sonucTop2, forKey: "mesaisizToplam")

            UserDefaults.standard.set(overTimeTotal, forKey: "toplamMesai")
                        }
        }
        }
                
    @IBAction func SaveButton(_ sender: Any) {
        setData()
        if netSalaryText.text != "" {
            if numberOfAchBonusText.text != "" {
                if AgDeductionText.text  != "" {
                    imageOK.image = UIImage(named: "ok")
                }
            }
            
        }
        
  }
}
