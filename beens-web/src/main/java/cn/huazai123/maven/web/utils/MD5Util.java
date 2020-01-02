package cn.huazai123.maven.web.utils;

import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * MD5加密算法工具类
 *
 * @author pyh
 */
public class MD5Util {

    /**
     * 默认加密次数
     */
    private static final int DEFAULT_HASH_ITERATIONS = 1234;

    public static int hashIterations = DEFAULT_HASH_ITERATIONS;

    /**
     * @param source 加密元数据
     * @param salt   加密盐
     * @return
     */
    public static String getCiphertext(final String source, final String salt) {
        Md5Hash md5Hash = new Md5Hash(source, salt, hashIterations);
        return md5Hash.toString();
    }

    /**
     * @param source         加密元数据
     * @param salt           加密盐
     * @param hashIterations 加密迭代次数
     * @return
     */
    public static String getCiphertext(final String source, final String salt, final int hashIterations) {
        Md5Hash md5Hash = new Md5Hash(source, salt, hashIterations);
        return md5Hash.toString();
    }

    public static void main(String[] args) {
        System.out.print(MD5Util.getCiphertext("12345678", "langzi"));
    }
}
