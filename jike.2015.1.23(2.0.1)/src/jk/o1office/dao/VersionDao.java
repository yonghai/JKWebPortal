package jk.o1office.dao;

import java.util.List;

import jk.o1office.domin.RotationImage;
import jk.o1office.domin.VersionInfo;

public interface VersionDao {
	VersionInfo getVersionInfo(String role);
	
	String getVersion(String where,String role);

	String[] getPrices(String role);

	String[] getDeliveryTime();

	List<RotationImage> getRotationImage();
}
