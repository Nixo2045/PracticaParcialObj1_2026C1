class Territorio {
    const seres = []
    var cantLembas = 10
    var cantTabacos = 10

    method seres() = seres
    method cantLembas() = cantLembas
    method cantTabacos() = cantTabacos
    method seresTorpes() = seres.filter({ p => p.esTorpe() })
    method valorMaximoDeHabilidadDeSeres() = seres.max({ p => p.habilidad() }).habilidad()
    method habilidadTotal() = seres.sum({ p => p.habilidad() })
    method promedioDeHabilidadTotal() = self.habilidadTotal() / seres.size()
    method esSabio() = seres.all({ p => p.habilidad() > 300 })
    method hayAlgunMortal() = seres.any({ p => p.esInmortal() })
    method posiblesCapitanes() = seres.filter({ p => p.habilidad().between(1000, 3000) })
    method capitan() = self.posiblesCapitanes().max({ p => p.habilidad() })
    method hayDosSeresConMayorHabilidadQue(unSer) = seres.count({ p => p.habilidad() > unSer.habilidad()})
    method estaEnPaz() = seres.all({ p => p.estaConformeCon(self)})

    method huboUnTorneo() { seres.forEach({ p => p.adquirirExperiencia() }) }
    method huboUnaEpifania() { self.seresTorpes().forEach({ p => p.adquirirExperiencia() }) }
    method somnolencia() { seres.forEach({ p => p.sufreSueñoProfundo() }) }
    method consumoDeRecursos() { seres.forEach({ p => p.tomarRecursosDe(self) }) }
    method agregarSer(unSer) { seres.add(unSer) }
    method agregarSeres(listaDeSeres) { seres.addAll(listaDeSeres)  }
    method agregarLembas(cantidad) { cantLembas += cantidad }
    method quitarLembas(cantidad) { cantLembas = (cantLembas - cantidad).max(0) }
    method agregarTabacos(cantidad) { cantTabacos += cantidad }
    method quitarTabacos(cantidad) { cantTabacos = (cantTabacos - cantidad).max(0) }
}