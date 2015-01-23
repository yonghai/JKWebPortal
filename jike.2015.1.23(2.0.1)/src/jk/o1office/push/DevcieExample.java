package jk.o1office.push;

import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.jpush.api.JPushClient;
import cn.jpush.api.common.resp.APIConnectionException;
import cn.jpush.api.common.resp.APIRequestException;
import cn.jpush.api.device.TagAliasResult;

public class DevcieExample {
	protected static final Logger LOG = LoggerFactory.getLogger(DevcieExample.class);

	private static final String appKey ="8161e3a72646799fe60b8c6f";
	private static final String masterSecret = "35d2aca9aa706fd12657d13f";
	private static final String TAG1 = "tag1";
	private static final String ALIAS1 = "alias1";
	private static final String ALIAS2 = "alias2";
	private static final String REGISTRATION_ID1 = "0900e8d85ef";
	private static final String REGISTRATION_ID2 = "0a04ad7d8b4";

	private static JPushClient jpushClient = new JPushClient(masterSecret, appKey);

	public static void main(String[] args) {
		testGetDeviceTagAlias();
		
	}
	
	public static void testGetDeviceTagAlias() {
		try {
			String theTag = "deliveryer";
			Set<String> toAddUsers = new HashSet<String>();
			toAddUsers.add("deliveryer");
			Set<String> toRemoveUsers = new HashSet<String>();
			toRemoveUsers.add("d");
			jpushClient.addRemoveDevicesFromTag(theTag, toAddUsers, toRemoveUsers);
		
			TagAliasResult result = jpushClient.getDeviceTagAlias(REGISTRATION_ID1);
			System.out.println(result.alias);
			System.out.println(result.tags.toString());
			LOG.info(result.alias);
			LOG.info(result.tags.toString());
			
		} catch (APIConnectionException e) {
			LOG.error("Connection error. Should retry later. ", e);
			
		} catch (APIRequestException e) {
			LOG.error("Error response from JPush server. Should review and fix it. ", e);
            LOG.info("HTTP Status: " + e.getStatus());
            LOG.info("Error Code: " + e.getErrorCode());
            LOG.info("Error Message: " + e.getErrorMessage());
		}
	}
	
}


