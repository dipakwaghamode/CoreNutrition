package com.fmpro.controller;
 
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.exception.ExceptionUtils;

import com.fmpro.dao.AccountDAO;
import com.fmpro.dao.OrderDAO;
import com.fmpro.dao.ProductDAO;
import com.fmpro.entity.Area;
import com.fmpro.entity.Order;
import com.fmpro.entity.Product;
import com.fmpro.entity.Restro;
import com.fmpro.form.ProductForm;
import com.fmpro.model.CartInfo;
import com.fmpro.model.OrderDetailInfo;
import com.fmpro.model.OrderInfo;
import com.fmpro.model.ProductInfo;
import com.fmpro.pagination.PaginationResult;
import com.fmpro.utils.Utils;
import com.fmpro.validator.ProductFormValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
 
@Controller
@Transactional
public class AdminController {
 
   @Autowired
   private OrderDAO orderDAO;
 
   @Autowired
   private ProductDAO productDAO;
   
   @Autowired
   private AccountDAO accountDAO;
   
 
   @Autowired
   private ProductFormValidator productFormValidator;
 
   @InitBinder
   public void myInitBinder(WebDataBinder dataBinder) {
      Object target = dataBinder.getTarget();
      if (target == null) {
         return;
      }
      System.out.println("Target=" + target);
 
      if (target.getClass() == ProductForm.class) {
         dataBinder.setValidator(productFormValidator);
      }
   }
 
   
   
   
   
   //register area form 
	@GetMapping("/add-area")
	public ModelAndView areaView() {
		ModelAndView mv = new ModelAndView("register-area");
		
		return mv;
	}
	
	
	
	
	 //POST: Save Area information.
	  @RequestMapping(value = { "/register-area" }, method = RequestMethod.POST)
	  public String dataSaveArea(HttpServletRequest request, //
	        Model model, //
	        @ModelAttribute("area")
	        @RequestBody Area area) {
		 
		  accountDAO.saveArea(area);
		 
	     return "area";
		  

	  }
   
   
   
	  
	  //Get: read Area information.
	  @GetMapping("/area")
	  public ModelAndView getAreaData() {
		   ModelAndView mv = new ModelAndView("area");
		   
			List<Area> list =  accountDAO.readAllArea();
			mv.addObject("areaList", list);
		   
		   return mv;
	  }
   
   

		
	/*
	   @RequestMapping({ "/foodmantra-read" })
	   public String listRestro(HttpServletRequest request, Model model, //
	         @RequestParam(value = "area_id", defaultValue = "") int area_id) {
	 

			List<Restro> list = accountDAO.findRestro(area_id);
	        request.setAttribute("restroList", list);
			

	 
	      return "restrolist";
	   }
	   
	   
	 	  //find by id-----
		@PostMapping("/read?id=")
		public String readid(HttpServletRequest request) {
			
			int id = Integer.parseInt( request.getParameter("id")) ;
			List<Restro> list = accountDAO.findRestro(id);
	        request.setAttribute("restroList", list);
			

			
			return "restrolist";
		}
	  
	
	*/
	  
	  
	  @RequestMapping({ "/read" })
	   public ModelAndView listProductHandler(HttpServletRequest request, Model model, //
	         @RequestParam(value = "area_id", defaultValue = "") int area_id) {
		  ModelAndView mv = new ModelAndView("restrolist");
	    	  List<Restro> list = accountDAO.findRestro(area_id);
	    	  mv.addObject("restroList", list);

	 
	    	  return mv;
	   }
	  
	  
	  
	  
	  	//read all restro
		@GetMapping("/restroList")
		public ModelAndView restrolistView() {
			ModelAndView mv = new ModelAndView("restrolist");
	    	  List<Restro> list = accountDAO.readAllRestro();
	    	  mv.addObject("restroList", list);
			return mv;
		}

		  
		@GetMapping("/add-restro")
		public ModelAndView restroView() {
			ModelAndView mv = new ModelAndView("register-restro");
			
			return mv;
		}
	  
	  
	  //POST: Save restro information.
	 @RequestMapping(value = { "/register-restro" }, method = RequestMethod.POST)
	 public String DataSave(HttpServletRequest request, //
	       Model model, //
	      @ModelAttribute("restro")
	       @RequestBody Restro restro) {
		   
		  accountDAO.saveRestro(restro);

		  return "redirect:/area";
	 }
	  
	  
	 //Get: read restro information.
	 @GetMapping("/restro")
	 public ModelAndView getRestroData() {
		   ModelAndView mv = new ModelAndView("restro");
		   
			List<Restro> list =  accountDAO.readAllRestro();
			mv.addObject("restroList", list);
		   
		   return mv;
	 }
   
   
	 @RequestMapping("/admin/login")
	 	public ModelAndView loginFaild() {
	 		ModelAndView mv = new ModelAndView("login-error");
	    	 
	    	 	return mv;
	 	}

   
   
	  
   
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 //------------------------
   
   
   // GET: Show Login Page
   @RequestMapping(value = { "/foodmantra/login" }, method = RequestMethod.GET)
   public String login(Model model) {
 
      return "login";
   }
 
   
   // Account information Manager---admin
   @RequestMapping(value = { "/admin/accountInfo" }, method = RequestMethod.GET)
   public String accountInfo(Model model) {
 
      UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      System.out.println(userDetails.getPassword());
      System.out.println(userDetails.getUsername());
      System.out.println(userDetails.isEnabled());
 
      model.addAttribute("userDetails", userDetails);
      return "accountInfo";
   }
   
   
   
   
   
