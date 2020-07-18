package com.sdhh.util;

/**
 * Created by Administrator on 2020/7/12.
 */
public class CreatetSQL {
    private static String str = "eid\n" +
            ",ptyp\n" +
            ",etyp\n" +
            ",enm\n" +
            ",esbxh\n" +
            ",eazdd\n" +
            ",eipdz\n" +
            ",extpzzdrl\n" +
            ",extpzrl\n" +
            ",ezdfxs\n" +
            ",ecjhmzcws\n" +
            ",ejshmzcws\n" +
            ",ezjfx\n" +
            ",ezjrl\n" +
            ",eyhms\n" +
            ",etryxsj\n" +
            ",ebz";
    public static String[] ziduan;
    public static void out(String [] arr){
        for(int i=0;i<arr.length;i++){
            System.out.println(arr[i]);
        }
    }
    public static void tablesql(String []arr){
        String str = "";
        for(int i=0;i<arr.length;i++){
            str += "`" + arr[i] + "`" + " varchar() DEFAULT NULL,\n";
        }
        System.out.println(str);
    }
    public static void outVarInit(String [] arr){
        for(int i=0;i<arr.length;i++){
            System.out.print(arr[i] + "=\"" + "\",");
        }
    }
    public static void outVarID(String [] arr){
        for(int i=0;i<arr.length;i++){
            System.out.println(arr[i] + " = $(\"#" + arr[i] + "\").val();");
        }
    }
    public static void outVarAjax(String [] arr){
        for(int i=0;i<arr.length;i++){
            System.out.println("\"" +arr[i] +"\":" +arr[i]+ ",");
        }
    }
    public static void outJavaReq(String [] arr){
        for(int i=0;i<arr.length;i++){
            System.out.println("String " + arr[i] + ",");
        }
    }
    public static void outJavaParam(String [] arr){
        System.out.print("(");
        for(int i=0;i<arr.length;i++){
            System.out.print(arr[i] + ", ");
        }
        System.out.print(")");
    }
    public static void main(String []args){
        str = str.replaceAll("\\n", "");
        ziduan = str.split(",");
        //out(ziduan);
        //tablesql(ziduan);
        //outVarInit(ziduan);
        //outJavaReq(ziduan);
        outJavaParam(ziduan);
    }
}
