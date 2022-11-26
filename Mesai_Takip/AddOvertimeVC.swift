//
//  AddOvertimeVC.swift
//  Mesai_Takip
//
//  Created by Emir Keskin on 19.10.2022.
//

import UIKit

class AddOvertimeVC: UIViewController {

    @IBOutlet weak var bosLabel1: UILabel!
    @IBOutlet weak var bosLabel2: UILabel!
    @IBOutlet weak var bosLabel3: UILabel!
    @IBOutlet weak var bosLabel4: UILabel!
    @IBOutlet weak var bosLabel5: UILabel!
    @IBOutlet weak var bosLabel6: UILabel!
    @IBOutlet weak var bosLabel7: UILabel!
    @IBOutlet weak var bosLabel8: UILabel!
    
    @IBOutlet weak var weekdayOvertimeLabel: UILabel!
    @IBOutlet weak var weekdayOvertimeText: UITextField!
    
    @IBOutlet weak var weekendOvertimeLabel: UILabel!
    @IBOutlet weak var weekendOvertimeText: UITextField!
    
    @IBOutlet weak var imageOK: UIImageView!
    
    var result: Double?
    var result2: String?
    var result3: Double?
    var result4: String?
    var hs100MesaiUcr: String?
    var sonucHi50MesaiUc: String?
    var sonuc: Double?
    var sonucT: String?
    var sonuc4: String?
    var sonucHiMeSa: String?
    var toplamMesaiUcreti: Double?
    var sonucS: String?
    var netMaas: Double?
    var topMes: Double?
    var mesaisizToplamD: Double?
    var sonucTop: Double?
    var mesaisizToplamS: String?
    
    var hiMesUcr: Double?
    var hsMesUcr: Double?
    
    var toplamKazanc: String?
    var netMaas2: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
                view.addGestureRecognizer(gestureRecognizer)
            
        myData()
    
    }
    
     override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         myData()
         imageOK.image = .none
         imageOK.image = UIImage()
     }
    
      override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
          myData()
      }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func myData(){
        let data = UserDefaults.standard

        if let girilenMaasD = data.object(forKey: "maasD") as? Double {
            netMaas = girilenMaasD
            hiMesUcr = ceil(netMaas!  / 225 * 1.5)
            hsMesUcr = ceil(netMaas!  / 225 * 2)
            print(hiMesUcr!)
            print(hsMesUcr!)
        }
        if let girilenMaasD = data.object(forKey: "maas") as? String {
            netMaas2 = girilenMaasD
            bosLabel3.text = "Net Maaş:  \(girilenMaasD)"  //OKUMADI
        }
        if let guncel50Saat = data.object(forKey: "himesai") as? String {
            weekdayOvertimeLabel.text = "Mesai saati:  \(guncel50Saat)"              // labeli anlık güncellemek için ne yapmak lazım
        }
        if let guncel100Saat = data.object(forKey: "hsmesai") as? String {
            weekendOvertimeLabel.text = "Mesai Saati:  \(guncel100Saat)"
        }
        if let hi50MesaiUcretiR = data.object(forKey: "50kazanc") as? String {
            sonucHi50MesaiUc = hi50MesaiUcretiR
            bosLabel1.text = "\(sonucHi50MesaiUc!) TL"
        }
        if let hi50MesaiUcretiR = data.object(forKey: "50kazanc") as? Double {
            result3 = hi50MesaiUcretiR    //OKUMADI
        }
        if let hs100MesaiUcretiR = data.object(forKey: "100kazanc") as? String {
            hs100MesaiUcr = hs100MesaiUcretiR
            bosLabel2.text = "\(hs100MesaiUcr!) TL"
        }
        if let hs100MesaiUcretiR = data.object(forKey: "100kazanc") as? Double {
            result = hs100MesaiUcretiR   //OKUMADI
        }
        if let toplamMesaiUcreti = data.object(forKey: "toplamMesai") as? Double {
            topMes = toplamMesaiUcreti
        }
        if let tMesUc = data.object(forKey: "toplamMesai") as? String {
            bosLabel4.text = "emk:  \(tMesUc)"   //OKUMADI
        }
        if let topKazanc = data.object(forKey: "tkazanc") as? Double {
            sonuc = topKazanc    //OKUMADI.....   OKUYOR
        }
        if let topKazanc2 = data.object(forKey: "tkazanc") as? String {
            sonucT = topKazanc2  //OKUMADI... şimdi okuyor
            sonucS = "Toplam Kazanç: \(sonucT!)"  //OKUMADI... şimdi okuyor
        }
        if let mesaisizToplam = data.object(forKey: "mesaisizToplam") as? Double {
            mesaisizToplamD = mesaisizToplam
        }
        if let mesaisizToplamST = data.object(forKey: "mesaisizToplam") as? String {
            mesaisizToplamS = mesaisizToplamST
        }
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        print("Hesapla Tıklandı")
        dataSet()
   }
        
    func dataSet(){
        
        if let hiMeSa = Double(weekdayOvertimeText.text!)  {
            let hiMesaD =  hiMeSa * (hiMesUcr ?? 1 )
        result4 = "\(ceil(hiMesaD))TL"
        sonucHiMeSa = result4
        
        if let hsMeSa = Double(weekendOvertimeText.text!) {
            let hsMesaD = hsMeSa * (hsMesUcr ?? 1 )
        result2 = "\(ceil(hsMesaD))TL"
        sonuc4 = result2
            
        toplamMesaiUcreti = hsMesaD + hiMesaD
        print("Double4: \(toplamMesaiUcreti!)")
            
        sonucTop = ceil(mesaisizToplamD! + toplamMesaiUcreti!)
            toplamKazanc = "\(ceil(sonucTop!)) TL"
        }
        }
        
        let data = UserDefaults.standard
        data.set(weekdayOvertimeText.text, forKey: "himesai")
        data.set(sonucHiMeSa, forKey: "50kazanc")
        data.set(weekendOvertimeText.text, forKey: "hsmesai")
        data.set(sonuc4, forKey: "100kazanc")
        data.set(toplamMesaiUcreti, forKey: "toplamMesai")
        data.set(toplamKazanc, forKey: "tkazanc")
        
        imageOK.image = UIImage(named: "ok")
    }
}
