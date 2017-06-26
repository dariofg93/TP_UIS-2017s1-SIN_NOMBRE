package com.uis.carmensandiego.carmensandiego.service;

import retrofit.RestAdapter;

public class Connection {

    public static CarmenSanDiegoService getInstance(){
        String SERVER_IP_GENY = "192.168.1.34";//esta ip es la del servidor.
        String API_URL = "http://"+ SERVER_IP_GENY +":9000";

        RestAdapter restAdapter = new RestAdapter.Builder().setEndpoint(API_URL).build();
        CarmenSanDiegoService carmenSanDiegoService = restAdapter.create(CarmenSanDiegoService.class);
        return carmenSanDiegoService;
    }
}
