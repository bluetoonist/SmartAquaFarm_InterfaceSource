package rec;

public class recDTO {
	// �??�� 객체
	private int recSeq;				// 기록코드
	private String tankId;				// ?��조ID
	private int farmId;				// ?��?��?��ID
	private int fishId;				// ?��?��?��보ID
	private String state;			// ?��?��
	private String yrCode;			// ?��?��코드기록
	private String sensorDate;		// 측정?��?��
	private Double doRec;			// 측정 DO(?���? ?��?��)
	private Double wtRec;			// 측정 wt(?��?��)
	private Double psuRec;			// 측정 psu(?��?��)
	private Double phRec;			// 측정 ph(?��?��)
	private Double nh4Rec;			// 측정 nh4(?��모니?��)
	private Double no2Rec;			// 측정 no2(?��질산)
	private String regDate;			// ?��보등록일
	private String regId;			// ?��보등록자
	private String lastUptdate;		// 최종?��?��?��
	private String lastUptId;		// 최종?��?��?��
	private String remark;			// 비고
	
	public int getRecSeq() {
		return recSeq;
	}
	public void setRecSeq(int recSeq) {
		this.recSeq = recSeq;
	}
	public String getTankId() {
		return tankId;
	}
	public void setTankId(String tankId) {
		this.tankId = tankId;
	}
	public int getFarmId() {
		return farmId;
	}
	public void setFarmId(int farmId) {
		this.farmId = farmId;
	}
	public int getFishId() {
		return fishId;
	}
	public void setFishId(int fishId) {
		this.fishId = fishId;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getYrCode() {
		return yrCode;
	}
	public void setYrCode(String yrCode) {
		this.yrCode = yrCode;
	}
	public String getSensorDate() {
		return sensorDate;
	}
	public void setSensorDate(String sensorDate) {
		this.sensorDate = sensorDate;
	}
	public Double getDoRec() {
		return doRec;
	}
	public void setDoRec(Double doRec) {
		this.doRec = doRec;
	}
	public Double getWtRec() {
		return wtRec;
	}
	public void setWtRec(Double wtRec) {
		this.wtRec = wtRec;
	}
	public Double getPsuRec() {
		return psuRec;
	}
	public void setPsuRec(Double psuRec) {
		this.psuRec = psuRec;
	}
	public Double getPhRec() {
		return phRec;
	}
	public void setPhRec(Double phRec) {
		this.phRec = phRec;
	}
	public Double getNh4Rec() {
		return nh4Rec;
	}
	public void setNh4Rec(Double nh4Rec) {
		this.nh4Rec = nh4Rec;
	}
	public Double getNo2Rec() {
		return no2Rec;
	}
	public void setNo2Rec(Double no2Rec) {
		this.no2Rec = no2Rec;
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
	public String getLastUptdate() {
		return lastUptdate;
	}
	public void setLastUptdate(String lastUptdate) {
		this.lastUptdate = lastUptdate;
	}
	public String getLastUptId() {
		return lastUptId;
	}
	public void setLastUptId(String lastUptId) {
		this.lastUptId = lastUptId;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
