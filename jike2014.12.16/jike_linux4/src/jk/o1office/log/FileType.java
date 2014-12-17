package jk.o1office.log;

public enum FileType {
	UUSERINFO("uuserinfo"),
	UUSERORDER("uuserorder"),
	DUSERINFO("duserinfo"),
	DUSERORDER("duserorder");
	private String filename = "";
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	private FileType(String filename) {
		this.filename = filename;
	}
	
}
