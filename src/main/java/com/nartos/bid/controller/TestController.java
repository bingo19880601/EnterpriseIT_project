package com.nartos.bid.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nartos.bid.model.TestVO;
import com.nartos.bid.service.ITestService;

@Controller
@RequestMapping("test")
public class TestController
{
	@Autowired
	private ITestService testService;

	@ResponseBody
	@RequestMapping(value = "/getAll", method = RequestMethod.GET)
	public List<TestVO> getAll()
	{
		return testService.selectAll();
	}

	@GetMapping(value = "/bidIndex")
	public String bidIndex()
	{
		return "redirect:/bid";
	}
}
