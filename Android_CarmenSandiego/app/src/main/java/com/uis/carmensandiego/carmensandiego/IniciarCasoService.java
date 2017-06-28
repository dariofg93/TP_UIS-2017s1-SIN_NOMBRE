package com.uis.carmensandiego.carmensandiego;

import android.app.IntentService;
import android.content.Intent;
import android.support.annotation.Nullable;

import com.uis.carmensandiego.carmensandiego.model.Caso;
import com.uis.carmensandiego.carmensandiego.service.CarmenSanDiegoService;
import com.uis.carmensandiego.carmensandiego.service.Connection;

import java.io.IOException;

import retrofit2.Call;

class IniciarCasoService extends IntentService{
    /**
     * Creates an IntentService.  Invoked by your subclass's constructor.
     *
     * @param name Used to name the worker thread, important only for debugging.
     */
    public IniciarCasoService(String name) {
        super(name);
    }

    @Override
    protected void onHandleIntent(@Nullable Intent intent) {
        CarmenSanDiegoService carmenSanDiegoService = Connection.getInstance();
        Call<Caso> casoCall = carmenSanDiegoService.iniciarJuego();
        try {
            WrapperActivity wrapper = intent.getParcelableExtra("myActivity");
            setCasoAActivity(wrapper.getActivity(),casoCall.execute().body());
            System.out.print("sd");
        } catch
            (IOException e) { e.printStackTrace();}
    }

    private void setCasoAActivity(MainActivity activity, Caso caso) {
        activity.setCaso(caso);
    }
}
