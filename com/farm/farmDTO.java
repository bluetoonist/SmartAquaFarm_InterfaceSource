package farm;

public class farmDTO {

	// ���� ��ü
	private int farmId; // �����ID
	private String farmName; // ������̸�
	private String address; // ������ּ�
	private int tankcnt; // ������� ������ ��
	private String userId; // �����ID
	private String regDate; // ���������
	private String regId; // ���������
	private String lastUptDate; // ����������
	private String lastUptId; // ����������
	private String regFromDate; // ����� ����
	private String regToDate; // ����� ��
	private String remark; // ���
	private String remarkFarmid; // ��ü �����ڰ� FARMID�� ����

	// getter/setter
	public String getRemarkFarmid() {
		return remarkFarmid;
	}

	public void setRemarkFarmid(String remarkFarmid) {
		this.remarkFarmid = remarkFarmid;
	}

	public int getFarmId() {
		return farmId;
	}

	public void setFarmId(int farmId) {
		this.farmId = farmId;
	}

	public String getFarmName() {
		return farmName;
	}

	public void setFarmName(String farmName) {
		this.farmName = farmName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getTankcnt() {
		return tankcnt;
	}

	public void setTankcnt(int tankcnt) {
		this.tankcnt = tankcnt;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getLastUptDate() {
		return lastUptDate;
	}

	public void setLastUptDate(String lastUptDate) {
		this.lastUptDate = lastUptDate;
	}

	public String getLastUptId() {
		return lastUptId;
	}

	public void setLastUptId(String lastUptId) {
		this.lastUptId = lastUptId;
	}

	public String getRegFromDate() {
		return regFromDate;
	}

	public void setRegFromDate(String regFromDate) {
		this.regFromDate = regFromDate;
	}

	public String getRegToDate() {
		return regToDate;
	}

	public void setRegToDate(String regToDate) {
		this.regToDate = regToDate;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
