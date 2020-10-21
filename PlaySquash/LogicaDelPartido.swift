//
//  LogicaDelPartido.swift
//  PlaySquash
//
//  Created by Fernando on 18/07/2019.
//  Copyright © 2019 Fernando Salvador. All rights reserved.
//

import Foundation




func ganadorDelPartido (puntosOne puntos1:Int, puntosTwo puntos2:Int, nombre:String) -> String {
    var resultado1:String = ""
    var resultado:String = ""
    var resultadoFinal:String = ""
    if puntos1 == 11 && puntos2 <= 9{
        resultado = NSLocalizedString("GANADOR_PARTIDO", comment: "GANADOR_PARTIDO")
        resultado1 = nombre
        resultadoFinal = resultado + resultado1
    }else if puntos1 >= 10 && puntos2 >= 10 && puntos2 == (puntos1 - 2){
        resultado = NSLocalizedString("GANADOR_PARTIDO", comment: "GANADOR_PARTIDO")
        resultado1 = nombre
        resultadoFinal = resultado + resultado1
    }
    return resultadoFinal
    }

func desactivarBotones (resultadoGame final:String) -> Bool{
    if final != "" {
        return false
    }else {
        return true
    }
}

func apagarBotonesSaque (desactivar boton:Bool) -> Bool {
    if boton == false{
        return false
    }else{
        return true
    }
}

