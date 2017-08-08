package com.nartos.bid.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nartos.bid.mapper.TestMapper;
import com.nartos.bid.model.TestVO;
import com.nartos.bid.service.ITestService;

@Service(value = "testService")
public class TestService implements ITestService
{

	@Autowired
	private TestMapper testMapper;

	@Override
	public List<TestVO> selectAll()
	{
		List<TestVO> list = testMapper.selectAllBid();
		return list;
	}

}
