package com.uis.carmensandiego.carmensandiego;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Spinner;

import com.uis.carmensandiego.carmensandiego.model.Villano;
import com.uis.carmensandiego.carmensandiego.service.CarmenSanDiegoService;
import com.uis.carmensandiego.carmensandiego.service.Connection;

import java.util.List;

import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class OrdenArrestoFragment extends Fragment {

    private String ordenContra = "Aun no se emitio ninguna orden";
    private int idSeleccionado;
    private List<Villano> villanos;

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

        /*ArrayAdapter<Villano> adapter = new ArrayAdapter<Villano>(this, R.layout.simple_spinner_dropdown_item, villanos);
        adapter.setDropDownViewResource(R.layout.simple_spinner_dropdown_item);
        dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter(dataAdapter);*/
    }


}

