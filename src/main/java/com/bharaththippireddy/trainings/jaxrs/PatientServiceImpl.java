package com.bharaththippireddy.trainings.jaxrs;

import java.util.HashMap;
import java.util.Map;

import javax.ws.rs.core.Response;

public class PatientServiceImpl implements PatientService {
	private long currentId = 123;
	Map<Long, Patient> patients = new HashMap<Long, Patient>();
	Map<Long, Prescription> prescriptions = new HashMap<Long, Prescription>();

	public PatientServiceImpl() {
		init();
	}

	final void init() {
		Patient patient = new Patient();
		patient.setName("John");
		patient.setId(currentId);
		patients.put(patient.getId(), patient);

		Prescription prescription = new Prescription();
		prescription.setDescription("prescription 223");
		prescription.setId(223);
		prescriptions.put(prescription.getId(), prescription);
	}

	public Response addPatient(Patient patient) {
		patient.setId(++currentId);
		patients.put(patient.getId(), patient);
		return Response.ok(patient).build();
	}

	public Patient getPatient(String id) {
		long parseLong = Long.parseLong(id);
		return patients.get(parseLong);
	}

	public Response updatePatient(Patient updatedPatient) {
		Patient patient = patients.get(updatedPatient.getId());
		Response response =null;
		if(patient != null) {
			patients.put(updatedPatient.getId(), updatedPatient);
			response  = Response.ok().build();
		}else {
			response  = Response.notModified().build();
		}
		return response;
	}

	public Response deletePatients(String id) {
		Patient patient = patients.get(Long.parseLong(id));
		Response response =null;
		if(patient != null) {
			patients.remove(Long.parseLong(id));
			response  = Response.ok().build();
		}else {
			response  = Response.notModified().build();
		}
		return response;
	}

	public Prescription getPrescription(String prescriptionId) {
		Prescription prescription = prescriptions.get(Long.parseLong(prescriptionId));
		return prescription;
	}

}
