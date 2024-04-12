package com.nadeuli.common.search.service;
import com.nadeuli.common.search.bean.SearchDTO;

import java.util.List;
import java.util.Map;

public interface AutoService {

    List<Map<String, Object>> autoComplete(Map<String, Object> paramMap) throws Exception;

}
