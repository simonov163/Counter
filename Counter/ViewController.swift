//
//  ViewController.swift
//  Counter
//
//  Created by Nikita Simonov on 20/01/2025.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var historyField: UITextView!
    private var countSummer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counter.text = "Значение счетчика: \(countSummer)"
        counter.font = .systemFont(ofSize: 24)
        counter.textAlignment = .center
        
        plusButton.setTitle("", for: .normal)
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.backgroundColor = .systemRed
        plusButton.tintColor = .white
        plusButton.layer.cornerRadius = 16
        
        minusButton.setTitle("", for: .normal)
        minusButton.setImage(UIImage(systemName: "minus"), for: .normal)
        minusButton.backgroundColor = .systemBlue
        minusButton.tintColor = .white
        minusButton.layer.cornerRadius = 16
        
        resetButton.setTitle("", for: .normal)
        resetButton.setImage(UIImage(systemName: "arrow.counterclockwise"), for: .normal)
        resetButton.backgroundColor = .systemGray
        resetButton.tintColor = .white
        resetButton.layer.cornerRadius = 16
        
        historyField.textAlignment = .left
        historyField.isEditable = false
        historyField.isScrollEnabled = true
        historyField.text = "История изменений:"
        
    }
    
    @IBAction func counterPlus(_ sender: Any) {
        let currentDate = Date()
        countSummer += 1
        counter.text = "Значение счетчика: \(countSummer)"
        historyField.text += "\n[\(formattedDate(date: currentDate))]: значение изменено на +1"
    }
    
    @IBAction func counterMinus(_ sender: Any) {
        let currentDate = Date()
        if countSummer == 0 {
            historyField.text += "\n[\(formattedDate(date: currentDate))]: попытка уменьшить значение счётчика ниже 0"
        } else {
            countSummer -= 1
            counter.text = "Значение счетчика: \(countSummer)"
            historyField.text += "\n[\(formattedDate(date: currentDate))]: значение изменено на -1"
        }
    }
    
    @IBAction func resetCounter(_ sender: Any) {
        let currentDate = Date()
        countSummer = 0
        counter.text = "Значение счетчика: \(countSummer)"
        historyField.text += "\n[\(formattedDate(date: currentDate))]: значение сброшено"
    }
    
    func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: date)
    }
}

