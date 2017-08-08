package com.nartos.bid.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.nartos.bid.model.TestVO;

@Repository(value = "testMapper")
public interface TestMapper
{
	public List<TestVO> selectAllBid();
}
