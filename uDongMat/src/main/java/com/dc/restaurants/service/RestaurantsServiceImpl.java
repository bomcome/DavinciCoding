package com.dc.restaurants.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dc.menus.dao.MenusDao;
import com.dc.menus.vo.MenusVo;
import com.dc.restaurants.dao.RestaurantsDao;
import com.dc.restaurants.vo.RestaurantsFileVo;
import com.dc.restaurants.vo.RestaurantsVo;
import com.dc.review.dao.ReviewDao;
import com.dc.util.FileUtils;

@Service
public class RestaurantsServiceImpl implements RestaurantsService {

	private final Logger log = LoggerFactory.getLogger(RestaurantsServiceImpl.class);

	@Autowired
	public RestaurantsDao restaurantsDao;
	
	@Autowired
	private MenusDao menusDao;
	
	@Autowired
	private ReviewDao reviewDao;
	
	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Override
	public List<RestaurantsFileVo> restaurantsSelectList(String keyword, int end) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("end", end);
		return restaurantsDao.restaurantsSelectList(map);
	}

	@Override
	public List<RestaurantsFileVo> restaurantsSelectListCategory(String category, int end) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("end", end);
		return restaurantsDao.restaurantsSelectListCategory(map);
	}

	@Override
	public List<RestaurantsFileVo> restaurantsSelectListOrder(String order, int end) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<>();
		map.put("order", order);
		map.put("end", end);
		return restaurantsDao.restaurantsSelectListOrder(map);
	}

	@Override
	public Map<String, Object> restaurantsSelectOne(int restaurantNo) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();

		RestaurantsVo restaurantsVo = restaurantsDao.restaurantsSelectOne(restaurantNo);
		resultMap.put("restaurantsVo", restaurantsVo);
		
		List<Map<String, Object>> fileList = restaurantsDao.fileSelectList(restaurantNo);
		resultMap.put("fileList", fileList);

		return resultMap;
	}

	@Transactional
	@Override
	public void restaurantsInsertOne(RestaurantsVo restaurantsVo
			, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		// TODO Auto-generated method stub
		restaurantsDao.restaurantsInsertOne(restaurantsVo);
		
		int parentSeq = restaurantsVo.getRestaurantNo();
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(parentSeq, multipartHttpServletRequest);

		log.debug("RestaurantsServiceImpl restaurantsInsertOne enter!! {}", list);
		
		for (int i = 0; i < list.size(); i++) {
			restaurantsDao.insertFile(list.get(i));
		}

	}

	@Transactional(rollbackFor=Exception.class)
	@Override
	public int restaurantsUpdate(RestaurantsVo restaurantsVo, List<MenusVo> menusVoList
			, MultipartHttpServletRequest multipartHttpServletRequest, int fileIdx) throws Exception {
		// TODO Auto-generated method stub
		
		int resultNum = 0;
		
		try {
			resultNum = restaurantsDao.restaurantsUpdate(restaurantsVo);
			menusDao.menusDelete(restaurantsVo.getRestaurantNo());
			for (MenusVo menusVo : menusVoList) {
				menusDao.menusUpdate(menusVo);
			}

			int parentSeq = restaurantsVo.getRestaurantNo();
			Map<String, Object> tempFileMap = restaurantsDao.fileSelectStoredFileName(parentSeq);

			List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(parentSeq, multipartHttpServletRequest);
			
			// 오로지 하나만 관리
			if (list.isEmpty() == false) {
				if(tempFileMap != null) {
					fileUtils.parseUpdateFileInfo(tempFileMap);
					restaurantsDao.fileDelete(parentSeq);
				}
				
				for (Map<String, Object> map : list) {
					restaurantsDao.insertFile(map);
				}

			}else if(fileIdx == -1) {
				if(tempFileMap != null) {
					restaurantsDao.fileDelete(parentSeq);
					fileUtils.parseUpdateFileInfo(tempFileMap);
				}
			}
			
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return resultNum;
	}
	
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int restaurantsDelete(int restaurantNo) throws Exception {
		// TODO Auto-generated method stub
		
		reviewDao.reviewDeleteWithRestaurant(restaurantNo);
		
		menusDao.menusDelete(restaurantNo);
		
		restaurantsDao.fileDelete(restaurantNo);
		
		return restaurantsDao.restaurantsDelete(restaurantNo);
	}

	@Override
	public int restaurantsTotalCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return restaurantsDao.restaurantsTotalCount(map);
	}

	@Override
	public int restaurantsTotalCountCategory(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return restaurantsDao.restaurantsTotalCountCategory(map);
	}

	@Override
	public int restaurantsTotalCountOrder(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return restaurantsDao.restaurantsTotalCountOrder(map);
	}

	@Override
	public void restaurantsDeleteMemberNo(int memberNo){
		// TODO Auto-generated method stub
		reviewDao.reviewDeleteWithMember(memberNo);
		menusDao.menusDeleteMemberNo(memberNo);
		restaurantsDao.restaurantDeleteMemberNo(memberNo);
	}

}
