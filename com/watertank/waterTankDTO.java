package watertank;

public class waterTankDTO {
   // �??�� 객체
   private String tankId;		// ?��조ID
   private String fishName;		// ?��?��?��보명
   private int farmId;			// ?��?��?��ID
   private String userId;		// ?��조담?��?��ID
   private String doSensor;		// DO(?��존산?��)측정?��?���?
   private String phSensor;		// pH(?��?��)측정?��?���?
   private String wtSensor;		// WT(?��?��)측정?��?���?
   private String psuSensor;	// psu(?��?��)측정?��?���?
   private String nh4Sensor;	// nh4(?��모니?��)측정?��?���?
   private String no2Sensor;   	// no2(?��질산)측정?��?���?
   private int sensorGroup;		// ?��?��그룹
   private String regDate;		// ?��보등록일
   private String regId;		// ?��보등록자
   private String lastUptdate;	// 최종?��?��?��
   private String lastUptId;	// 최종?��?��?��
   private String remark;		// 비고
   
   
   // getter/setter
  
public String getTankId() {
	return tankId;
}
public void setTankId(String tankId) {
	this.tankId = tankId;
}
public String getFishName() {
	return fishName;
}
public void setFishName(String fishName) {
	this.fishName = fishName;
}
public int getFarmId() {
	return farmId;
}
public void setFarmId(int farmId) {
	this.farmId = farmId;
}
public String getUserId() {
	return userId;
}
public void setUserId(String userId) {
	this.userId = userId;
}
public String getDoSensor() {
	return doSensor;
}
public void setDoSensor(String doSensor) {
	this.doSensor = doSensor;
}
public String getPhSensor() {
	return phSensor;
}
public void setPhSensor(String phSensor) {
	this.phSensor = phSensor;
}
public String getWtSensor() {
	return wtSensor;
}
public void setWtSensor(String wtSensor) {
	this.wtSensor = wtSensor;
}
public String getPsuSensor() {
	return psuSensor;
}
public void setPsuSensor(String psuSensor) {
	this.psuSensor = psuSensor;
}
public String getNh4Sensor() {
	return nh4Sensor;
}
public void setNh4Sensor(String nh4Sensor) {
	this.nh4Sensor = nh4Sensor;
}
public String getNo2Sensor() {
	return no2Sensor;
}
public void setNo2Sensor(String no2Sensor) {
	this.no2Sensor = no2Sensor;
}
public int getSensorGroup() {
	return sensorGroup;
}
public void setSensorGroup(int sensorGroup) {
	this.sensorGroup = sensorGroup;
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