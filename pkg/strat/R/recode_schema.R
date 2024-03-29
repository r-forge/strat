
# Mandatory:
# - $oug [Occupational Unit Group-identifier]
#
# Optional:
# - $nem [number of employees 0-n]
# - $sem [self-empoyed 1/0]
# - $sup [supervising 1/0]

recode <- function(data, informat="isco88", outformat="egp", detail=0, labels=FALSE) {
  x <- data.frame(data)
  colnames(x) <- c("oug", "sem", "nem", "sup")[1:ncol(x)]
  switch(informat,
      isco88 = switch(outformat,
          isei  = r.isco88.isei(x, detail),
          siops = r.isco88.siops(x, detail),
          egp   = r.isco88.egp(x, detail),
		  oesch = r.isco88.oesch(x, detail),
          esec  = r.isco88.esec(x, detail)
      ),
      isco69 = switch(outformat,
          oesch = r.isco88.oesch(r.isco69.isco88(x), detail),
          esec  = r.isco88.esec(r.isco69.isco88(x), detail)
      )
  )
}

r.isco88.isei <- function(x, detail=0) {

  x$isei[x$oug %in% c(6200, 6210, 9130, 9131, 9132, 9133, 9200, 9210, 9211, 9212, 9213)] <- 16
  x$isei[x$oug %in% c(5142, 5149, 7131)] <- 19
  x$isei[x$oug %in% c(9000, 9320, 9321)] <- 20
  x$isei[x$oug %in% c(9310, 9311, 9312, 9313)] <- 21
  x$isei[x$oug %in% c(6140, 6141, 6142, 8130, 8131, 8139, 9331, 9332)] <- 22
  x$isei[x$oug %in% c(6000, 6100, 6110, 6111, 6112, 6113, 6114, 6120, 6121, 6122, 6123, 6124, 6129, 6130, 6131, 7234, 9140, 9141, 9142, 9160, 9161, 9162, 9300)] <- 23
  x$isei[x$oug %in% c(7224, 8264, 8400, 9322)] <- 24
  x$isei[x$oug %in% c(5130, 5131, 5132, 5133, 5139, 9100, 9151)] <- 25
  x$isei[x$oug %in% c(7123, 7135, 7530, 8170, 8171, 8172, 8290, 8330, 8331, 8332)] <- 26
  x$isei[x$oug %in% c(6132, 7113, 7321, 8140, 8141, 8142, 8143, 8162, 9150, 9152, 9153)] <- 27
  x$isei[x$oug %in% c(6133, 6134, 6150, 6151, 6152, 6153, 6154, 7320, 7437, 8123, 8333, 8334, 9112, 9120)] <- 28
  x$isei[x$oug %in% c(5141, 7121, 7122, 7124, 7140, 7141, 7143, 7211, 7322, 7323, 7324, 7330, 7331, 7332, 7431, 7432, 8240, 8261, 8262, 8270, 8271, 8272, 8273, 8274, 8275, 
	8276, 8277, 8278, 8279, 9110, 9111, 9113, 9330)] <- 29
  x$isei[x$oug %in% c(5121, 5122, 5140, 7110, 7111, 7112, 7120, 7129, 7132, 7212, 7214, 7215, 7216, 7410, 7411, 7413, 7414, 7415, 7416, 8100, 8120, 8122, 8124, 8212, 8220, 
	8221, 8222, 8223, 8224, 8229, 8230, 8231, 8232, 8260, 8281, 8284, 8285, 8286, 8321, 8322, 8323, 9333)] <- 30
  x$isei[x$oug %in% c(7100, 7133, 7210, 7412, 7440, 7441, 7442, 8000, 8121, 8280)] <- 31
  x$isei[x$oug %in% c(4131, 5120, 7142, 8160, 8200, 8263, 8265, 8266, 8269, 8300, 8312, 8340)] <- 32
  x$isei[x$oug %in% c(7136, 7213, 7221, 7233, 7400, 7420, 7421, 7422, 7423, 7424, 7436, 8161, 8163)] <- 33
  x$isei[x$oug %in% c(5110, 5111, 5112, 5113, 5123, 7000, 7130, 7134, 7200, 7223, 7230, 7231, 7300, 8282, 8283, 8320, 8324)] <- 34
  x$isei[x$oug %in% c(7220, 8110, 8111, 8112, 8113, 8150, 8151, 8152, 8153, 8154, 8155, 8159)] <- 35
  x$isei[x$oug %in% c(4130, 7430, 7434, 7435, 8210, 8211, 8310)] <- 36
  x$isei[x$oug %in% c(5230, 7137, 7345)] <- 37
  x$isei[x$oug %in% c(3230, 3231, 3232, 3242, 3300, 3310, 3320, 3330, 3340, 3480, 5100, 7245, 7310, 7311, 7312, 7313, 7346, 8250, 8251, 8252, 8253)] <- 38
  x$isei[x$oug %in% c(4140, 4141, 4142, 4143, 4144, 4190, 7242, 7520)] <- 39
  x$isei[x$oug %in% c(4213, 4214, 4215, 5000, 5163, 5164, 5169, 7222, 7240, 7241, 7244, 7340, 7341, 7342, 7344)] <- 40
  x$isei[x$oug %in% c(7243, 8311)] <- 41
  x$isei[x$oug %in% c(5161, 7232, 7343, 7500, 7510)] <- 42
  x$isei[x$oug %in% c(1311, 2230, 2332, 3460, 4132, 5150, 5151, 5152, 5200, 5210, 5220)] <- 43
  x$isei[x$oug %in% c(1315)] <- 44
  x$isei[x$oug %in% c(3111, 3112, 4000, 4100, 4133, 7433)] <- 45
  x$isei[x$oug %in% c(3113, 3114, 3444, 4212)] <- 46
  x$isei[x$oug %in% c(5160)] <- 47
  x$isei[x$oug %in% c(3131, 3200, 4210)] <- 48
  x$isei[x$oug %in% c(1314, 3110, 3240, 4200)] <- 49
  x$isei[x$oug %in% c(3100, 3145, 3150, 3151, 3152, 3210, 3211, 3212, 3213, 3416, 3473, 3474, 4112, 4113, 5162)] <- 50
  x$isei[x$oug %in% c(1300, 1310, 1313, 1316, 1317, 1318, 1319, 2446, 3118, 3221, 3222, 3223, 3225, 3227, 3228, 3229, 3241, 3433, 4110, 4111, 4114, 4120, 4121, 4122)] <- 51
  x$isei[x$oug %in% c(3120, 3121, 3122, 3123, 3130, 3139, 3141, 3142, 3470, 4220, 4221, 4222, 4223)] <- 52
  x$isei[x$oug %in% c(2460, 3119, 3471, 4115, 4211)] <- 53
  x$isei[x$oug %in% c(2452, 3000, 3115, 3116, 3117, 3412, 3430, 3431, 3439, 3475, 5143)] <- 54
  x$isei[x$oug %in% c(1000, 3220, 3400, 3410, 3419, 3420, 3421, 3422, 3423, 3429, 3451)] <- 55
  x$isei[x$oug %in% c(1233, 1312, 2148, 3414, 3415, 3417, 3440, 3441, 3443, 3449, 3450, 3452)] <- 56
  x$isei[x$oug %in% c(3132, 3133, 3140, 3442)] <- 57
  x$isei[x$oug %in% c(1140, 1141, 1142, 1143, 1240)] <- 58
  x$isei[x$oug %in% c(1224, 1225, 1226, 1228, 3413, 3432)] <- 59
  x$isei[x$oug %in% c(1252, 3224, 3226)] <- 60
  x$isei[x$oug %in% c(1230, 2450, 3411, 3434)] <- 61
  x$isei[x$oug %in% c(1250, 2453, 2454, 2455, 3472)] <- 64
  x$isei[x$oug %in% c(2359, 2430, 2431, 2432, 2440, 2444, 2451)] <- 65
  x$isei[x$oug %in% c(1130, 2322, 2330, 2331, 2340, 2350)] <- 66
  x$isei[x$oug %in% c(1220, 1221, 1222, 1223, 1229, 2145, 2147)] <- 67
  x$isei[x$oug %in% c(1200, 2143, 2144, 2400)] <- 68
  x$isei[x$oug %in% c(1231, 1232, 1234, 1235, 1236, 1237, 1239, 2100, 2141, 2142, 2149, 2300, 2320, 2410, 2411, 2412, 2419, 3143, 3144)] <- 69
  x$isei[x$oug %in% c(1100, 1210, 1251, 2000, 2321, 2351, 2352)] <- 70
  x$isei[x$oug %in% c(2120, 2121, 2122, 2130, 2131, 2132, 2139, 2146, 2442, 2443, 2445)] <- 71
  x$isei[x$oug %in% c(2140)] <- 73
  x$isei[x$oug %in% c(2110, 2111, 2112, 2113, 2114, 2224)] <- 74
  x$isei[x$oug %in% c(1110, 1120, 2211, 2212, 2310)] <- 77
  x$isei[x$oug %in% c(2210, 2441)] <- 78
  x$isei[x$oug %in% c(2213)] <- 79
  x$isei[x$oug %in% c(2200)] <- 80
  x$isei[x$oug %in% c(2429)] <- 82
  x$isei[x$oug %in% c(2223)] <- 83
  x$isei[x$oug %in% c(2220, 2222, 2229, 2420, 2421)] <- 85
  x$isei[x$oug %in% c(1227)] <- 87
  x$isei[x$oug %in% c(2221)] <- 88
  x$isei[x$oug %in% c(2422)] <- 90

  x$isei
}


