package repair;

public class repairDTO {
	// λ³?? κ°μ²΄
	private int repairSeq;			// μ‘°μΉseq
	private int recSeq;				// κΈ°λ‘seq
	private String tankId;				// ?μ‘°ID
	private int farmId;			// ???₯ID
	private int fishId;				// ??? λ³΄ID
	private String state;			// ??
	private String yrCode;			// ?΄?μ½λλͺ?
	private String sensorDate;		// μΈ‘μ ?Ό?
	private String repairId;		// μ‘°μΉ?ID
	private String repairContents;	// μ‘°μΉ?΄?©
	private String regDate;			// ? λ³΄λ±λ‘μΌ
	private String regId;			// ? λ³΄λ±λ‘μ
	private String lastUptdate;		// μ΅μ’?? ?Ό
	private String lastUptId;		// μ΅μ’?? ?
	private String remark;			// λΉκ³ 
	
	// getter/setter
	public int getRepairSeq() {
		return repairSeq;
	}
	public void setRepairSeq(int repairSeq) {
		this.repairSeq = repairSeq;
	}
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
	public String getRepairId() {
		return repairId;
	}
	public void setRepairId(String repairId) {
		this.repairId = repairId;
	}
	public String getRepairContents() {
		return repairContents;
	}
	public void setRepairContents(String repairContents) {
		this.repairContents = repairContents;
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
