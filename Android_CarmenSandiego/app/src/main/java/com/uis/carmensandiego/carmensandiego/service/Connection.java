package com.uis.carmensandiego.carmensandiego.service;

import retrofit.RestAdapter;

public class Connection {

    public CarmenSanDiegoService getService() {
        String SERVER_IP = "10.12.0.27"; //esta ip se usa para comunicarse con mi localhost en el emulador de Android Studio
        String SERVER_IP_GENY = "10.12.4.183";//esta ip se usa para comunicarse con mi localhost en el emulador de Genymotion
        String API_URL = "http://"+ SERVER_IP +":9000";

        RestAdapter restAdapter = new RestAdapter.Builder().setEndpoint(API_URL).build();
        CarmenSanDiegoService carmenSanDiegoService = restAdapter.create(CarmenSanDiegoService.class);
        return carmenSanDiegoService;
    }
}
