package com.enumtype;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by zzy on 2017/6/12.
 */
public enum SubjectType {

    Chinese(1,"语文"),
    Mathmatic(2,"数学"),
    English(3,"英文");

    private int value;
    private String label;

    private SubjectType(int value, String label){
        this.value = value;
        this.label = label;
    }

    //根据中文名称获取值对象
    public static SubjectType get(String label){
        for(SubjectType b : SubjectType.values()){
            if(b.getLabel().equals(label)){
                return b;
            }
        }
        return null;
    }

    //根据值获取中文说明对象
    public static SubjectType get(int value){
        for(SubjectType b : SubjectType.values()){
            if(b.getValue()==value){
                return b;
            }
        }
        return null;
    }

    //获取列表数据
    public static List getList(){
        SubjectType[] values = SubjectType.values();
        List result = new ArrayList();
        for( int i = 0 ; i < values.length ; i++){
            result.add(new CodeBean(values[i].getValue(),values[i].getLabel()));
        }
        return result;
    }

    //获取全部列表数据
    public static List getListWithBlank(){
        SubjectType[] values = SubjectType.values();
        List result = new ArrayList();
        result.add(new CodeBean(-1, "全部"));
        for (int i = 0; i < values.length; i++){
            result.add(new CodeBean(values[i].getValue(),values[i].getLabel()));
        }
        return result;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }
}
