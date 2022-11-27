//
//  ExpensesListerViewController.swift
//  Mesai_Takip
//
//  Created by Emir Keskin on 27.11.2022.
//

import UIKit

class ExpensesListerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var items = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.items = UserDefaults.standard.stringArray(forKey: "items") ?? []
           print(items)
               title = "Giderler"
               view.addSubview(tableView)
               tableView.dataSource = self
               print("viewDidLoad")
               tableView.reloadData()
           print(items)

    }
    
    @IBAction func addButton(_ sender: Any) {
        let alert = UIAlertController(title: "YENİ GİRİŞ", message: "Yeni Gider yada Not Yazınız", preferredStyle: .alert)
        alert.addTextField { (field) in
            field.placeholder = "yazınız"
        }
        
        alert.addAction(UIAlertAction(title: "Vazgeç", style: .cancel, handler: nil))
      //  alert.addAction(UIAlertAction(title: "Emir", style: .destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: { [weak self] (_) in
            if let field = alert.textFields?.first {
                if let text = field.text, !text.isEmpty{
                    
                    DispatchQueue.main.async {
                        var currentItems = UserDefaults.standard.stringArray(forKey: "items") ?? []
                       
                        currentItems.append(text)
                        UserDefaults.standard.setValue(currentItems, forKey: "items")
                        self?.items.append(text)
                        self?.tableView.reloadData()
                         print(currentItems)
                        print(self!.items)
                    }
                }
            }
        }))
        present(alert, animated: true)
        print("addButton")
    }
    /*
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return items.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
           cell.textLabel?.text = items[indexPath.row]
           return cell
       }
       
       
       func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
                       tableView.deselectRow(at: indexPath, animated: true)
           let item = items[indexPath.row]
           let sheet = UIAlertController  (title: "Silmek İstediğinizden Eminmisiniz??", message: nil, preferredStyle: .actionSheet)
           sheet.addAction(UIAlertAction(title: "Vazgeç", style: .cancel, handler: nil))
           sheet.addAction(UIAlertAction(title: "Sil", style: .destructive, handler: { [weak self] _ in
               self?.items.remove(at: indexPath.row)
               var currentItems = UserDefaults.standard.stringArray(forKey: "items") ?? []
               currentItems.remove(at: indexPath.row)
               UserDefaults.standard.setValue(currentItems, forKey: "items")
               UserDefaults.standard.removeObject(forKey: item)
               UserDefaults.standard.synchronize()
               self?.tableView.reloadData()
               print(item)
               print(self!.items)
               print(currentItems)
           }))
           present(sheet, animated: true)
       }
       
           func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

           }

}
