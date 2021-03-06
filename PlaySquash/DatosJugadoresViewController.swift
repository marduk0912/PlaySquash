//
//  DatosJugadoresViewController.swift
//  PlaySquash
//
//  Created by Fernando on 26/06/2019.
//  Copyright © 2019 Fernando Salvador. All rights reserved.
//

import UIKit

class DatosJugadoresViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var playerOne: UITextField!
    @IBOutlet weak var playerTwo: UITextField!
    @IBOutlet weak var playersCategory: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var gameSelection: UISegmentedControl!
    @IBOutlet weak var aceptar: UIButton!
    
    var nombreDeCategorias = [NSLocalizedString("CATEGORIA_PRIMERA", comment: "CATEGORIA_PRIMERA"), NSLocalizedString("CATEGORIA_SEGUNDA", comment: "CATEGORIA_SEGUNDA"), NSLocalizedString("CATEGORIA_TERCERA", comment: "CATEGORIA_TERCERA"), NSLocalizedString("CATEGORIA_CUARTA", comment: "CATEGORIA_CUARTA"), NSLocalizedString("CATEGORIA_QUINTA", comment: "CATEGORIA_QUINTA"), NSLocalizedString("CATEGORIA_SEXTA", comment: "CATEGORIA_SEXTA"), NSLocalizedString("CATEGORIA_MENORES", comment: "CATEGORIA_MENORES")]
    
    var segment:Int = 0
  
    
    override var prefersStatusBarHidden: Bool{
        return true
    }

    @IBAction func cancelar (sender:UIButton){
        dismiss(animated: true, completion: nil)
    }
    
    
    func games(control:Int) -> Int{
        let section = gameSelection.selectedSegmentIndex
        
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        default:
            return 5
        }
    }
    
    @IBAction func selectionSegment(_ sender: UISegmentedControl) {
        
        segment = games(control: gameSelection.selectedSegmentIndex)
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let category = UIPickerView()
        category.delegate = self
        category.dataSource = self
        playersCategory.inputView = category
        
        playerOne.delegate = self
        playerTwo.delegate = self
        playersCategory.delegate = self
        
        crearToolBarPicker()
        
        segment = games(control: gameSelection.selectedSegmentIndex)
      
        // Do any additional setup after loading the view.
       
    }
    
    func crearToolBarPicker() {
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.default
        toolbar.isTranslucent = false
        toolbar.tintColor = .black
        let espacio = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let botonHecho = UIBarButtonItem(title: "Ok", style: .plain, target: self, action: #selector(self.ocultarTeclado))
        toolbar.isTranslucent = true
        toolbar.setItems([espacio, botonHecho], animated: false)
        toolbar.isUserInteractionEnabled = true
        toolbar.sizeToFit()
        playersCategory.inputAccessoryView = toolbar
        
    }
    
    @objc func ocultarTeclado() {
        
        view.endEditing(true)
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        playersCategory.resignFirstResponder()
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passSegue"{
            let partido = segue.destination as! Partido
            partido.nombreUno = playerOne.text!
            partido.nombreDos = playerTwo.text!
            partido.mejorDeGames = NSLocalizedString("MEJOR_GAMES", comment: "MEJOR_GAMES") + String (segment) + " games"
            partido.games = String (segment)
            
        }
     
    }
        
    @IBAction func buttonAceptar(_ sender: UIButton) {
        if playerOne.text == "" || playerTwo.text == "" || playersCategory.text == ""{
            
            // create the alert
            let alert = UIAlertController(title: "ERROR", message: NSLocalizedString("CAMPOS_DATOS", comment: "CAMPOS_DATOS"), preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
          
        }
    }
    
    
}


extension DatosJugadoresViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return nombreDeCategorias.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return nombreDeCategorias[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        playersCategory.text = nombreDeCategorias[row]
    }
    
}

