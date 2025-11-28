import actividades.*

class Socio {
  const actividadRealizada = []
  var maximoActividades 
  var edad
  const property idiomasHablados = #{}
  var tipoDeSocio

  
  method agregarActividadRealizada(unaActividad) {
    actividadRealizada.add(unaActividad)
  }
  method agregarNuevaActividad(unaActividad) {
    if(actividadRealizada.size() < maximoActividades) {
      actividadRealizada.add(unaActividad)
    }else { self.error("No tiene mas cupo para actividades")}
    
  }
  
  method quitarActividadRealizada(unaActividad) {
    actividadRealizada.remove(unaActividad)
  }

  method agregarIdioma(unIdioma) {
    idiomasHablados.add(unIdioma)
    
  }
  method quitarIdioma(unIdioma) {
    idiomasHablados.remove(unIdioma)
  }

  method esAdoradorDelSol() = actividadRealizada.all({a=>a.sirveParaBroncearse()})
  method actividadesEsforzadas() = actividadRealizada.filter({a=>a.implicaEsfuerzo()}) 
 method tipoDeSocio()= tipoDeSocio
 method leAtraeActividad(unaActividad) = tipoDeSocio.leAtrae(unaActividad)



}

object socioTranquilo {
   method leAtrae(unaActividad , unSocio) = unaActividad.duracionDelViaje() >=4
}

object socioCoherente {
   method leAtrae(unaActividad , unSocio) = if(unSocio.esAdoradorDelSol()) {
     unaActividad.sirveParaBroncearse()
   } else {
     unaActividad.implicaEsfuerzo()
   }
}






object socioRelajado {

   method leAtrae(unaActividad , unSocio) = unaActividad.idiomas().any({ i => unSocio.idiomasHablados().contains(i)})
  
}