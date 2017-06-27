package com.uis.carmensandiego.carmensandiego.service;

import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;


public class Connection {

    public static CarmenSanDiegoService getInstance(){
        String SERVER_IP_GENY = "192.168.1.34";//esta ip es la del servidor.
        String API_URL = "http://"+ SERVER_IP_GENY +":9000";

        Retrofit retrofit = new Retrofit.Builder()
                .baseUrl(API_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();

        return retrofit.create(CarmenSanDiegoService.class);
    }
}
