package cn.huazai123.maven.web.config;
/**
 *
 */
public class AlipayConfig {

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016091500516253";

	// 商户私钥，您的PKCS8格式RSA2私钥
	public static String merchant_private_key = "MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAMckXevTW3FQkhtav4OcNJ6AUcD+2LTY8X0UFrcwdAKVEYuP6N/+kKMA288ySJyW+BduFxwcORLzlBXHK2COhnlvI3Opy9caPW9+lphUmR8VxHcWJkmO0B0rSI4X/fU6894tq/3zEsW81ot9Evu8toq4SlC/sQ8yQWHPBaRlicQ7AgMBAAECgYB9Ke9aNIqpyvE5/iyW5Mvxv0cjHUpJSH1nlwO7+dlAcj8Hz9iXSKHRwc1mCf23Ze/ikhA2W8rHjY7KrVcnJg2AEyjtSAllC0Z6L+UTHGLEXda3LjLlMgGDFcZNK7jLJ8JZx4TdNrDhIUAKC3xLAcUwxGW9U9tIWpyLGSj+nwrXIQJBAPBInS6aiUO3j6GdmUS3v5IsCGjy0GKZRiYRrwYNlxojuaHvMC7/hguuQs95TMCfo6KcoITKwwAriaJTQlcxGjECQQDUKt1vnCUOuktxD5NBMMbfASEW9EVj7t0wpfH+lF/wg3cv1ULiGVpdo8qxDcHQzRWZlNe9s6zxxg8Hkwer+r4rAkB3+3ppbAdAxic1h3GiK7LANbaZWS4PHgQ2PDxOZHjgN5iZMMu5nCR+Lqzz1tkpkk1uhJFu3aSTsCnQ4YxN55nxAkAshgZMGq9oJM4aHtOfFZZWTA1enMpHC2RdhiV/cDGl7mC/p/hOLFXbWrj5aNKod7E1tpeDlsYPQqn6w+8TNx5bAkBrcrURuWXK78U/mil837MGMf17ob6+Y5pUj1rB1kI3Nq20i+sIbiBcSIVr0AMcJPNORH2z1snlrPzkJ/azA4GX";

	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
	public static String alipay_public_key = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIgHnOn7LLILlKETd6BFRJ0GqgS2Y3mn1wMQmyh9zEyWlz5p1zrahRahbXAfCfSqshSNfqOmAQzSHRVjCqjsAw1jyqrXaPdKBmr90DIpIxmIyKXv4GGAkPyJ/6FTFY99uhpiq0qadD/uSzQsefWo0aTvP/65zi3eof7TcZ32oWpwIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/beens-web/order/payNotify";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/beens/order/payReturn";

	// 签名方式
	public static String sign_type = "RSA";

	// 字符编码格式
	public static String charset = "utf-8";

	// 支付宝网关
//	public static String gatewayUrl = "https://openapi.alipay.com/gateway.do";

	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

	/**
	 * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
	 * @param sWord 要写入日志里的文本内容
	 */
    /*public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }*/
}

