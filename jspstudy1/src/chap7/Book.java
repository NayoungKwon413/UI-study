package chap7;

//Bean Class(��üȭ�� ���ؼ� ���� ������ �� �ִ� Ŭ����)
// ���������ڰ� private�� ��� ������ public�� ��� �޼���(getter, setter) �� Ŭ����
// getProperty : getXxx()  => xxx �� getProperty
// setProperty : setXxx()  => xxx �� setProperty
public class Book {
	private String name;
	private String title;
	private String content;
	//setter, getter
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
