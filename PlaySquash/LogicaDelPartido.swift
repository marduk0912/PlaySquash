//
//  LogicaDelPartido.swift
//  PlaySquash
//
//  Created by Fernando on 18/07/2019.
//  Copyright © 2019 Fernando Salvador. All rights reserved.
//

import Foundation


func sumaDePuntos (one puntos1:Int, two puntos2:Int) -> String {
    var puntosString:String = ""
    if puntos1 < 11 && puntos2 <= 9 {
        puntosString = String(puntos1)
    }
    return puntosString
}

func ganadorDelPartido (puntosOne puntos1:Int, puntosTwo puntos2:Int, nombre:String) -> String {
    var resultado:String = ""
    if puntos1 == 11 && puntos2 <= 9{
        resultado = "El ganador es \(nombre)"
    }
    return resultado
}

func desactivarBotones (resultadoGame final:String) -> Bool{
    if final != ""{
        return false
    }else {
        return true
    }
}

