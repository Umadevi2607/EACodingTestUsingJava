function fn() {

  karate.configure('connectTimeout', 60000);
  karate.configure('readTimeout', 120000);
  var LM = Java.type('util.LogModifier');
  karate.configure('logModifier', LM.INSTANCE);
   var config = {
     config:baseUrl = 'https://eacp.energyaustralia.com.au/codingtest/api/v1'
   }

    karate.configure('ssl', true)

  return config;
}