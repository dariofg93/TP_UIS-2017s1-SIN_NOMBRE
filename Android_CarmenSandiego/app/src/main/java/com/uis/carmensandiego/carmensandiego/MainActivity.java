package com.uis.carmensandiego.carmensandiego;

import android.os.Bundle;
import android.support.design.widget.BottomNavigationView;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.AppCompatActivity;
import android.view.MenuItem;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    private Fragment fragment;
    private FragmentManager fragmentManager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        fragmentManager = getSupportFragmentManager();
        fragment = new OrdenArrestoFragment();
        final FragmentTransaction transaction = fragmentManager.beginTransaction();
        transaction.add(R.id.content, fragment).commit();

        //GET INICIAR JUEGO PARA LLENAR EL CASO MODEL
        ((TextView) findViewById(R.id.pais_actual)).setText("Estas en 'PAIS'");

        BottomNavigationView bottomNavigationView = (BottomNavigationView)
                findViewById(R.id.navigation);

        bottomNavigationView.setOnNavigationItemSelectedListener(
            new BottomNavigationView.OnNavigationItemSelectedListener() {
                @Override
                public boolean onNavigationItemSelected(MenuItem item) {
                    switch (item.getItemId()) {
                        case R.id.ordenArresto:
                            fragment = new OrdenArrestoFragment();
                            break;
                        case R.id.viajar:
                            fragment = new ViajarFragment();
                            break;
                        case R.id.pistas:
                            fragment = new PistasFragment();
                            ((PistasFragment)fragment).obtenerLugares();
                            break;
                    }
                    final FragmentTransaction transaction = fragmentManager.beginTransaction();
                    transaction.replace(R.id.content, fragment).commit();
                    return true;
                }
            });
    }
}
