package com.qiniu.api.config;

public class Token {

    public static String getUpToken() throws Exception {
        Config.ACCESS_KEY = "CRehOXaQg0hHvTZk3hfyny1vtEkoBSWdPXz6IdDf";
        Config.SECRET_KEY = "v9iOHrVA2OT2tz5IPZx-dnuD0_QOMFZtiVj-GSn4";
        Mac mac = new Mac(Config.ACCESS_KEY, Config.SECRET_KEY);
        // 请确保该bucket已经存在
        String bucketName = "jikesoon";
        PutPolicy putPolicy = new PutPolicy(bucketName);
        String uptoken = putPolicy.token(mac);
        return uptoken;
    }
    
    public static void main(String[] args) {
    	try {
    		System.out.println(getUpToken());
			System.out.println(getDownLoadToken("248_1420872868569.amr"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
    
    public static String getDownLoadToken(String name) throws Exception{
    	Config.ACCESS_KEY = "CRehOXaQg0hHvTZk3hfyny1vtEkoBSWdPXz6IdDf";
        Config.SECRET_KEY = "v9iOHrVA2OT2tz5IPZx-dnuD0_QOMFZtiVj-GSn4";
		Mac mac = new Mac(Config.ACCESS_KEY, Config.SECRET_KEY);
		String baseUrl = URLUtils.makeBaseUrl("jikesoon.qiniudn.com", name);
		GetPolicy getPolicy = new GetPolicy();
		getPolicy.expires = 3600*24*365*20;
		String downloadUrl = getPolicy.makeRequest(baseUrl, mac);
		return downloadUrl;
    }
}