package com.sdhh.service;

import com.sdhh.mapper.DictMapper;
import com.sdhh.po.Dict;
import com.sdhh.po.YearProjectTree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("DictService")
public class DictServiceImpl implements DictService {
    @Autowired
    private DictMapper dictMapper;

    @Override
    public int addDict(Dict record) {
        return dictMapper.addDict(record);
    }

    @Override
    public List<Dict> getAllDict() {
        return dictMapper.getAllDict();
    }

    @Override
    public int deleteDictById(String id){
        return dictMapper.deleteDictById(id);
    }

    @Override
    public int deleteDictByFour(String ptyp, String etyp, String enm, String emdl) {
        return dictMapper.deleteDictByFour(ptyp, etyp, enm);
    }

    @Override
    public List<String> getPtyp(){
        return dictMapper.getPtyp();
    }


}
