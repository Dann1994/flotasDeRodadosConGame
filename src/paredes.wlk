import wollok.game.*

class Pared {
	 const image = "pared.png"
	 var property position = null
	 var property resistencia = 0
	 
	 method image() = image
	 
	 method chocar() { resistencia -= 1 }
}