   @RequestMapping(value = { "/admin/orderList" }, method = RequestMethod.GET)
   public String orderList(Model model, //
         @RequestParam(value = "page", defaultValue = "1") String pageStr) {
      int page = 1;
      try {
         page = Integer.parseInt(pageStr);
      } catch (Exception e) {
      }
      final int MAX_RESULT = 20;
      final int MAX_NAVIGATION_PAGE = 10;
 
      PaginationResult<OrderInfo> paginationResult //
            = orderDAO.listOrderInfo(page, MAX_RESULT, MAX_NAVIGATION_PAGE);
 
      model.addAttribute("paginationResult", paginationResult);
      return "orderList";
   }
 
   
   
   
   
   //-----About Product-------------
   
   // GET: Show product.
   @RequestMapping(value = { "/admin/product" }, method = RequestMethod.GET)
   public String product(Model model, @RequestParam(value = "code", defaultValue = "") String code) {
      ProductForm productForm = null;
 
      if (code != null && code.length() > 0) {
         Product product = productDAO.findProduct(code);
         if (product != null) {
            productForm = new ProductForm(product);
         }
      }
      if (productForm == null) {
         productForm = new ProductForm();
         productForm.setNewProduct(true);
      }
      model.addAttribute("productForm", productForm);
      return "product";
   }
 
   // POST: Save product
   @RequestMapping(value = { "/admin/product" }, method = RequestMethod.POST)
   public String productSave(Model model, //
         @ModelAttribute("productForm") @Validated ProductForm productForm, //
         BindingResult result, //
         final RedirectAttributes redirectAttributes) {
 
      if (result.hasErrors()) {
         return "product";
      }
      try {
         productDAO.save(productForm);
      } catch (Exception e) {
         Throwable rootCause = ExceptionUtils.getRootCause(e);
         String message = rootCause.getMessage();
         model.addAttribute("errorMessage", message);
         // Show product form.
         return "product";
      }
 
      return "redirect:/foodmantra-menuList";
   }
 
   
   //order see----
   @RequestMapping(value = { "/admin/order" }, method = RequestMethod.GET)
   public String orderView(Model model, @RequestParam("orderId") String orderId) {
      OrderInfo orderInfo = null;
      if (orderId != null) {
         orderInfo = this.orderDAO.getOrderInfo(orderId);
      }
      if (orderInfo == null) {
         return "redirect:/admin/orderList";
      }
      List<OrderDetailInfo> details = this.orderDAO.listOrderDetailInfos(orderId);
      orderInfo.setDetails(details);
 
      model.addAttribute("orderInfo", orderInfo);
 
      return "order";
   }
   
   
   
   
  
   
   @DeleteMapping("/{id}")
	public String deleteOrder(@PathVariable int orderId) {
		
		return "foodmantra";
	}
   
   
   
   
   @RequestMapping(value = { "/foodmantra-restro" }, method = RequestMethod.GET)
   public String getRestrobyid(Model model, @RequestParam int code) {
      
//	   Restro restro = productDAO.findProduct(code);
	   
	   List<Restro> list =  accountDAO.findRestro(code);
      
      model.addAttribute("restroList", list);
      
      return "restrolist";
   }

   
  /*
   
 //UPDATE COMPLETED ORDER
   @RequestMapping(value = { "admin/orderListComplete" }, method = RequestMethod.GET)
   public String updateOrderById(Model model, @RequestParam String code) {
      
	   
	   Order order =  accountDAO.updateOrder(code);
      
      model.addAttribute("orderList",order);
      
      return "redirect:/admin/orderList";
   }

   
   */
   
   
//   @RequestMapping(value = { "/admin/order-del" }, method = RequestMethod.GET)
//   public String orderdel(Model model, @RequestParam("orderId") String orderId) {
//      
//	   orderDAO.deleteOrder(orderId);
//	   
//	   return "redirect:/admin/orderList";
//   }

   
   
   
   
   
   
   
 
}