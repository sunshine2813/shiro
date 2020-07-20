package com.sdhh.mapper;

import com.sdhh.po.Dict;
import com.sdhh.po.YearProjectTree;

import java.util.List;

/**
 * Created by Administrator on 2020/6/21.
 */
public interface DictMapper {
    int addDict(Dict record);
    List<Dict> getAllDict();
    int deleteDictByFour(String ptyp, String etyp, String enm);
    int deleteDictById(String id);
    List<String> getPtyp();
    List<YearProjectTree> getYearProject();

}
