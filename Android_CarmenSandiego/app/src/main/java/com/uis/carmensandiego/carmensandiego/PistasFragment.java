package com.uis.carmensandiego.carmensandiego;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;

import com.uis.carmensandiego.carmensandiego.adapter.LugaresAdapter;
import com.uis.carmensandiego.carmensandiego.model.Caso;
import com.uis.carmensandiego.carmensandiego.service.CarmenSanDiegoService;
import com.uis.carmensandiego.carmensandiego.service.Connection;

import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class PistasFragment extends Fragment {

    private ListView lvLugares;
    private CarmenSanDiegoService carmenSanDiegoService = Connection.getInstance();

    public PistasFragment() {}

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        lvLugares = (ListView) container.findViewById(R.id.listLugares);

        return inflater.inflate(R.layout.fragment_pistas, container, false); // <-- AQUIII
    }

    public void obtenerLugares() {

        carmenSanDiegoService.iniciarJuego(new Callback<Caso>() {
            @Override
            public void success(Caso caso, Response response) {
                LugaresAdapter adapter = new LugaresAdapter(getActivity(),caso.getPais().getLugares());
                lvLugares.setAdapter(adapter);
            }

            @Override
            public void failure(RetrofitError error) {
                Log.e("", error.getMessage());
                error.printStackTrace();
            }
        });
    }
}

