package com.uis.carmensandiego.carmensandiego;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Spinner;

import com.uis.carmensandiego.carmensandiego.model.Caso;
import com.uis.carmensandiego.carmensandiego.model.Villano;
import com.uis.carmensandiego.carmensandiego.service.CarmenSanDiegoService;
import com.uis.carmensandiego.carmensandiego.service.Connection;

import java.util.ArrayList;
import java.util.List;

import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class OrdenArrestoFragment extends Fragment {

    private int idSeleccionado;
    private List<Villano> villanos;
    private Caso caso =  ((MainActivity) getActivity()).getCaso();

    public OrdenArrestoFragment() {
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_orden_arresto, container, false);

        obtenerVillanos(view);

        return view;
    }

    private void obtenerVillanos(final View view) {
        CarmenSanDiegoService carmenSanDiegoService = new Connection().getService();
        carmenSanDiegoService.getVillanos(new Callback<List<Villano>>() {
            @Override
            public void success(List<Villano> villanos, Response response) {
                llenarSpinnerVillanos(view, villanos);
            }

            @Override
            public void failure(RetrofitError error) {
                Log.e("", error.getMessage());
                error.printStackTrace();
            }
        });
    }

    public void llenarSpinnerVillanos(View view, List<Villano> villanos) {
        this.villanos = villanos;
        Spinner spinner = (Spinner) view.findViewById(R.id.spinner_villanos);
        List<String> nombresVillanos = getNombresVillanos(villanos);

        ArrayAdapter<String> adapter = new ArrayAdapter<String>(getContext(), R.layout.support_simple_spinner_dropdown_item, nombresVillanos);
        adapter.setDropDownViewResource(R.layout.support_simple_spinner_dropdown_item);

        spinner.setAdapter(adapter);
    }

    public List<String> getNombresVillanos(List<Villano> villanos) {
        List<String> nombres = new ArrayList<>();
        for(Villano v : villanos) {
            nombres.add(v.getNombre());
        }
        return nombres;
    }


}

