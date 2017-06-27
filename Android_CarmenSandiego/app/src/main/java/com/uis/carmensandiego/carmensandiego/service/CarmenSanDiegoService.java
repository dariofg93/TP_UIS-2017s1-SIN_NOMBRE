package com.uis.carmensandiego.carmensandiego.service;

import com.uis.carmensandiego.carmensandiego.bodies.EmitirOrdenBody;
import com.uis.carmensandiego.carmensandiego.bodies.ViajarBody;
import com.uis.carmensandiego.carmensandiego.model.Caso;
import com.uis.carmensandiego.carmensandiego.model.Pista;
import com.uis.carmensandiego.carmensandiego.model.Villano;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.Path;

public interface CarmenSanDiegoService {
    @POST("/iniciarJuego")
    Call<Caso> iniciarJuego();

    @POST("/emitirOrden")
    Call<String> emitirOrden(@Body EmitirOrdenBody body);

    @GET("/pistasDelLugar/{casoId}/{nombreLugar}")
    Call<Pista> getLibro(@Path("LibroId") String id, @Path("nombreLugar") String lugar);

    @POST("/viajar")
    Call<Caso> viajar(@Body ViajarBody body);

    @GET("/villanos")
    Call<List<Villano>> getVillanos();
}
