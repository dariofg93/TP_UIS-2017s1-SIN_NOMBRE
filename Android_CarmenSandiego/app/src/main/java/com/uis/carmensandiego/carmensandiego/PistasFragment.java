package com.uis.carmensandiego.carmensandiego;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.telecom.Call;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;

import com.uis.carmensandiego.carmensandiego.adapter.LugaresAdapter;
import com.uis.carmensandiego.carmensandiego.model.Caso;
import com.uis.carmensandiego.carmensandiego.service.CarmenSanDiegoService;
import com.uis.carmensandiego.carmensandiego.service.Connection;


public class PistasFragment extends Fragment {

    private ListView lvLugares;
    private Caso caso =  ((MainActivity) getActivity()).getCaso();

    public PistasFragment() {}

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_pistas, container, false); // <-- AQUIII
    }

    public void obtenerLugares(Caso caso) {

        LugaresAdapter adapter = new LugaresAdapter(getActivity(),caso.getPais().getLugares());
        lvLugares.setAdapter(adapter);
/*
   Call<Caso> casoCall = carmenSanDiegoService.iniciarJuego();
        casoCall.enqueue(new Callback<Caso>() {
            @Override
            public void onResponse(Call<Caso> call, Response<Caso> response) {
                lvLugares = (ListView) getActivity().findViewById(R.id.listLugares);
                Caso caso = response.body();
                LugaresAdapter adapter = new LugaresAdapter(getActivity(),caso.getPais().getLugares());
                System.out.print("Lo que traigo del server es: " + caso.getId() + caso.getOrdenContra() + caso.getPais());

                lvLugares.setAdapter(adapter);
            }

            @Override
            public void onFailure(Call<Caso> call, Throwable t) {
                t.printStackTrace();
                Log.e("Error al obtener caso", t.getMessage());
            }
        });
        */

    }
}

