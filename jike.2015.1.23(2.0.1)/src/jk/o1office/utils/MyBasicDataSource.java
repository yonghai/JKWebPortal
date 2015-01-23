package jk.o1office.utils;

import java.sql.SQLException;
import java.sql.SQLFeatureNotSupportedException;
import java.util.logging.Logger;

import org.apache.commons.dbcp.BasicDataSource;

public class MyBasicDataSource extends BasicDataSource {

	public Logger getParentLogger() throws SQLFeatureNotSupportedException {
		return null;
	}

	public boolean isWrapperFor(Class<?> iface) throws SQLException {
		return false;
	}

	public <T> T unwrap(Class<T> iface) throws SQLException {
		return null;
	}

}
