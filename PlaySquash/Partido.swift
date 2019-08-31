//
//  Partido.swift
//  PlaySquash
//
//  Created by Fernando on 03/07/2019.
//  Copyright © 2019 Fernando Salvador. All rights reserved.
//

import UIKit

class Partido: UIViewController {
    
    @IBOutlet weak var nombreJugador1: UILabel!
    @IBOutlet weak var nombreJugador2: UILabel!
    @IBOutlet weak var botonJugador1: UIButton!
    @IBOutlet weak var botonJugador2: UIButton!
    @IBOutlet weak var cantidadGames: UILabel!
    @IBOutlet weak var resultadoGame: UILabel!
    @IBOutlet weak var izqJugadorUno: UILabel!
    @IBOutlet weak var derJugadorUno: UILabel!
    @IBOutlet weak var izqJugadorDos: UILabel!
    @IBOutlet weak var derJugadorDos: UILabel!
    @IBOutlet weak var gameUno: UILabel!
    @IBOutlet weak var gameDos: UILabel!
    @IBOutlet weak var continuar: UIButton!
    

    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    var nombreUno:String = ""
    var nombreDos:String = ""
    var mejorDeGames:String = ""
    var puntosPlayerOne = 0
    var puntosPlayerTwo = 0
    var puntosString1 = ""
    var juegoUno = 0
    var juegoDos = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        izqJugadorUno.isHidden = true
        derJugadorUno.isHidden = true
        izqJugadorDos.isHidden = true
        derJugadorDos.isHidden = true
        botonJugador1.isEnabled = false
        botonJugador2.isEnabled = false
        botonJugador1.setTitle(nombreUno, for: .normal)
        botonJugador2.setTitle(nombreDos, for: .normal)
        cantidadGames.text = "Mejor de \(mejorDeGames) games"
        gameUno.text = String(juegoUno)
        gameDos.text = String(juegoDos)
       // Do any additional setup after loading the view.
    }
    
    @IBAction func volver(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func puntajeJugador1(_ sender: UIButton) {
        
        switch mejorDeGames {
        
        case "1":
            
            puntosPlayerOne += 1
        
            derJugadorDos.isHidden = true
            izqJugadorDos.isHidden = true
        
            if derJugadorUno.isHidden == false{
                self.derJugadorUno.isHidden = true
                self.izqJugadorUno.isHidden = false
            }else {
                self.derJugadorUno.isHidden = false
                self.izqJugadorUno.isHidden = true
            }
       
            resultadoGame.text = ganadorDelPartido(puntosOne: puntosPlayerOne, puntosTwo: puntosPlayerTwo, nombre: nombreUno)
            nombreJugador1.text = String(puntosPlayerOne)
        
            botonJugador1.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
            botonJugador2.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
            
        case "3":
                
                puntosPlayerOne += 1
                derJugadorDos.isHidden = true
                izqJugadorDos.isHidden = true
                
                if derJugadorUno.isHidden == false{
                    self.derJugadorUno.isHidden = true
                    self.izqJugadorUno.isHidden = false
                }else {
                    self.derJugadorUno.isHidden = false
                    self.izqJugadorUno.isHidden = true
                }
                
                resultadoGame.text = ganadorDelPartido(puntosOne: puntosPlayerOne, puntosTwo: puntosPlayerTwo, nombre: nombreUno)
                nombreJugador1.text = String(puntosPlayerOne)
                
                botonJugador1.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
                botonJugador2.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
                if botonJugador1.isEnabled == false {
                    juegoUno += 1
                    gameUno.text = String(juegoUno)
                }
                
                continuar.isHidden = desactivarBotones(resultadoGame: resultadoGame.text!)
            
                if juegoUno == 2 {
                    continuar.isHidden = true
            }
        
        case "5":
            puntosPlayerOne += 1
            derJugadorDos.isHidden = true
            izqJugadorDos.isHidden = true
            
            if derJugadorUno.isHidden == false{
                self.derJugadorUno.isHidden = true
                self.izqJugadorUno.isHidden = false
            }else {
                self.derJugadorUno.isHidden = false
                self.izqJugadorUno.isHidden = true
            }
            
            resultadoGame.text = ganadorDelPartido(puntosOne: puntosPlayerOne, puntosTwo: puntosPlayerTwo, nombre: nombreUno)
            nombreJugador1.text = String(puntosPlayerOne)
            
            botonJugador1.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
            botonJugador2.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
            if botonJugador1.isEnabled == false {
                juegoUno += 1
                gameUno.text = String(juegoUno)
            }
            
            continuar.isHidden = desactivarBotones(resultadoGame: resultadoGame.text!)
            
            if juegoUno == 3 {
                continuar.isHidden = true
            }
        
        default:
            break
        }
    }
    
    @IBAction func puntajeJugador2(_ sender: UIButton) {
        switch mejorDeGames {
            
        case "1":
            
            puntosPlayerTwo += 1
            
            derJugadorUno.isHidden = true
            izqJugadorUno.isHidden = true
            
            if derJugadorDos.isHidden == false{
                self.derJugadorDos.isHidden = true
                self.izqJugadorDos.isHidden = false
            }else {
                self.derJugadorDos.isHidden = false
                self.izqJugadorDos.isHidden = true
            }
            
            resultadoGame.text = ganadorDelPartido(puntosOne: puntosPlayerTwo, puntosTwo: puntosPlayerOne, nombre: nombreDos)
            nombreJugador2.text = String(puntosPlayerTwo)
            
            botonJugador1.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
            botonJugador2.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
            
        case "3":
            
            puntosPlayerTwo += 1
            derJugadorUno.isHidden = true
            izqJugadorUno.isHidden = true
            
            if derJugadorDos.isHidden == false{
                self.derJugadorDos.isHidden = true
                self.izqJugadorDos.isHidden = false
            }else {
                self.derJugadorDos.isHidden = false
                self.izqJugadorDos.isHidden = true
            }
            
            resultadoGame.text = ganadorDelPartido(puntosOne: puntosPlayerTwo, puntosTwo: puntosPlayerOne, nombre: nombreDos)
            nombreJugador2.text = String(puntosPlayerTwo)
            
            botonJugador1.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
            botonJugador2.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
            if botonJugador2.isEnabled == false {
                juegoDos += 1
                gameDos.text = String(juegoDos)
            }
            
            continuar.isHidden = desactivarBotones(resultadoGame: resultadoGame.text!)
            
            if juegoDos == 2 {
                continuar.isHidden = true
            }
            
        case "5":
            puntosPlayerTwo += 1
            derJugadorUno.isHidden = true
            izqJugadorUno.isHidden = true
            
            if derJugadorDos.isHidden == false{
                self.derJugadorDos.isHidden = true
                self.izqJugadorDos.isHidden = false
            }else {
                self.derJugadorDos.isHidden = false
                self.izqJugadorDos.isHidden = true
            }
            
            resultadoGame.text = ganadorDelPartido(puntosOne: puntosPlayerTwo, puntosTwo: puntosPlayerOne, nombre: nombreDos)
            nombreJugador2.text = String(puntosPlayerTwo)
            
            botonJugador1.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
            botonJugador2.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
            if botonJugador2.isEnabled == false {
                juegoDos += 1
                gameDos.text = String(juegoDos)
            }
            
            continuar.isHidden = desactivarBotones(resultadoGame: resultadoGame.text!)
            
            if juegoDos == 3 {
                continuar.isHidden = true
            }
            
        default:
            break
        }
    }
    
    
    @IBAction func continuar(_ sender: UIButton) {
        
       
        let nuevoSaque = resultadoGame.text!.contains(nombreUno)
        continuar.isHidden = true
        botonJugador1.isEnabled = true
        botonJugador2.isEnabled = true
        puntosPlayerOne = 0
        puntosPlayerTwo = 0
        nombreJugador1.text = "0"
        nombreJugador2.text = "0"
        resultadoGame.text = ""
        derJugadorUno.isHidden = true
        derJugadorDos.isHidden = true
        izqJugadorUno.isHidden = true
        izqJugadorDos.isHidden = true
        
        if nuevoSaque == true {
            derJugadorUno.isHidden = false
        }else {
            derJugadorDos.isHidden = false
        }
    }
    
    
    
    
    
    
    @IBAction func comenzar(_ sender: UIButton) {
        
    let alertSelectionSaque = UIAlertController(title: "Elección del saque", message: "Que jugador saca", preferredStyle: .actionSheet)
    alertSelectionSaque.addAction(UIAlertAction(title: "Jugador uno", style: .default, handler: { (_) in self.derJugadorUno.isHidden = false}))
    alertSelectionSaque.addAction(UIAlertAction(title: "Jugador Dos", style: .default, handler: { (_) in self.derJugadorDos.isHidden = false}))
    self.present(alertSelectionSaque, animated: true, completion: nil)
        
        botonJugador1.isEnabled = true
        botonJugador2.isEnabled = true
        puntosPlayerOne = 0
        puntosPlayerTwo = 0
        nombreJugador1.text = String(puntosPlayerOne)
        nombreJugador2.text = String(puntosPlayerTwo)
        resultadoGame.text = ""
        derJugadorUno.isHidden = true
        derJugadorDos.isHidden = true
        izqJugadorUno.isHidden = true
        izqJugadorDos.isHidden = true
        continuar.isHidden = true
        juegoUno = 0
        gameUno.text = String(juegoUno)
        continuar.setTitle("Continuar", for: .normal)
        continuar.isEnabled = true
    }
    
}