r.isco88.siops <- function(x, detail=0) {
  x$siops[x$oug %in% c(6154)] <- 6
  x$siops[x$oug %in% c(9120)] <- 12
  x$siops[x$oug %in% c(9160, 9161, 9162)] <- 13
  x$siops[x$oug %in% c(4214, 9312, 9313)] <- 15
  x$siops[x$oug %in% c(6142, 9310)] <- 16
  x$siops[x$oug %in% c(5133, 5142, 9331)] <- 17
  x$siops[x$oug %in% c(9212, 9300, 9311, 9321)] <- 18
  x$siops[x$oug %in% c(9142, 9320)] <- 19
  x$siops[x$oug %in% c(7143, 7234, 9150, 9152, 9330, 9333)] <- 20
  x$siops[x$oug %in% c(5123, 7424, 9000, 9130, 9132, 9153)] <- 21
  x$siops[x$oug %in% c(3242, 7441, 9131, 9133, 9151, 9322, 9332)] <- 22
  x$siops[x$oug %in% c(5131, 6151, 6152, 9100, 9140, 9200, 9210, 9211, 9213)] <- 23
  x$siops[x$oug %in% c(5230, 6140, 6141, 7411, 9111, 9112)] <- 24
  x$siops[x$oug %in% c(7321, 8263, 8264, 9110, 9141)] <- 25
  x$siops[x$oug %in% c(5120, 7135, 7216, 7436, 8265, 8269, 9113)] <- 26
  x$siops[x$oug %in% c(4215, 5130, 7224, 7440, 7442)] <- 27
  x$siops[x$oug %in% c(5210, 6150, 6153, 7129, 7134, 7320, 7410, 8124, 8140, 8142, 8143, 8223, 8253, 8260, 8266, 8286, 8334)] <- 28
  x$siops[x$oug %in% c(3240, 3241, 5113, 5139, 5140, 5149, 7142, 7420, 7421, 7431, 8141, 8261, 8262, 8312, 8340)] <- 29
  x$siops[x$oug %in% c(4131, 5169, 6134, 8170, 8171, 8172, 8212, 8230, 8231, 8232, 8281, 8284)] <- 30
  x$siops[x$oug %in% c(5122, 5200, 7131, 7132, 7133, 7140, 7141, 7323, 7324, 7330, 7331, 7332, 7437, 8110, 8113, 8130, 8131, 8139, 8240, 8271, 8285, 8321, 8322, 8331)] <- 31
  x$siops[x$oug %in% c(3473, 4130, 5000, 5100, 5110, 5112, 5141, 5220, 7215, 7345, 7432, 8112, 8252, 8320, 8323, 8330, 8332)] <- 32
  x$siops[x$oug %in% c(3474, 4142, 7312, 7400, 7412, 8270, 8273, 8274, 8280, 8290, 8300, 8324, 8333, 8400)] <- 33
  x$siops[x$oug %in% c(4211, 4213, 5143, 7100, 7110, 7111, 7113, 7120, 7122, 7123, 7136, 7213, 7413, 7415, 7416, 7430, 8000, 8111, 8163, 8200, 8272, 8277, 8278)] <- 34
  x$siops[x$oug %in% c(5161, 7221, 7244, 7414, 7434, 8162, 8275)] <- 35
  x$siops[x$oug %in% c(4122, 4141, 7112, 7121, 7245, 7423, 8100, 8122, 8310)] <- 36
  x$siops[x$oug %in% c(4000, 4100, 4133, 4140, 4144, 4190, 4210, 5121, 5150, 5151, 5152, 5160, 6000, 7124, 7130, 7220, 7322, 7530, 8155, 8210)] <- 37
  x$siops[x$oug %in% c(1315, 4220, 4221, 4222, 4223, 6100, 6130, 6200, 6210, 7000, 7210, 7211, 7223, 7240, 7241, 8123, 8160, 8211)] <- 38
  x$siops[x$oug %in% c(3112, 4200, 5163, 5164, 7212, 7300, 8279)] <- 39
  x$siops[x$oug %in% c(2454, 5162, 6110, 6111, 6112, 6113, 6114, 6120, 6121, 6122, 6123, 6124, 6129, 6131, 6133, 7200, 7222, 7422, 7433, 7435, 8120)] <- 40
  x$siops[x$oug %in% c(4143, 6132, 7342, 7343, 8250, 8251)] <- 41
  x$siops[x$oug %in% c(3420, 3429, 4111, 4112, 4212, 5132, 7233, 7243, 7340, 7341, 7344, 8150, 8161)] <- 42
  x$siops[x$oug %in% c(3414, 7230, 7231, 7313, 8151, 8152, 8153, 8154, 8159, 8220, 8221, 8222, 8224, 8229, 8311)] <- 43
  x$siops[x$oug %in% c(3139, 3225, 3228, 3230, 3231, 3232, 3412, 3441, 3452, 4120, 4132, 7137, 7214)] <- 44
  x$siops[x$oug %in% c(2453, 3229, 3450, 3470, 4110, 4113, 4114, 4121, 7310, 8121, 8276)] <- 45
  x$siops[x$oug %in% c(1314, 3111, 3113, 3114, 3115, 3116, 3119, 3130, 3131, 3145, 3415, 3417, 3419, 7510, 7520)] <- 46
  x$siops[x$oug %in% c(1311, 3110, 3212, 3410, 7311)] <- 47
  x$siops[x$oug %in% c(3000, 3100, 3222, 3227, 3400, 7242, 7500, 8282, 8283)] <- 48
  x$siops[x$oug %in% c(2332, 3132, 3413, 3416, 3423, 3430, 3432, 3433, 3460, 3471, 3475)] <- 49
  x$siops[x$oug %in% c(1300, 1310, 3144, 3300, 3310, 3320, 3330, 3340, 3411, 3422, 3472, 3480, 5111, 7232)] <- 50
  x$siops[x$oug %in% c(1000, 2130, 2131, 2132, 2139, 3200, 3220, 3226, 3434)] <- 51
  x$siops[x$oug %in% c(1312, 1313, 1316, 1317, 1318, 1319, 2446, 3210, 3211, 3223, 3440, 3442, 7346)] <- 52
  x$siops[x$oug %in% c(3117, 3120, 3121, 3122, 3123, 3221, 3431, 3439, 4115)] <- 53
  x$siops[x$oug %in% c(2230, 2430, 2431, 2432, 3150, 3151, 3152, 3444)] <- 54
  x$siops[x$oug %in% c(1240, 2122, 3118, 3142, 3213, 3421, 3443, 3449)] <- 55
  x$siops[x$oug %in% c(2120, 2149, 2213, 2412)] <- 56
  x$siops[x$oug %in% c(2322, 2330, 2331, 2410, 2419, 2450, 2452, 2455, 3140)] <- 57
  x$siops[x$oug %in% c(2148, 2440, 2451, 3133)] <- 58
  x$siops[x$oug %in% c(1200, 1221, 1222, 1223, 1224, 1225, 1226, 1227, 1228, 1229, 1230, 1231, 1232, 1233, 1234, 1235, 1236, 1237, 1239, 2320, 2321, 2400, 2441, 2460, 
	3141, 3143, 3224, 3451)] <- 60
  x$siops[x$oug %in% c(2147, 2223, 2300)] <- 61
  x$siops[x$oug %in% c(2000, 2210, 2340, 2350, 2359, 2411, 2444)] <- 62
  x$siops[x$oug %in% c(1130, 1140, 1141, 1142, 1143, 1220, 1252, 2100, 2140)] <- 63
  x$siops[x$oug %in% c(1110, 2224)] <- 64
  x$siops[x$oug %in% c(1250, 2143, 2144)] <- 65
  x$siops[x$oug %in% c(2145, 2146)] <- 66
  x$siops[x$oug %in% c(1100, 2114, 2442, 2443, 2445)] <- 67
  x$siops[x$oug %in% c(2212, 2351, 2352)] <- 68
  x$siops[x$oug %in% c(2110, 2113, 2121, 2211)] <- 69
  x$siops[x$oug %in% c(1210, 2142, 2200, 2222)] <- 70
  x$siops[x$oug %in% c(1120, 2429)] <- 71
  x$siops[x$oug %in% c(2112, 2141)] <- 72
  x$siops[x$oug %in% c(1251, 2220, 2229, 2420, 2421)] <- 73
  x$siops[x$oug %in% c(2111)] <- 75
  x$siops[x$oug %in% c(2422)] <- 76
  x$siops[x$oug %in% c(2221, 2310)] <- 78

  x$siops
}

