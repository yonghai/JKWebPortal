package jk.o1office.utils;

import java.math.BigInteger;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.crypto.KeyGenerator;
import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.Base64;

/**
 *  BASE64的加密解密是双向的，可以求反解。
 *  MD5、SHA以及HMAC是单向加密，任何数据加密后只会产生唯一的一个加密串，
 *  通常用来校验数据在传输过程中是否被修改。其中HMAC算法有一个密钥，
 *  增强了数据传输过程中的安全性，强化了算法外的不可控因素。
 *  单向加密的用途主要是为了校验数据在传输过程中是否被修改。
 *
 */

public class EncryptBase64 {
	public static final String KEY_SHA = "SHA";
	public static final String KEY_MD5 = "MD5";
	public static final String KEY_MAC = "HmacMD5";

	// sun不推荐使用它们自己的base64,用apache的挺好
	/**
	 * BASE64解密
	 */
	public static byte[] decryptBASE64(byte[] dest) {
		if (dest == null) {
			return null;
		}
		return Base64.decodeBase64(dest);
	}

	/**
	 * BASE64加密
	 */
	public static byte[] encryptBASE64(byte[] origin) {
		if (origin == null) {
			return null;
		}
		return Base64.encodeBase64(origin);
	}

	/**
	 * MD5加密
	 * 
	 * @throws NoSuchAlgorithmException
	 */
	public static byte[] encryptMD5(byte[] data)
			throws NoSuchAlgorithmException {
		if (data == null) {
			return null;
		}
		MessageDigest md5 = MessageDigest.getInstance(KEY_MD5);
		md5.update(data);
		return md5.digest();
	}

	/**
	 * SHA加密
	 * 
	 * @throws NoSuchAlgorithmException
	 */
	public static byte[] encryptSHA(byte[] data)
			throws NoSuchAlgorithmException {
		if (data == null) {
			return null;
		}
		MessageDigest sha = MessageDigest.getInstance(KEY_SHA);
		sha.update(data);
		return sha.digest();
	}

	/**
	 * 初始化HMAC密钥
	 * 
	 * @throws NoSuchAlgorithmException
	 */
	public static String initMacKey() throws NoSuchAlgorithmException {
		KeyGenerator keyGenerator = KeyGenerator.getInstance(KEY_MAC);
		SecretKey secretKey = keyGenerator.generateKey();
		return new String(encryptBASE64(secretKey.getEncoded()));
	}

	/**
	 * HMAC加密
	 * 
	 * @throws NoSuchAlgorithmException
	 * @throws InvalidKeyException
	 */
	public static byte[] encryptHMAC(byte[] data, String key)
			throws NoSuchAlgorithmException, InvalidKeyException {
		SecretKey secretKey = new SecretKeySpec(decryptBASE64(key.getBytes()),
				KEY_MAC);
		Mac mac = Mac.getInstance(secretKey.getAlgorithm());
		mac.init(secretKey);
		return mac.doFinal(data);

	}

	public static void main(String[] args) throws Exception {
		String data = "id-12Anow-324325435";
		System.out.println(new BigInteger(encryptBASE64(data.getBytes()))
				.toString(16));
		System.out.println(new BigInteger(encryptBASE64(data.getBytes()))
				.toString(32));
		System.out.println(new String(decryptBASE64(encryptBASE64(data
				.getBytes()))));

		System.out.println(new BigInteger(encryptMD5(data.getBytes()))
				.toString());
		System.out.println(new BigInteger(encryptSHA(data.getBytes()))
				.toString());

		System.out.println(new BigInteger(encryptHMAC(data.getBytes(),
				initMacKey())).toString());
	}

}