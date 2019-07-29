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
    

    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    var nombreUno:String = ""
    var nombreDos:String = ""
    var mejorDeGames:String = ""
    var puntosPlayerOne = 0
    var puntosPlayerTwo = 0
    var puntosString1 = ""
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        botonJugador1.isEnabled = false
        botonJugador2.isEnabled = false
        botonJugador1.setTitle(nombreUno, for: .normal)
        botonJugador2.setTitle(nombreDos, for: .normal)
        cantidadGames.text = "Mejor de \(mejorDeGames) games"
       // Do any additional setup after loading the view.
    }
    
    @IBAction func volver(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func puntajeJugador1(_ sender: UIButton) {
        
        puntosPlayerOne += 1
       
        nombreJugador1.text = String(puntosPlayerOne)
        resultadoGame.text = ganadorDelPartido(puntosOne: puntosPlayerOne, puntosTwo: puntosPlayerTwo, nombre: nombreUno)
        nombreJugador1.text = String(puntosPlayerOne)
        
        botonJugador1.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
        botonJugador2.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
    }
    
    @IBAction func puntajeJugador2(_ sender: UIButton) {
        puntosPlayerTwo += 1
        
        nombreJugador2.text = String(puntosPlayerTwo)
        resultadoGame.text = ganadorDelPartido(puntosOne: puntosPlayerTwo, puntosTwo: puntosPlayerOne, nombre: nombreDos)
        nombreJugador2.text = String(puntosPlayerTwo)
        
        botonJugador1.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
        botonJugador2.isEnabled = desactivarBotones(resultadoGame: resultadoGame.text!)
    }
    
    @IBAction func comenzar(_ sender: UIButton) {
        botonJugador1.isEnabled = true
        botonJugador2.isEnabled = true
        puntosPlayerOne = 0
        puntosPlayerTwo = 0
        nombreJugador1.text = "0"
        nombreJugador2.text = "0"
        resultadoGame.text = ""
    }
    
}
