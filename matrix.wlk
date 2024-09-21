object neo {
    var energia = 100
    
    method esElElegido() = true
    method saltar() {
        energia = energia * 0.5
    }
    method vitalidad() {
        return energia * 0.1
    }
}
object morfeo {
    var vitalidad = 8
    var estaCansado = false
    method esElElegido() { return false
    }
    method vitalidad() = vitalidad
    
    method saltar() {
        vitalidad = 0.max(vitalidad - 1 )
        estaCansado = !estaCansado
    }
    method estaCansado() { return estaCansado
    }}

object trinity {
    method saltar () {
    }
    method vitalidad() {
        return 0
    }
    method esElElegido(){
        return false 
    } 
}

object nave {
    const property pasajeros = [neo,morfeo,trinity] 

    method bajarUnPasajeros(unPasajero) {
        pasajeros.remove(unPasajero)
    }
    method cuantosPasajerosHay() {
        return pasajeros.size()
    }
    method pasajeroMasVitalidad() =
    pasajeros.max({p => p.vitalidad()})

    method estaElElegido() {
        return pasajeros.any({p => p.esElElegido()})
    
    }
    method estaEquilibrado() {
        self.pasajeroMasVitalidad().vitalidad() <=
        self.pasajeroMenosVitalidad().vitalidad() * 2
    
    }
    method pasajeroMenosVitalidad() {
        return pasajeros.min({p => p.vitalidad()})
    }
    method chocar() {
        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear()
    }   
    method acelerar() {
        self.pasajerosSinElElegido().forEach({pas => pas.saltar()})
    }
    method pasajerosSinElElegido(){
        return pasajeros.filter({p => !p.esElElegido() })

    }
    }