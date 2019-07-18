//
//  DatosJugadoresViewController.swift
//  PlaySquash
//
//  Created by Fernando on 26/06/2019.
//  Copyright © 2019 Fernando Salvador. All rights reserved.
//

import UIKit

class DatosJugadoresViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var playerOne: UITextField!
    @IBOutlet weak var playerTwo: UITextField!
    @IBOutlet weak var playersCategory: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var gameSelection: UISegmentedControl!
    @IBOutlet weak var aceptar: UIButton!
    
    var nombreDeCategorias = ["Primera", "Segunda", "Tercera", "Cuarta", "Quinta", "Sexta", "Menores"]
    
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
        
        playersCategory.inputView = category
        
        playerOne.delegate = self
        playerTwo.delegate = self
        playersCategory.delegate = self
        
        segment = games(control: gameSelection.selectedSegmentIndex)
      
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        playersCategory.resignFirstResponder()
    }
    
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passSegue"{
            let partido = segue.destination as! Partido
            partido.nombreUno = playerOne.text!
            partido.nombreDos = playerTwo.text!
            partido.mejorDeGames = String (segment)
            
        }
     
    }
        
    @IBAction func buttonAceptar(_ sender: UIButton) {
        if playerOne.text == "" || playerTwo.text == "" || playersCategory.text == ""{
            
            // create the alert
            let alert = UIAlertController(title: "ERROR", message: "Todos los campos deben estar completos", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
          
        }
    }
    
    
}

