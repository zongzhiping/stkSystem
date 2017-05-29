package com.util;

import java.util.Random;

public class TestRandom {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Random random = new Random();
        for(int i = 0; i < 20;i++) {
            System.out.println(Math.abs(random.nextInt())%5);
        }

	}

}
