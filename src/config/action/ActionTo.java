package config.action;

public class ActionTo {
	private String path;
	private boolean isRedirect;

	@Override
	public String toString() {
		return "ActionTo{" +
				"path='" + path + '\'' +
				", isRedirect=" + isRedirect +
				'}';
	}

	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
}
