package com.qiniu.api.config;


import org.apache.commons.codec.EncoderException;
import org.apache.commons.codec.net.URLCodec;

public class URLEscape {

	public static String escape(String url) throws EncoderException {
		URLCodec urlEncoder = new URLCodec("UTF-8");
		return urlEncoder.encode(url).replace("+", "%20");
	}
}
