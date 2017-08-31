package cc.onezen.pay.wxpay;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import cc.onezen.pay.http.bean.OrderResult;
import cc.onezen.pay.http.bean.OrderResult.OrderBean;
import cc.onezen.pay.http.impl.PrepayIdRequestHandler;
import cc.onezen.pay.utils.ConstantUtil;
import cc.onezen.pay.utils.OrderUtils;
import cc.onezen.pay.utils.WXUtil;

public class WxPayServlet extends HttpServlet {
	// 首先：定义支付应用ID、商户ID等等...
		// 应用ID
		public static String APP_ID = ConstantUtil.APP_ID;
		// 商户ID
		public static String PARTNER_ID = ConstantUtil.PARTNER_ID;
		// 商户好对应的密钥
		public static String PARTNER_KEY = ConstantUtil.PARTNER_KEY;
		// 统一下单的接口(微信支付服务器提供的)
		public static String URL_UNIFIEDORDER = ConstantUtil.URL_UNIFIEDORDER;

		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			this.doPost(req, resp);
		}

		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			printf("receive request!!!!");
			// 第1步-签名订单信息
			// 第一点：获取客户端传递过来的参数
			// req：客户端请求
			// resp：响应客户端请求
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
			String name = req.getParameter("name");
			String price = req.getParameter("price");
			// 第二点：设置访问微信支付服务器请求数据类型
			resp.reset();
			resp.setHeader("ContentType", "text/xml");
			// 第三点：创建请求微信支付服务器参数集合
			// 做了请求封装
			// 微信写好一个封装案例,你可以根据服务器需求，自己定义网络请求框架
			PrepayIdRequestHandler handler = new PrepayIdRequestHandler(req, resp);
			// 统一下单的接口(调用微信支付服务器需要的接口)--->公开的
			handler.setGateUrl(ConstantUtil.URL_UNIFIEDORDER);
			// 设置密钥
			handler.setKey(PARTNER_KEY);
			// 设置应用的ID
			handler.setParameter("appid", APP_ID);
			// 商户号
			handler.setParameter("mch_id", PARTNER_ID);
			// 随机字符串
			handler.setParameter("nonce_str", WXUtil.getNonceStr());
			// 商品描述(例如：天天爱消除-游戏充值)
			handler.setParameter("body", "爱学宝-笔记本");
			// 商户订单号(自己服务器生成订单号)
			String out_trade_no = OrderUtils.getOrderNumber();
			handler.setParameter("out_trade_no", out_trade_no);
			// 总金额
			handler.setParameter("total_fee", price);
			// 终端IP(客户端IP)
			handler.setParameter("spbill_create_ip", req.getRemoteAddr());
			// 通知地址(微信服务器回调商户服务器页面)
			handler.setParameter("notify_url", ConstantUtil.NOTIFY_URL);
			// 交易类型
			handler.setParameter("trade_type", "APP");

			// 第四点：对我们订单信息进行签名
			String sign = handler.createMD5Sign();
			// 设置签名
			handler.setParameter("sign", sign);

			// 第2步-调用微信统一下单接口(目的：获取prepay_id)
			// command+1

			OrderResult orderResult = new OrderResult();
			try {
				// 集合参数列表
				// 返回结果
				// <xml>
				// <return_code><![CDATA[SUCCESS]]></return_code>
				// <return_msg><![CDATA[OK]]></return_msg>
				// <appid><![CDATA[wx2421b1c4370ec43b]]></appid>
				// <mch_id><![CDATA[10000100]]></mch_id>
				// <nonce_str><![CDATA[IITRi8Iabbblz1Jc]]></nonce_str>
				// <sign><![CDATA[7921E432F65EB8ED0CE9755F0E86D72F]]></sign>
				// <result_code><![CDATA[SUCCESS]]></result_code>
				// <prepay_id><![CDATA[wx201411101639507cbf6ffd8b0779950874]]></prepay_id>
				// <trade_type><![CDATA[APP]]></trade_type>
				// </xml>
				Map paramsMap = handler.sendPrepay();
				String prepay_id = (String) paramsMap.get("prepay_id");
				if (prepay_id != null && !"".equals(prepay_id)) {
					// 统一下单接口调用成功
					// 第3步-处理接口返回信息进行二次签名
					// 调用支付接口：https://pay.weixin.qq.com/wiki/doc/api/app/app.php?chapter=9_12&index=2
					// 二次签名和一次签名，参数不一样(复用之前参数集合)
					// 请求集合列表(情空：不影响新的参数签名)
					// 微信服务器要求
					handler.clear();
					
					
					String noncestr = (String) paramsMap.get("nonce_str");

					printf(noncestr);

					String timestamp = WXUtil.getTimeStamp();
					// 密钥
					handler.setKey(PARTNER_KEY);
					// 设置应用的ID
					handler.setParameter("appid", APP_ID);
					// 预付单ID
					handler.setParameter("prepayid", prepay_id);
					// 扩展字段
					handler.setParameter("package", "Sign=WXPay");
					// 商户号
					handler.setParameter("partnerid", PARTNER_ID);
					// 随机字符串
					handler.setParameter("noncestr", noncestr);
					// 时间戳
					handler.setParameter("timestamp", timestamp);

					// 进行二次签名(签名参数不一样)
					// 第一次签名：对订单信息签名，获取prepay_id
					// 第二次签名：对支付信息进行签名
					sign = handler.createMD5Sign();

					// 第4步-将签名信息返回客户端（xml、json都可以）
					// 采用Json解析(构建json--->返回客户端)
					OrderBean orderBean = new OrderBean();
					orderBean.setAppid(APP_ID);
					orderBean.setNoncestr(noncestr);
					orderBean.setPackageValue("Sign=WXPay");
					orderBean.setPartnerid(PARTNER_ID);
					orderBean.setPrepayid(prepay_id);
					orderBean.setTradeType((String) paramsMap.get("trade_type"));
					orderBean.setSign(sign);
					orderBean.setTimestamp(timestamp);
					orderResult.setOrderBean(orderBean);

					// 将model转json数据格式(框架)--->服务器开发（bean）
					//resultCode：随便你定义(根据服务器要求)
					//0:成功  1:失败  2:未知异常
					orderResult.setResultCode(0);
					orderResult.setResultMessage("获取成功!");
					
					printf("获取成功!");

				} else {

					printf("调用失败");

					// 调用失败
					orderResult.setResultCode(9);
					orderResult.setResultMessage("获取失败!");
				}
			} catch (Exception e) {

				printf("未知异常!");

				e.printStackTrace();
				orderResult.setResultCode(6);
				orderResult.setResultMessage("未知异常!");
			}

			// 将json返回给客户端
			Gson gson = new Gson();
			String jsonStr = gson.toJson(orderResult);
			resp.getWriter().print(jsonStr);
			

			printf("将json返回给客户端!");


		}


		private void printf(String string) {
			if(string == null){
				string = "null";
			}
			// TODO Auto-generated method stub
			System.out.printf("\n\n\n\n");
			 System.out.printf(string);
			 System.out.printf("\n\n\n\n");
		}
}