r.isco88.egp <- function(x, detail) {
  # Recode ISCO88 to EGP using Ganzebooms' code

  # Code the simple version, based on 4 digit ISCO88 values
  x$egp[x$oug %in% c(1000, 2000, 1100, 2100, 1110, 2110, 1120, 2111, 2112, 2113, 2114, 2120, 2121, 1200, 2122, 1210, 2130, 1220, 2131, 1222, 1223, 2140, 1224, 2141, 1225, 
	2142, 1226, 2143, 1227, 2144, 1228, 2145, 1229, 2146, 1230, 2147, 1231, 1232, 2149, 1233, 2200, 3143, 1234, 2210, 3144, 1235, 2211, 1236, 2212, 1237, 2213, 1239, 2220, 
	2221, 1250, 2222, 1251, 2223, 2224, 2229, 2310, 2350, 2351, 2352, 2400, 2411, 2420, 2421, 2422, 2429, 2440, 2441, 2442, 2443, 2445)] <- 1 # CLASS 1
	
  x$egp[x$oug %in% c(3000, 3100, 3110, 3111, 1130, 3112, 1140, 3113, 1141, 3114, 1142, 3115, 5121, 1143, 3116, 3117, 3118, 3119, 2132, 3120, 2139, 3121, 3122, 3123, 3130, 
	3131, 3132, 3133, 3139, 5150, 3140, 5151, 2148, 3141, 5152, 3142, 3145, 3150, 3151, 3152, 1240, 3200, 3210, 3211, 1252, 3212, 1300, 3213, 1310, 2230, 3220, 2300, 3221, 
	1312, 3222, 1313, 2320, 3223, 1314, 2321, 3224, 1315, 2322, 3225, 1316, 2323, 3226, 1317, 2330, 3227, 1318, 2331, 3228, 1319, 2332, 3229, 2340, 3240, 2359, 3241, 3242, 
	2410, 2412, 2419, 3400, 3410, 3411, 2430, 3412, 2431, 3413, 2432, 3414, 3415, 3416, 3417, 3419, 2444, 3420, 3421, 2446, 3422, 2450, 3423, 2451, 3429, 2452, 2453, 3431, 
	2454, 3432, 2455, 2460, 3434, 3440, 3441, 3442, 3443, 3444, 3449, 3450, 3451, 3470, 3471, 3472, 3473, 3474, 3475)] <- 2 # CLASS 2
	
  x$egp[x$oug %in% c(4000, 4100, 4122, 9100, 4110, 9110, 4111, 9111, 4112, 9112, 4113, 9113, 4114, 4115, 4120, 4121, 3230, 3231, 3232, 3300, 3310, 3320, 3330, 3340, 3430, 
	3433, 3439, 3460, 3480)] <- 3 # CLASS 3
	
  x$egp[x$oug %in% c(5000, 5100, 5110, 5111, 5112, 5113, 5120, 4130, 5131, 4131, 4132, 5133, 4133, 4140, 4141, 4143, 4144, 4190, 4200, 4210, 4211, 4212, 4213, 4214, 4215, 
	4220, 4221, 5200, 4222, 5210, 4223, 5220, 5230)] <- 4  # CLASS 4
	
  x$egp[x$oug %in% c(3452, 7510)] <- 7 # CLASS 7
  
  x$egp[x$oug %in% c(7000, 7120, 5122, 7124, 7129, 7130, 7132, 5140, 7133, 5141, 7134, 5143, 7136, 8150, 7137, 8151, 7140, 8152, 7141, 8153, 8154, 8155, 5161, 7200, 8159, 
	5162, 7210, 8160, 7211, 8161, 5164, 7212, 8162, 7213, 8163, 7214, 8170, 7215, 8171, 7216, 8172, 7220, 7221, 7222, 7223, 7224, 7230, 7231, 7232, 7233, 7240, 7241, 7242, 
	7243, 7244, 7245, 7300, 7310, 7311, 7312, 7313, 7323, 7324, 7340, 7341, 7342, 7343, 7344, 7345, 7346, 7400, 7410, 7411, 7412, 7413, 7414, 7415, 7416, 7420, 7422, 8311, 
	7423, 7430, 7433, 7434, 7435, 7436, 8332, 7437, 8333, 7440, 7441, 7442, 7500, 7520)] <- 8  # CLASS 8
	
  x$egp[x$oug %in% c(8000, 9000, 7100, 8100, 7110, 8110, 7111, 8111, 7112, 8112, 7113, 8113, 8120, 9120, 7121, 8121, 9130, 7122, 8122, 9131, 5123, 7123, 8123, 9132, 5130, 
	8124, 9133, 8130, 9140, 5132, 8131, 9141, 7131, 8139, 9142, 5139, 8140, 9150, 8141, 9151, 8142, 9152, 4142, 5142, 7135, 8143, 9153, 9160, 5149, 9161, 9162, 9200, 7142, 
	5160, 7143, 5163, 9300, 9310, 5169, 9311, 9312, 9313, 9320, 8200, 9321, 8210, 9322, 8211, 9330, 8212, 9331, 8220, 9332, 8221, 9333, 8222, 8223, 8224, 7234, 8229, 8230, 
	8231, 8232, 8240, 8250, 8251, 8252, 8253, 8260, 8261, 8262, 7320, 8263, 7321, 8264, 7322, 8265, 8266, 8269, 7330, 8270, 7331, 8271, 7332, 8272, 8273, 8274, 8275, 8276, 
	8277, 8278, 8279, 8280, 8281, 8282, 8283, 8284, 8285, 8286, 8290, 8300, 7421, 8310, 8312, 7424, 8320, 8321, 7431, 8322, 7432, 8323, 8324, 8330, 8334, 8340, 8400, 
	7530)] <- 9  # CLASS 9
	
  x$egp[x$oug %in% c(6000, 6100, 6110, 6111, 6112, 6113, 6114, 6120, 6121, 6122, 6123, 6124, 6129, 6130, 6134, 6140, 6141, 6142, 6150, 6151, 9210, 6152, 9211, 6153, 9212, 
	6154, 9213, 8331)] <- 10  # CLASS 10
	
  x$egp[x$oug %in% c(1221, 6131, 6132, 6133, 6200, 6210, 1311)] <- 11  # CLASS 11

  # return root EGP values, if there is no additional info on empl. status
  if (ncol(x) == 2) { return(x$egp) }  

}

