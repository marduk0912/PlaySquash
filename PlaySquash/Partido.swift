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
    @IBOutlet weak var comenzar: UIButton!
    @IBOutlet weak var saqueJugador1: UILabel!
    @IBOutlet weak var saqueJugador2: UILabel!
    @IBOutlet weak var SaqueDerecha1: UIButton!
    @IBOutlet weak var saqueIzquierda1: UIButton!
    @IBOutlet weak var saqueDerecha2: UIButton!
    @IBOutlet weak var saqueIzquierda2: UIButton!
    

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
    var ganador = ""
    
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
           
            if saqueJugador2.isHidden == false {
                saqueJugador2.isHidden = true
                saqueDerecha2.isHidden = true
                saqueIzquierda2.isHidden = true
            }
            
            if derJugadorUno.isHidden == true && izqJugadorUno.isHidden == true {
                derJugadorUno.isHidden = true
                izqJugadorUno.isHidden = true
                saqueJugador1.isHidden = false
                SaqueDerecha1.isHidden = false
                saqueIzquierda1.isHidden = false
                
            }else {
             if derJugadorUno.isHidden == false{
                self.derJugadorUno.isHidden = true
                self.izqJugadorUno.isHidden = false
            }else {
                self.derJugadorUno.isHidden = false
                self.izqJugadorUno.isHidden = true
            }
            }
        
            resultadoGame.text = ganadorDelPartido(puntosOne: puntosPlayerOne, puntosTwo: puntosPlayerTwo, nombre: nombreUno)
            nombreJugador1.text = String(puntosPlayerOne)
        
            botonJugador1.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
            botonJugador2.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
            
            if resultadoGame.text! == ""{
                botonJugador1.isEnabled = apagarBotonesSaque(desactivar: saqueJugador1.isHidden)
                botonJugador2.isEnabled = apagarBotonesSaque(desactivar: saqueJugador1.isHidden)
            }
            
        case "3":
            
                comenzar.isEnabled = false
                puntosPlayerOne += 1
                derJugadorDos.isHidden = true
                izqJugadorDos.isHidden = true
                
                
                if derJugadorUno.isHidden == true && izqJugadorUno.isHidden == true {
                    derJugadorUno.isHidden = true
                    izqJugadorUno.isHidden = true
                    saqueJugador1.isHidden = false
                    SaqueDerecha1.isHidden = false
                    saqueIzquierda1.isHidden = false
                }else {
                 if derJugadorUno.isHidden == false{
                    self.derJugadorUno.isHidden = true
                    self.izqJugadorUno.isHidden = false
                }else {
                    self.derJugadorUno.isHidden = false
                    self.izqJugadorUno.isHidden = true
                }
                }
                
                resultadoGame.text = ganadorDelPartido(puntosOne: puntosPlayerOne, puntosTwo: puntosPlayerTwo, nombre: nombreUno)
                nombreJugador1.text = String(puntosPlayerOne)
                ganador = resultadoGame.text!
                
                botonJugador1.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
                botonJugador2.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
                
                if resultadoGame.text! == ""{
                    botonJugador1.isEnabled = apagarBotonesSaque(desactivar: saqueJugador1.isHidden)
                    botonJugador2.isEnabled = apagarBotonesSaque(desactivar: saqueJugador1.isHidden)
                }
                
                if ganador.contains(nombreUno) {
                    juegoUno += 1
                    gameUno.text = String(juegoUno)
                }
                
                continuar.isHidden = desactivarBotones(resultadoGame: resultadoGame.text!)
            
                if juegoUno == 2 {
                    continuar.isHidden = true
                    comenzar.isEnabled = true
            }
        
        case "5":
            
            comenzar.isEnabled = false
            puntosPlayerOne += 1
            derJugadorDos.isHidden = true
            izqJugadorDos.isHidden = true
            
            
            if derJugadorUno.isHidden == true && izqJugadorUno.isHidden == true {
                derJugadorUno.isHidden = true
                izqJugadorUno.isHidden = true
                saqueJugador1.isHidden = false
                SaqueDerecha1.isHidden = false
                saqueIzquierda1.isHidden = false
            }else {
             if derJugadorUno.isHidden == false{
                self.derJugadorUno.isHidden = true
                self.izqJugadorUno.isHidden = false
            }else {
                self.derJugadorUno.isHidden = false
                self.izqJugadorUno.isHidden = true
            }
            }
            
            resultadoGame.text = ganadorDelPartido(puntosOne: puntosPlayerOne, puntosTwo: puntosPlayerTwo, nombre: nombreUno)
            nombreJugador1.text = String(puntosPlayerOne)
            ganador =  resultadoGame.text!
            
            botonJugador1.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
            botonJugador2.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
            
            if resultadoGame.text! == ""{
                botonJugador1.isEnabled = apagarBotonesSaque(desactivar: saqueJugador1.isHidden)
                botonJugador2.isEnabled = apagarBotonesSaque(desactivar: saqueJugador1.isHidden)
            }
            
            if ganador.contains(nombreUno) {
                juegoUno += 1
                gameUno.text = String(juegoUno)
            }
            
            continuar.isHidden = desactivarBotones(resultadoGame: resultadoGame.text!)
            
            if juegoUno == 3 {
                
                comenzar.isEnabled = true
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
            
            if derJugadorDos.isHidden == true && izqJugadorDos.isHidden == true {
                derJugadorDos.isHidden = true
                izqJugadorDos.isHidden = true
                saqueJugador2.isHidden = false
                saqueDerecha2.isHidden = false
                saqueIzquierda2.isHidden = false
            }else{
                if derJugadorDos.isHidden == false{
                    self.derJugadorDos.isHidden = true
                    self.izqJugadorDos.isHidden = false
                }else {
                    self.derJugadorDos.isHidden = false
                    self.izqJugadorDos.isHidden = true
                }
            }
            
            resultadoGame.text = ganadorDelPartido(puntosOne: puntosPlayerTwo, puntosTwo: puntosPlayerOne, nombre: nombreDos)
            nombreJugador2.text = String(puntosPlayerTwo)
            
            botonJugador1.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
            botonJugador2.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
            
            if resultadoGame.text! == ""{
                botonJugador1.isEnabled = apagarBotonesSaque(desactivar: saqueJugador2.isHidden)
                botonJugador2.isEnabled = apagarBotonesSaque(desactivar: saqueJugador2.isHidden)
            }
            
        case "3":
            
            comenzar.isEnabled = false
            puntosPlayerTwo += 1
             derJugadorUno.isHidden = true
            izqJugadorUno.isHidden = true
                       
            if derJugadorDos.isHidden == true && izqJugadorDos.isHidden == true {
                derJugadorDos.isHidden = true
                izqJugadorDos.isHidden = true
                saqueJugador2.isHidden = false
                saqueDerecha2.isHidden = false
                saqueIzquierda2.isHidden = false
                }else{
                    if derJugadorDos.isHidden == false{
                        self.derJugadorDos.isHidden = true
                        self.izqJugadorDos.isHidden = false
                    }else {
                        self.derJugadorDos.isHidden = false
                        self.izqJugadorDos.isHidden = true
                    }
                }
            
            resultadoGame.text = ganadorDelPartido(puntosOne: puntosPlayerTwo, puntosTwo: puntosPlayerOne, nombre: nombreDos)
            nombreJugador2.text = String(puntosPlayerTwo)
            ganador =  resultadoGame.text!
            
            botonJugador1.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
            botonJugador2.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
            
            if resultadoGame.text! == ""{
                botonJugador1.isEnabled = apagarBotonesSaque(desactivar: saqueJugador2.isHidden)
                botonJugador2.isEnabled = apagarBotonesSaque(desactivar: saqueJugador2.isHidden)
            }
            
            if ganador.contains(nombreDos) {
                juegoDos += 1
                gameDos.text = String(juegoDos)
            }
            
            continuar.isHidden = desactivarBotones(resultadoGame: resultadoGame.text!)
            
            if juegoDos == 2 {
                
                comenzar.isEnabled = true
                continuar.isHidden = true
            }
            
        case "5":
            
            comenzar.isEnabled = false
            puntosPlayerTwo += 1
            derJugadorUno.isHidden = true
            izqJugadorUno.isHidden = true
                       
            if derJugadorDos.isHidden == true && izqJugadorDos.isHidden == true {
                derJugadorDos.isHidden = true
                izqJugadorDos.isHidden = true
                saqueJugador2.isHidden = false
                saqueDerecha2.isHidden = false
                saqueIzquierda2.isHidden = false
                }else{
                    if derJugadorDos.isHidden == false{
                        self.derJugadorDos.isHidden = true
                        self.izqJugadorDos.isHidden = false
                    }else {
                        self.derJugadorDos.isHidden = false
                        self.izqJugadorDos.isHidden = true
                    }
                }
            
            resultadoGame.text = ganadorDelPartido(puntosOne: puntosPlayerTwo, puntosTwo: puntosPlayerOne, nombre: nombreDos)
            nombreJugador2.text = String(puntosPlayerTwo)
            ganador = resultadoGame.text!
            
            botonJugador1.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
            botonJugador2.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
            
             if resultadoGame.text! == ""{
                           botonJugador1.isEnabled = apagarBotonesSaque(desactivar: saqueJugador2.isHidden)
                           botonJugador2.isEnabled = apagarBotonesSaque(desactivar: saqueJugador2.isHidden)
                       }
            
            if ganador.contains(nombreDos) {
                juegoDos += 1
                gameDos.text = String(juegoDos)
            }
            
            continuar.isHidden = desactivarBotones(resultadoGame: resultadoGame.text!)
            
            if juegoDos == 3 {
                
                comenzar.isEnabled = true
                continuar.isHidden = true
            }
            
        default:
            break
        }
    }
    
    
    @IBAction func continuar(_ sender: UIButton) {
        
       
        let nuevoSaque = resultadoGame.text!.contains(nombreUno)
        continuar.isHidden = true
        botonJugador1.isEnabled = false
        botonJugador2.isEnabled = false
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
            derJugadorUno.isHidden = true
            izqJugadorUno.isHidden = true
            saqueJugador1.isHidden = false
            SaqueDerecha1.isHidden = false
            saqueIzquierda1.isHidden = false
        }else {
            derJugadorDos.isHidden = true
            izqJugadorDos.isHidden = true
            saqueJugador2.isHidden = false
            saqueDerecha2.isHidden = false
            saqueIzquierda2.isHidden = false
        }
    }
    
    
    
    
    
    
    @IBAction func comenzar(_ sender: UIButton) {
        
    let alertSelectionSaque = UIAlertController(title: "Elección del saque", message: "Que jugador saca", preferredStyle: .actionSheet)
        
        
    alertSelectionSaque.addAction(UIAlertAction(title: nombreUno, style: .default, handler: { (_) in self.saqueJugador1.isHidden = false; self.SaqueDerecha1.isHidden = false; self.saqueIzquierda1.isHidden = false}))
    alertSelectionSaque.addAction(UIAlertAction(title: nombreDos, style: .default, handler: { (_) in self.saqueJugador2.isHidden = false; self.saqueDerecha2.isHidden = false; self.saqueIzquierda2.isHidden = false}))
        
        
    self.present(alertSelectionSaque, animated: true, completion: nil)
        
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
        juegoDos = 0
        gameUno.text = String(juegoUno)
        gameDos.text = String(juegoDos)
        continuar.setTitle("Continuar", for: .normal)
        continuar.isEnabled = true
        comenzar.isEnabled = false
    }
    
    @IBAction func derecha1(_ sender: UIButton) {
        botonJugador1.isEnabled = true
        botonJugador2.isEnabled = true
        saqueJugador1.isHidden = true
        SaqueDerecha1.isHidden = true
        saqueIzquierda1.isHidden = true
        derJugadorUno.isHidden = false
    }
    
    @IBAction func izquierda1(_ sender: UIButton) {
        botonJugador1.isEnabled = true
        botonJugador2.isEnabled = true
        saqueJugador1.isHidden = true
        SaqueDerecha1.isHidden = true
        saqueIzquierda1.isHidden = true
        izqJugadorUno.isHidden = false
    }
    
    @IBAction func derecha2(_ sender: UIButton) {
        botonJugador1.isEnabled = true
        botonJugador2.isEnabled = true
        saqueJugador2.isHidden = true
        saqueDerecha2.isHidden = true
        saqueIzquierda2.isHidden = true
        derJugadorDos.isHidden = false
    }
    
    @IBAction func izquierda2(_ sender: UIButton) {
        botonJugador1.isEnabled = true
        botonJugador2.isEnabled = true
        saqueJugador2.isHidden = true
        saqueIzquierda2.isHidden = true
        saqueDerecha2.isHidden = true
        izqJugadorDos.isHidden = false
    }
    
}
