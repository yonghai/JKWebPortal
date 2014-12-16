package jk.o1office.dao;

import java.util.List;

import jk.o1office.domin.Area;
import jk.o1office.domin.Community;

public interface AreaDao {

	List<Area> getAreas();

	List<Community> getCommunities(int areaid);

	List<Area> getArea(int pid);

}
