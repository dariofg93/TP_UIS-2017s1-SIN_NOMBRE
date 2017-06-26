package com.uis.carmensandiego.carmensandiego.service;

import com.uis.carmensandiego.carmensandiego.bodies.EmitirOrdenBody;
import com.uis.carmensandiego.carmensandiego.bodies.ViajarBody;
import com.uis.carmensandiego.carmensandiego.model.Caso;
import com.uis.carmensandiego.carmensandiego.model.Pista;
import com.uis.carmensandiego.carmensandiego.model.Villano;

import java.util.List;
import retrofit.Callback;
import retrofit.http.Body;
import retrofit.http.GET;
import retrofit.http.POST;

public interface CarmenSanDiegoService {
    @POST("/iniciarJuego")
    void iniciarJuego(Callback<Caso> callback);

    @POST("/emitirOrden")
    void emitirOrden(@Body EmitirOrdenBody body, Callback<String> callback);

    @GET("/pistasDelLugar/{casoId}/{nombreLugar}")
    void getLibro(@retrofit.http.Path("LibroId") String id,
                  @retrofit.http.Path("nombreLugar") String lugar,
                  Callback<Pista> callback);

    @POST("/viajar")
    void viajar(@Body ViajarBody body, Callback<Caso> callback);

    @GET("/villanos")
    void getVillanos(Callback<List<Villano>> callback);
}
