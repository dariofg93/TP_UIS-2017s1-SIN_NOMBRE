package com.uis.carmensandiego.carmensandiego;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import com.uis.carmensandiego.carmensandiego.model.Caso;
import com.uis.carmensandiego.carmensandiego.model.Pais;

import java.util.ArrayList;
import java.util.List;

public class ViajarFragment extends Fragment {

    private List<Pais> conexiones;
    private Caso caso;

    public ViajarFragment() {
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_viajar, container, false);

        llenarConexiones(view);

        //obtenerVisitados(view):

        return view;
    }

    public void llenarConexiones(View view){
        Caso caso =  ((MainActivity) getActivity()).getCaso();
        this.conexiones = caso.getPais().getConexiones();
        List<String> nombreConexiones = getNombreConexiones(conexiones);
        ListView lView = (ListView) view.findViewById(R.id.listConexiones);

        ArrayAdapter<String> adapter = new ArrayAdapter<String>(getContext(), R.layout.fragment_viajar, nombreConexiones);

        lView.setAdapter(adapter);
    }

    public List<String> getNombreConexiones(List<Pais> pais){
        List<String> nombreConexiones = new ArrayList<>();
        for(Pais p : conexiones){
            nombreConexiones.add(p.getNombre());
        }
        return nombreConexiones;

    }
}

