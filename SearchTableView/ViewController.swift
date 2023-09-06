//
//  ViewController.swift
//  SearchTableView
//
//  Created by 林祔利 on 2023/9/5.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    

    private let table: UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private let field: UITextField = {
        let field = UITextField()
        field.backgroundColor = .white
        field.placeholder = "Please input sth"
        field.borderStyle = .roundedRect
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    var data = [String]()
    var filteredData = [String]()
    var initialData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(field)
        view.addSubview(table)
        setupData()
        table.delegate = self
        table.dataSource = self
        field.delegate = self
    }
    
    func setupData(){
        data.append("Eason")
        data.append("Aason")
        data.append("Bason")
        data.append("Cason")
        data.append("Dason")
        data.append("Fason")
        data.append("Gason")
        data.append("Hason")
        data.append("Iason")
        data.append("Jason")
        data.append("EKason")
        data.append("ELason")
        data.append("Mason")
        data.append("ECason")
        
        filteredData = data
        initialData = data
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLayoutConstraint.activate([
            field.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10),
            field.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            field.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            field.heightAnchor.constraint(equalToConstant: 44)
        ])
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: field.bottomAnchor  ,constant: 0),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let data = data[indexPath.row]
        cell.textLabel?.text = data
        return cell
    }
    

}

    extension ViewController: UITextFieldDelegate {
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           
            // 取得目前 UITextField 的內容
                    let currentText = (textField.text ?? "") + string
                    
                    // 如果輸入為空，恢復為初始數據
            if string.isEmpty{
                        data = initialData
                    } else {
                        // 根據輸入的文本過濾數據
                        data = filteredData.filter { item in
                            return item.contains(currentText)
                        }
                    }
                    
                    // 重新載入表格
                    table.reloadData()
            
            return true
        }

}
