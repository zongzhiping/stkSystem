package com.enumtype;

import java.io.Serializable;

/**
 * Created by zzy on 2017/6/12.
 */
public class CodeBean implements Serializable{

    private static final long serialVersionUID = 1L;

    private int value;

    private String lable;

    public CodeBean(int value, String label) {

    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public String getLable() {
        return lable;
    }

    public void setLable(String lable) {
        this.lable = lable;
    }
}
