package watertank;

public class waterTankDTO {
   // λ³?? κ°μ²΄
   private String tankId;		// ?μ‘°ID
   private String fishName;		// ??? λ³΄λͺ
   private int farmId;			// ???₯ID
   private String userId;		// ?μ‘°λ΄?Ή?ID
   private String doSensor;		// DO(?©μ‘΄μ°?)μΈ‘μ ?Ό?λͺ?
   private String phSensor;		// pH(?°?)μΈ‘μ ?Ό?λͺ?
   private String wtSensor;		// WT(??¨)μΈ‘μ ?Ό?λͺ?
   private String psuSensor;	// psu(?Ό?)μΈ‘μ ?Ό?λͺ?
   private String nh4Sensor;	// nh4(?λͺ¨λ?)μΈ‘μ ?Ό?λͺ?
   private String no2Sensor;   	// no2(?μ§μ°)μΈ‘μ ?Ό?λͺ?
   private int sensorGroup;		// ?Ό?κ·Έλ£Ή
   private String regDate;		// ? λ³΄λ±λ‘μΌ
   private String regId;		// ? λ³΄λ±λ‘μ
   private String lastUptdate;	// μ΅μ’?? ?Ό
   private String lastUptId;	// μ΅μ’?? ?
   private String remark;		// λΉκ³ 
   
   
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