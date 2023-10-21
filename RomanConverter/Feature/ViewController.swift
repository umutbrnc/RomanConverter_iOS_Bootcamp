//
//  ViewController.swift
//  RomanConverter
//
//  Created by Emincan Antalyalı, Berkay Yaman, Hüseyin Gökalp Okumuş, Murat Kaya, Umut Birinci
// on 14.10.2023.
//

import UIKit

final class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textfiledINput: UITextField!
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var buttonX: UIButton!

   private let acceptalbleChars = " CDILMVXcdiılmxv"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textfiledINput.autocapitalizationType = .allCharacters
        textfiledINput.delegate = self
        textfiledINput.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)), for: .editingChanged)

    }

    @IBAction func didtap(_ sender: Any) {
        let  x = Calculator.convertRomanToInt(romanNumber: textfiledINput.text ?? "")
        do {
            let validRoman =  try Regex("^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$")
            if !(textfiledINput.text?.contains(validRoman) ?? true) {
                self.presentAlert(status: .error, message: "Invalid number")
               return
            }
        } catch  {
            self.presentAlert(status: .error, message: "Invalid number")
        }

        if Calculator.checkNextSame(romanNumber: textfiledINput.text ?? "") {
            if x < 4999 {
                output.text = String(x)
            } else {
                self.presentAlert(status: .error, message: "Invalid number")
            }
        }
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        if textfiledINput.text != "" {
            buttonX.isEnabled = true
        } else {
            buttonX.isEnabled = false
        }
    }

    @IBAction func addFovorite(_ sender: Any) {
        guard let text = textfiledINput.text else {return}
        guard let label = output.text else {return}
        var exArr =   UserDefaults.standard.object(forKey:"SavedArray") as? [String : Any] ?? [:]
        exArr[text] = label
        UserDefaults.standard.setValue(exArr, forKey: "SavedArray")
        self.presentAlert(status: .succes, message: "Kaydetme Başarılı")
    }


    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let cs = CharacterSet(charactersIn: acceptalbleChars).inverted
        let filtered: String = (string.components(separatedBy: cs) as NSArray).componentsJoined(by: "")
        return (string == filtered)
    }
}
