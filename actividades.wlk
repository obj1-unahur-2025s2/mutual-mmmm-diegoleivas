import socios.*



class Viaje {
  const property idiomas = #{}
  
  method duracionDelViaje()
  
  method implicaEsfuerzo()
  
  method sirveParaBroncearse()
  
  method agregarIdioma(unIdioma) {
    idiomas.add(unIdioma)
  }
  
  method quitarUnIdioma(unIdioma) {
    idiomas.remove(unIdioma)
  }
  
  method esUnViajeInteresante() = idiomas.size() > 1
 

}

class ViajeDePlaya inherits Viaje {
  var largoDePlaya
  
  override method duracionDelViaje() = largoDePlaya / 500
  
  override method implicaEsfuerzo() = largoDePlaya > 1200
  
  override method sirveParaBroncearse() = true
}

class ViajeDeExcursionACiudad inherits Viaje {
  var cantDeAtraccionesAVisitar
  
  override method duracionDelViaje() = cantDeAtraccionesAVisitar / 2
  
  override method implicaEsfuerzo() = cantDeAtraccionesAVisitar.between(5, 8)
  
  override method sirveParaBroncearse() = false
  
  override method esUnViajeInteresante() = super() or (cantDeAtraccionesAVisitar == 5)
}

class ViajeDeExcursionACiudadTropical inherits ViajeDeExcursionACiudad {
  override method duracionDelViaje() = super() + 1
  
  override method sirveParaBroncearse() = true
}

class ViajeSalidaDeTrekking inherits Viaje {
  var cantDeKmDeSenderosARecorrer
  var diasDeSolPorAnio
  
  override method duracionDelViaje() = cantDeKmDeSenderosARecorrer / 50
  
  override method implicaEsfuerzo() = cantDeKmDeSenderosARecorrer > 80
  
  override method sirveParaBroncearse() =  diasDeSolPorAnio.between( 100, 200 )and (cantDeKmDeSenderosARecorrer > 120)
  
  override method esUnViajeInteresante() = super() and (diasDeSolPorAnio > 140)
}

object claseDeGimnasia {
  method idioma() = "español"
  
  method duracion() = 1
  
  method implicaEsfuerzo() = true
  
  method sirveParaBroncearse() = false
}