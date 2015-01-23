package jk.o1office.service;

import java.util.List;

import jk.o1office.domin.RotationImage;
import jk.o1office.domin.VersionInfo;

public interface VersionService {
	String getVersionInfo(String role,String token) throws Exception;
	
	VersionInfo getVersion(String role) throws Exception;

	String[] getPrices(String role) throws Exception;

	String[] getDeliveryTime() throws Exception;

	List<RotationImage> getRotationImage() throws Exception;
}
