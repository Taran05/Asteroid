package in.co.sunrays.project4.test;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import in.co.sunrays.project4.bean.StudentBean;
import in.co.sunrays.project4.exception.ApplicationException;
import in.co.sunrays.project4.exception.DuplicateRecordException;
import in.co.sunrays.project4.model.StudentModel;

public class StudentModelTest {
	public static StudentModel model=new StudentModel();
	public static void main(String[] args) throws ParseException {
		   testAdd();
        // testDelete();
        // testUpdate();
       //  testFindByPK();
       //  testFindByEmailId();
        // testSearch();
        //testList();
	}
		public static void testAdd() throws ParseException {

	        try {
	            StudentBean bean = new StudentBean();
	            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	            
	            bean.setFirstName("ram");
	            bean.setLastName("kumawat");
	            bean.setDob(sdf.parse("31/12/1990"));
	            bean.setMobileNo("9165254357");
	            bean.setEmail("vipin.chandore@nenosystems.com");
	            bean.setCollegeId(2L);
	            bean.setCreatedBy("Admin");
	            bean.setModifiedBy("Admin");
	            bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
	            bean.setModifiedDatetime(new Timestamp(new Date().getTime()));
	            long pk = model.add(bean);
	            StudentBean addedbean = model.findByPK(pk);
	            if (addedbean == null) {
	                System.out.println("Test add fail");
	            }
	        } catch (ApplicationException e) {
	            e.printStackTrace();
	        } catch (DuplicateRecordException e) {
	            e.printStackTrace();
	        }

	    }
		 public static void testDelete() {

		        try {
		            StudentBean bean = new StudentBean();
		            long pk = 10L;
		            bean.setId(pk);
		            model.delete(bean);
		            StudentBean deletedbean = model.findByPK(pk);
		            if (deletedbean != null) {
		                System.out.println("Test Delete fail");
		            }
		        } catch (ApplicationException e) {
		            e.printStackTrace();
		        }
		    }
		 public static void testUpdate() {

		        try {
		            StudentBean bean = model.findByPK(2L);
		            bean.setCollegeId(3L);
		            bean.setFirstName("RAj");
		            bean.setLastName("chouhan");
		            model.update(bean);

		            StudentBean updatedbean = model.findByPK(2L);
		            if (!"RAj".equals(updatedbean.getFirstName())) {
		                System.out.println("Test Update fail");
		            }
		            System.out.println("update succes");
		        } catch (ApplicationException e) {
		            e.printStackTrace();
		        } catch (DuplicateRecordException e) {
		            e.printStackTrace();
		        }
		    }
		 
		 public static void testFindByPK() {
		        try {
		            StudentBean bean = new StudentBean();
		            long pk = 2L;
		            bean = model.findByPK(pk);
		            if (bean == null) {
		                System.out.println("Test Find By PK fail");
		            }
		            System.out.println(bean.getId());
		            System.out.println(bean.getFirstName());
		            System.out.println(bean.getLastName());
		            System.out.println(bean.getDob());
		            System.out.println(bean.getMobileNo());
		            System.out.println(bean.getEmail());
		            System.out.println(bean.getCollegeId());
		        } catch (ApplicationException e) {
		            e.printStackTrace();
		        }

		    }

		 public static void testFindByEmailId() {
		        try {
		            StudentBean bean = new StudentBean();
		            bean = model.findByEmailId("5@g.com");
		            if (bean == null) {
		                System.out.println("Test Find By EmailId fail");
		            }
		            System.out.println(bean.getId());
		            System.out.println(bean.getFirstName());
		            System.out.println(bean.getLastName());
		            System.out.println(bean.getDob());
		            System.out.println(bean.getMobileNo());
		            System.out.println(bean.getEmail());
		            System.out.println(bean.getCollegeId());
		        } catch (ApplicationException e) {
		            e.printStackTrace();
		        }
		    }
		 
		 public static void testSearch() {

		        try {
		            StudentBean bean = new StudentBean();
		            List list = new ArrayList();
		            bean.setFirstName("ram");
		            list = model.search(bean, 0, 0);
		            if (list.size() < 0) {
		                System.out.println("Test Serach fail");
		            }
		            Iterator it = list.iterator();
		            while (it.hasNext()) {
		                bean = (StudentBean) it.next();
		                System.out.println(bean.getId());
		                System.out.println(bean.getFirstName());
		                System.out.println(bean.getLastName());
		                System.out.println(bean.getDob());
		                System.out.println(bean.getMobileNo());
		                System.out.println(bean.getEmail());
		                System.out.println(bean.getCollegeId());
		            }

		        } catch (ApplicationException e) {
		            e.printStackTrace();
		        }

		    }
		  public static void testList() {

		        try {
		            StudentBean bean = new StudentBean();
		            List list = new ArrayList();
		            list = model.list(1, 10);
		            if (list.size() < 0) {
		                System.out.println("Test list fail");
		            }
		            Iterator it = list.iterator();
		            while (it.hasNext()) {
		                bean = (StudentBean) it.next();
		                System.out.println(bean.getId());
		                System.out.println(bean.getFirstName());
		                System.out.println(bean.getLastName());
		                System.out.println(bean.getDob());
		                System.out.println(bean.getMobileNo());
		                System.out.println(bean.getEmail());
		                System.out.println(bean.getCollegeId());
		                System.out.println(bean.getCreatedBy());
		                System.out.println(bean.getCreatedDatetime());
		                System.out.println(bean.getModifiedBy());
		                System.out.println(bean.getModifiedDatetime());
		            }

		        } catch (ApplicationException e) {
		            e.printStackTrace();
		        }
		    }
		
		
		
	}
	


