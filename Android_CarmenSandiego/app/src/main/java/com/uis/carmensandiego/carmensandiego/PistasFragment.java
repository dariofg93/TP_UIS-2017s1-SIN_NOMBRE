package com.uis.carmensandiego.carmensandiego;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.uis.carmensandiego.carmensandiego.adapter.LugaresAdapter;
import com.uis.carmensandiego.carmensandiego.model.Caso;
import com.uis.carmensandiego.carmensandiego.service.CarmenSanDiegoService;
import com.uis.carmensandiego.carmensandiego.service.Connection;

import java.util.List;

import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class PistasFragment extends Fragment {

    public PistasFragment() {
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        inflater.inflate(R.layout.fragment_pistas, container, false);

        obtenerLugares();
        return null;
    }

    private void obtenerLugares() {
        CarmenSanDiegoService carmenSanDiegoService = Connection.getInstance();
        carmenSanDiegoService.iniciarJuego(new Callback<Caso>() {
            @Override
            public void success(Caso caso, Response response) {
                agregarLibros(caso.getPais().getLugares());
            }

            @Override
            public void failure(RetrofitError error) {
                Log.e("", error.getMessage());
                error.printStackTrace();
            }
        });
    }

    private void agregarLibros(List<String> lugares) {
        //setListAdapter(new LugaresAdapter(getActivity(),lugares));
    }
}

