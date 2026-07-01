class SerHablante {
    var esInmortal

    method esInmortal() = esInmortal
    method habilidad()
    method esTorpe() = self.habilidad() < 1000

    method adquirirExperiencia()
    method sufreSueñoProfundo()
    method estaConformeCon(unTerritorio)
    method tomarRecursosDe(unTerritorio)
}

class Elfo inherits SerHablante {
    var cantCancionesQueSabe = 20
    method initialize() { esInmortal = true } 
    method cantCancionesQueSabe() = cantCancionesQueSabe
    override method habilidad() {
        return if (cantCancionesQueSabe <= 60) {
            180
        }
        else {
            cantCancionesQueSabe * 3
        }
    }
    override method estaConformeCon(unTerritorio) = unTerritorio.cantLembas() >= 8

    override method adquirirExperiencia() { cantCancionesQueSabe = cantCancionesQueSabe * 2 }
    method aprenderCancion() { cantCancionesQueSabe += 1 }
    method olvidarCancion() { cantCancionesQueSabe =  (cantCancionesQueSabe - 1).max(0) }
    override method sufreSueñoProfundo() { cantCancionesQueSabe = (cantCancionesQueSabe - 10).max(0) }
    override method tomarRecursosDe(unTerritorio) {
        unTerritorio.quitarLembas(3)
        cantCancionesQueSabe += 15
    }
}

class Hobbit inherits SerHablante {
    var cantAmigos = 40
    var cantHistorias = 6

    method initialize() { esInmortal = true } 
    method cantAmigos() = cantAmigos
    method cantHistorias() = cantHistorias
    override method habilidad() {
        return if (cantAmigos < 60) {
            cantHistorias * 100
        }
        else {
            cantHistorias * 50
        }
    }
    override method estaConformeCon(unTerritorio) = unTerritorio.hayDosSeresConMayorHabilidadQue(self)

    override method adquirirExperiencia() { cantAmigos += 8 }
    method organizarFiesta() {
        cantAmigos += 5
        cantHistorias += 5
    }
    method deprimirse() {
        if (cantAmigos < 20) {
            esInmortal = false
        }
    }
    override method sufreSueñoProfundo() { cantAmigos = (cantAmigos - 3).max(0) }
    override method tomarRecursosDe(unTerritorio) {
        unTerritorio.quitarTabacos(4)
        cantAmigos += 7
        cantHistorias += 7
    }
}

class Enano inherits SerHablante {
    var ira = 200

    method initialize() { esInmortal = false }
    method ira() = ira
    override method habilidad() = ira * 2
    override method estaConformeCon(unTerritorio) = unTerritorio.seresTorpes().size() >= 1

    override method adquirirExperiencia() { ira += 300 }
    override method sufreSueñoProfundo() { ira = (ira - 50).max(0) }
    override method tomarRecursosDe(unTerritorio) {}
    method equilibrarse() {
        if (self.habilidad() <= 700) {
            self.adquirirExperiencia()
        }
        else {
            self.sufreSueñoProfundo()
        }
    }
}

class ElfoSilvano inherits Elfo {
    override method habilidad() = super() + 400
}

class EnanoHerrero inherits Enano {
    var cantEspadasFabricadas = 3
    override method habilidad() = super() + cantEspadasFabricadas * 100 // El enunciado estaba mal escrito pero es así
    override method adquirirExperiencia() { 
        super()
        cantEspadasFabricadas += 1
     }
}

class EnanoFurioso inherits Enano {
    override method habilidad() = super().min(200)
}

class EnanoMinero inherits Enano {
    const escondites = #{}

    method escondites() = escondites
    override method ira() = escondites.sum({ p => p.valor() })

    override method adquirirExperiencia() {
        super()
        self.agregarNuevoEscondite(new Escondite())
    }
    override method sufreSueñoProfundo() {
        if (escondites.size() > 2) {
            escondites.forEach({ p => p.agregarCandados(1) })
        }
        else {
            super()
        }
    }

    method agregarNuevoEscondite(escondite) { escondites.add(escondite) }
}

class Escondite {
    var cantCandados = 5
    var cantOroEscondido = 3

    method cantCandados() = cantCandados
    method cantOroEscondido() = cantOroEscondido
    method valor() = (cantCandados * cantOroEscondido) + 20

    method agregarCandados(cantidad) { cantCandados += cantidad }
    method agregarOroEscondido(cantidad) { cantOroEscondido += cantidad }
}