package applicationModels

import detective.Detective
import java.util.Random
import static dummies.CasosRespositorio.*;
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.Arrays
import ocupante.Villano

@Accessors
@Observable
class NuevoVillanoAppModel {

   var String nombre

   var String miSexo

   var List<String> seniasParticulares

   var List<String> hobbies

   var Villano miVillano

   def  agregarVillano(){
       miVillano = new Villano(nombre,miSexo,seniasParticulares,hobbies)
    }

   def getSexosPosibles(){
       Arrays.asList(sexos)
   }


    public enum sexos {
        Masculino,
        Femenino
    }


}