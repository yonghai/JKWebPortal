package jk.o1office.push;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import cn.jpush.api.JPushClient;
import cn.jpush.api.common.resp.APIConnectionException;
import cn.jpush.api.common.resp.APIRequestException;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.PushPayload;

import com.gexin.rp.sdk.base.IPushResult;
import com.gexin.rp.sdk.base.impl.ListMessage;
import com.gexin.rp.sdk.base.impl.Target;
import com.gexin.rp.sdk.http.IGtPush;
import com.gexin.rp.sdk.template.NotificationTemplate;

public class JPush {

	private static final String appKey = "8161e3a72646799fe60b8c6f";
	private static final String masterSecret = "35d2aca9aa706fd12657d13f";


	public static void pushToAllOnlineDelivery(Collection<String> registrationIds) throws Exception {
		JPushClient jpushClient = new JPushClient(masterSecret, appKey, 3);
		// For push, all you need do is to build PushPayload object.
		PushPayload payload = PushExample
				.buildPushObject_all__registrationid_alert(registrationIds);
		try {
			PushResult result = jpushClient.sendPush(payload);
		} catch (APIConnectionException e) {
		} catch (APIRequestException e) {
		}
	}
}
