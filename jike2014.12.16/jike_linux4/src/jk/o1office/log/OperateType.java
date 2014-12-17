package jk.o1office.log;

public enum OperateType {
	/*客户端用户的基本信息操作*/
	ULOGIN,							//客户端登陆
	ULOGOUT,						//客户端注销
	UFORGETPASSWORD,				//客户端忘记密码
	UUPDATEPASSWORD,				//客户端修改密码
	UUPDATETEL,						//客户端修改手机号码
	UUPDATENICKNAME,				//客户端修改昵称
	UDELADDRESS,					//客户端删除地址
	UUPDATEADDRESS,					//客户端更改地址
	
	/*客户端用户的订单操作*/
	UDELORDER,						//客户端删除订单
	USUBMITORDER,					//客户端提交订单
	
	/*配送端端用户的基本信息操作*/
	DLOGIN,							//配送端登陆
	DLOGOUT,						//配送端注销
	DFORGETPASSWORD,				//配送端忘记密码操作
	DUPDATEPASSWORD,				//配送端端修改密码
	DUPDATETEL,						//配送端修改手机号码
	
	/*配送端用户的订单操作*/
	DRECEIVEORDER,					//配送端接订单
	DCANCLEORDER,					//配送端取消订单
	DCOMPLETEDORDER,				//配送端完成订单
	DFAILORDER,						//配送端交易失败
}