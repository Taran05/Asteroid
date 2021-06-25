package in.co.sunrays.project4.test;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import in.co.sunrays.project4.bean.MarksheetBean;
import in.co.sunrays.project4.exception.ApplicationException;
import in.co.sunrays.project4.exception.DuplicateRecordException;
import in.co.sunrays.project4.model.MarksheetModel;

public class MarksheetModelTest {
	
	public static MarksheetModel model = new MarksheetModel();
	public static void main(String[] args) throws Exception {
		//  testAdd();
        // testDelete();
        // testUpdate();
        // testFindByRollNo();
       // testFindByPK();
        // testSearch();
        // testMeritList();
      // testList();
		
	}
	public static void testAdd() throws Exception{
		try {
			MarksheetBean bean= new MarksheetBean();
			bean.setName("Amhs");
			bean.setRollNo("0809cs919");
			bean.setPhysics(77);
			bean.setChemistry(87);
			bean.setMaths(90);
			bean.setStudentId(3L);
			 long pk = model.add(bean);
	            MarksheetBean addedbean = model.findByPK(pk);
	            System.out.println(pk);
	            if (addedbean == null) {
	                System.out.println("Test add fail");
	            }
	        } catch (ApplicationException e) {
	            e.printStackTrace();
	        } catch (DuplicateRecordException e) {
	            e.printStackTrace();
	        }

	    }
	
	    public static void testDelete(){
	    	try{
	    		   MarksheetBean bean = new MarksheetBean();
	               long pk = 9L;
	               bean.setId(pk);
	               model.delete(bean);
	               MarksheetBean deletedbean = model.findByPK(pk);
	               if (deletedbean != null) {
	                   System.out.println("Test Delete fail");
	               }
	           } catch (ApplicationException e) {
	               e.printStackTrace();
	           }
	    	}
	    
	    public static void testUpdate() {

	        try {
	            MarksheetBean bean = model.findByPK(3);
	            bean.setName("IPS");
	            bean.setChemistry(65);
	            bean.setMaths(66);
	           bean.setStudentId(2);
	            model.update(bean);

	            MarksheetBean updatedbean = model.findByPK(3L);
	            System.out.println("Test Update succ");
	            if (!"IIM".equals(updatedbean.getName())) {
	                System.out.println("Test Update fail");
	            }
	        } catch (ApplicationException e) {
	            e.printStackTrace();
	        } catch (DuplicateRecordException e) {
	            e.printStackTrace();
	        }

	    }
	    
	    public static void testFindByRollNo() {

	        try {
	            MarksheetBean bean = model.findByRollNo("1");
	            if (bean == null) {
	                System.out.println("Test Find By RollNo fail");
	            }
	            System.out.println(bean.getId());
	            System.out.println(bean.getRollNo());
	            System.out.println(bean.getName());
	            System.out.println(bean.getPhysics());
	            System.out.println(bean.getChemistry());
	            System.out.println(bean.getMaths());
	        } catch (ApplicationException e) {
	            e.printStackTrace();
	        }

	    }
	    
	    public static void testFindByPK() {
	        try {
	            MarksheetBean bean = new MarksheetBean();
	            long pk = 2L;
	            bean = model.findByPK(pk);
	            if (bean == null) {
	                System.out.println("Test Find By PK fail");
	            }
	            System.out.println(bean.getId());
	            System.out.println(bean.getRollNo());
	            System.out.println(bean.getName());
	            System.out.println(bean.getPhysics());
	            System.out.println(bean.getChemistry());
	            System.out.println(bean.getMaths());
	        } catch (ApplicationException e) {
	            e.printStackTrace();
	        }

	    }

	    public static void testSearch() {
	        try {
	            MarksheetBean bean = new MarksheetBean();
	            List list = new ArrayList();
	            bean.setName("mohan lal");
	            list = model.search(bean, 1, 10);
	            if (list.size() < 0) {
	                System.out.println("Test Search fail");
	            }
	            Iterator it = list.iterator();
	            while (it.hasNext()) {
	                bean = (MarksheetBean) it.next();
	                System.out.println(bean.getId());
	                System.out.println(bean.getRollNo());
	                System.out.println(bean.getName());
	                System.out.println(bean.getPhysics());
	                System.out.println(bean.getChemistry());
	                System.out.println(bean.getMaths());
	            }
	        } catch (ApplicationException e) {
	            e.printStackTrace();
	        }
	    }
	   
	    public static void testMeritList() {
	        try {
	            MarksheetBean bean = new MarksheetBean();
	            List list = new ArrayList();
	            list = model.getMeritList(1, 5);
	            if (list.size() < 0) {
	                System.out.println("Test List fail");
	            }
	            Iterator it = list.iterator();
	            while (it.hasNext()) {
	                bean = (MarksheetBean) it.next();
	                System.out.println(bean.getId());
	                System.out.println(bean.getRollNo());
	                System.out.println(bean.getName());
	                System.out.println(bean.getPhysics());
	                System.out.println(bean.getChemistry());
	                System.out.println(bean.getMaths());
	            }
	        } catch (ApplicationException e) {
	            e.printStackTrace();
	        }

	    }
	    public static void testList() {
	        try {
	            MarksheetBean bean = new MarksheetBean();
	            List list = new ArrayList();
	            list = model.list(1, 6);
	            if (list.size() < 0) {
	                System.out.println("Test List fail");
	            }
	            Iterator it = list.iterator();
	            while (it.hasNext()) {
	                bean = (MarksheetBean) it.next();
	                System.out.println(bean.getId());
	                System.out.println(bean.getRollNo());
	                System.out.println(bean.getName());
	                System.out.println(bean.getPhysics());
	                System.out.println(bean.getChemistry());
	                System.out.println(bean.getMaths());
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