r.isco88.esec <- function(x, detail) {
  # 1. ISCO88-code (3/4-digit)
  # 2. Employment
  #  1 = Employed => 0
  #  2 = Self-employed => 1
  # 3. Supervising
  #  1 = Yes => 1
  #  2 = No	=> 0
  # 4. Number of employees
  #  1-...

  #x <- data.frame(x)
  
  # STEP 1: fill with simple version
  # --------------------------------

  x$isco88 <- substring(x[,1],1,3) # Make ISCO88 3-digit
  #print(head(x))

  x$esec[x$isco88 %in% c(010,100,110,111,114,120,121,123,200,210,211,212,213,214,220,221,222,231,235,240,241,242)] <- 1
  x$esec[x$isco88 %in% c(122, 223,230,232,233,234,243, 244, 245, 246, 247, 310, 311,312, 314, 320, 321, 322, 323, 334, 342, 344, 345, 348, 521)] <- 2
  x$esec[x$isco88 %in% c(011,300,330,331,332,333,340, 341, 343, 346, 347, 400, 410, 411, 412, 419, 420)] <- 3
  x$esec[x$isco88 %in% c(130,131,911)] <- 4
  x$esec[x$isco88 %in% c(600,610,611,612,613,621)] <- 5
  x$esec[x$isco88 %in% c(313, 315, 730,731)] <- 6
  x$esec[x$isco88 %in% c(413, 421, 422, 500, 510, 511, 513, 514, 516, 520, 522)] <- 7
  x$esec[x$isco88 %in% c(614, 615, 700, 710, 711, 712, 713, 714, 720, 721, 722, 723, 724, 732, 733, 734, 740, 741, 742, 743, 744, 825, 831, 834)] <- 8
  x$esec[x$isco88 %in% c(414, 512, 800, 810, 811, 811, 812, 813, 814, 815, 816, 817, 820, 821, 822, 823, 824, 826, 827, 828, 829, 830, 832, 833,900, 910, 912, 913, 914, 915, 916, 920, 921, 930, 931, 932, 933)] <- 9  

  # Return simple version if only one column (oug) provided
  #print('stap1')
  if (ncol(x)-1 == 2) { return(x$esec) } 
  #print('stap2')

  # STEP 2: compute employment status categories
  # --------------------------------------------

  # Status variable:
  # (0: missing info) 
  # 1: self-employed 10+ employees
  # 2: small employers <10
  # 3: self-employed, no employees 
  # 4: supervisors
  # 5: employee

  x$status[x$sem == 1 & x$nem > 9] <- 1	
  x$status[x$sem == 1 & x$nem %in% 1:9] <- 2 	# 
  x$status[x$sem == 1 & x$nem %in% c(0,99999)] <- 3  
  x$status[x$sem == 0 & x$sup == 1] <- 4
  x$status[x$sem == 0 & x$sup == 0] <- 5
   
  # STEP 3: recode 5 employment groeps
  # ----------------------------------

  # a) Self-employed 10+ employees. Defaults to 1 
  x$esec[x$status == 1] <- 1
  x$esec[x$status == 1 & x$isco88 %in% c(344, 345)] <- 2
  x$esec[x$status == 1 & x$isco88 %in% c(011, 516)] <- 3
  x$esec[x$status == 1 & x$isco88 == 621] <- 5

  # b) Small employers <10. Defaults to 4
  x$esec[x$status == 2] <- 4
  x$esec[x$status == 2 & x$isco88 %in% c(010, 110, 111, 114, 200, 210, 211, 212, 213, 214, 220, 221, 222, 231, 235, 240, 241, 242)] <- 1
  x$esec[x$status == 2 & x$isco88 %in% c(223, 230, 232, 233, 234, 243, 244, 245, 246, 247, 310, 311, 312, 314, 320, 321, 322, 323, 334, 342, 344, 345, 348)] <- 2
  x$esec[x$status == 2 & x$isco88 %in% c(011, 516)] <- 3
  x$esec[x$status == 2 & x$isco88 %in% c(600, 610, 611, 612, 613, 614, 615, 621, 920, 921)] <- 5

  # c) Self-employed with no employees. Defaults to 4
  x$esec[x$status == 3] <- 4
  x$esec[x$status == 3 & x$isco88 %in% c(010, 110, 111, 114, 200, 210, 211, 212, 213, 214, 220, 221, 222, 231, 235, 240, 241, 242)] <- 1
  x$esec[x$status == 3 & x$isco88 %in% c(223, 230, 232, 233, 234, 243, 244, 245, 246, 247, 310, 311, 312, 314, 320, 321, 322, 323, 334, 342, 344, 345, 348)] <- 2
  x$esec[x$status == 3 & x$isco88 %in% c(011,516)] <- 3
  x$esec[x$status == 3 & x$isco88 %in% c(600, 610, 611, 612, 613, 614, 615, 621, 920, 921)] <- 5

  # d) Supervisors. Defaults to 6
  x$esec[x$status == 4] <- 6
  x$esec[x$status == 4 & x$isco88 %in% c(010, 100, 110, 111, 114, 120, 121, 123, 200, 210, 211, 212, 213, 214, 220, 221, 222, 231, 235, 240, 241, 242)] <- 1
  x$esec[x$status == 4 & x$isco88 %in% c(011, 122, 130,131, 223, 230, 232, 233, 234, 243, 244, 245, 246, 247, 300, 310, 311, 312, 313, 314, 320, 321, 322, 323, 330, 331, 332, 333, 334, 340,341, 342, 343, 344, 345, 346, 347, 348, 400, 410, 411, 412, 419, 420, 521)] <- 2
  x$esec[x$status == 4 & x$isco88 == 621] <- 5

  # e) Employees
  x$esec[x$status == 5 & x$isco88 %in% c(010, 100,110,111,114,120, 121, 123, 200, 210, 211, 212, 213, 214, 220, 221, 222, 231, 235, 240, 241, 242)] <- 1
  x$esec[x$status == 5 & x$isco88 %in% c(122,130,131, 223, 230, 232, 233, 234, 243, 244, 245, 246, 247, 310, 311, 312, 314, 320, 321, 322, 323, 334, 342, 344, 345, 348, 521)] <- 2
  x$esec[x$status == 5 & x$isco88 %in% c(011, 300, 330, 331, 332, 333, 340, 341, 343, 346, 347, 400, 410, 411, 412, 419, 420)] <- 3
  x$esec[x$status == 5 & x$isco88 == 621] <- 5
  x$esec[x$status == 5 & x$isco88 %in% c(313, 315, 730,731)] <- 6
  x$esec[x$status == 5 & x$isco88 %in% c(413, 421, 422, 500, 510, 511, 513, 514, 516, 520, 522, 911)] <- 7
  x$esec[x$status == 5 & x$isco88 %in% c(600, 610, 611, 612, 613, 614, 615, 700, 710, 711, 712, 713, 714, 720, 721, 722, 723, 724, 732, 733, 734, 740, 741, 742, 743, 744, 825, 831, 834)] <- 8
  x$esec[x$status == 5 & x$isco88 %in% c(414, 512, 800, 810, 811,  812, 813, 814, 815, 816, 817, 820, 821, 822, 823, 824, 826, 827, 828, 829, 830, 832, 833,900, 910, 912, 913, 914, 915, 916, 920, 921, 930, 931, 932, 933)] <- 9

  return(x)
}