package com.zhyonk.entity;
public class IpPosition
{
	/**
	 * 是否有效
	 */
    private int ret;
    /**
     * 开始
     */
    private int start;

    private int end;
    /**
     * 国家
     */
    private String country = "中国";
    /**
     * 省份
     */
    private String province = "本地";
    /**
     * 城市
     */
    private String city = "局域网";
    /**
     * 地区
     */
    private String district;
    /**
     * 服务商
     */
    private String isp;
    /**
     * 类型
     */
    private String type;
    /**
     * 描述
     */
    private String desc;

    public void setRet(int ret){
        this.ret = ret;
    }
    public int getRet(){
        return this.ret;
    }
    public void setStart(int start){
        this.start = start;
    }
    public int getStart(){
        return this.start;
    }
    public void setEnd(int end){
        this.end = end;
    }
    public int getEnd(){
        return this.end;
    }
    public void setCountry(String country){
        this.country = country;
    }
    public String getCountry(){
        return this.country;
    }
    public void setProvince(String province){
        this.province = province;
    }
    public String getProvince(){
        return this.province;
    }
    public void setCity(String city){
        this.city = city;
    }
    public String getCity(){
        return this.city;
    }
    public void setDistrict(String district){
        this.district = district;
    }
    public String getDistrict(){
        return this.district;
    }
    public void setIsp(String isp){
        this.isp = isp;
    }
    public String getIsp(){
        return this.isp;
    }
    public void setType(String type){
        this.type = type;
    }
    public String getType(){
        return this.type;
    }
    public void setDesc(String desc){
        this.desc = desc;
    }
    public String getDesc(){
        return this.desc;
    }
}
