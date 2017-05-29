package com.util;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.model.Stu;

public class ExcelUtil {

	public static List getStuListByExcel(File file) {
		List list = new ArrayList();
		try {
			FileInputStream is = new FileInputStream(file.getAbsolutePath());
			HSSFWorkbook wbs = new HSSFWorkbook(is);
			HSSFSheet childSheet = wbs.getSheetAt(0);
			// System.out.println(childSheet.getPhysicalNumberOfRows());
			System.out.println("有行数" + childSheet.getLastRowNum());
			for (int j = 1; j <= childSheet.getLastRowNum(); j++) {
				Stu bean = new Stu();
				HSSFRow row = childSheet.getRow(j);
				// System.out.println(row.getPhysicalNumberOfCells());
				System.out.println("有列数" + row.getLastCellNum());
				if (null != row) {
					String str="";
					HSSFCell aCell = row.getCell(Short.parseShort("1"));
					int type = aCell.getCellType();
					if(type==aCell.CELL_TYPE_NUMERIC){
						str = aCell.getNumericCellValue()+"";
						bean.setUserNo(str);
					}else{
						str = aCell.getStringCellValue();
						bean.setUserNo(str);
					}
					
					aCell = row.getCell(Short.parseShort("2"));
					str = aCell.getStringCellValue();
					bean.setRealName(str);

					aCell = row.getCell(Short.parseShort("3"));
					str = aCell.getStringCellValue();
					//bean.setSex(str);

					aCell = row.getCell(Short.parseShort("4"));
					str = aCell.getStringCellValue();
					//bean.setXy(str);

					aCell = row.getCell(Short.parseShort("5"));
					str = aCell.getStringCellValue();
					//bean.setZy(str);

					aCell = row.getCell(Short.parseShort("6"));
					str = aCell.getStringCellValue();
					//bean.setBj(str);
					bean.setState("未考试");

				}

				list.add(bean);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}
  
	public static void main(String[] args) {
		File file = new File("E://test.xls");
		ExcelUtil.getStuListByExcel(file);
	}

}
