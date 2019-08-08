package com.wmm.shirodemo;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.crypto.hash.SimpleHash;

public class MD5Test {
    public static void main(String[] args) {
        //原始密码
        String source="123456";
        //盐
        String salt="admin";
        //散列次数
        int hashInterrations=2;
        /*	方法1：
         * 第一个参数：明文，原始密码
         * 第二个参数：盐，通常使用随机数，这里指定固定字符串
         * 第三个参数：散列的次数，比如散列两次，相当 于md5(md5(''))
         */
        Md5Hash md5Hash=new Md5Hash(source, salt, hashInterrations);
        System.out.println(md5Hash);
        //方法2：第一个参数：散列算法
        SimpleHash sim=new SimpleHash("md5", source, salt,hashInterrations);
        System.out.println(sim);
    }
}
