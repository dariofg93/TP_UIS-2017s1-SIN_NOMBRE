package com.uis.carmensandiego.carmensandiego;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import retrofit2.http.POST;

public class OrdenArrestoFragment extends Fragment {

    public OrdenArrestoFragment() {
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_orden_arresto, container, false);
    }


}

