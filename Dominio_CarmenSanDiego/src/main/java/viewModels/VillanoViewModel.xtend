package viewModels

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class VillanoViewModel {
	var String nombre
	var int id
	
	new(String nombre, int id){
		this.nombre = nombre
		this.id = id
	}
}