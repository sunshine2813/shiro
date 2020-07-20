package com.sdhh.service;

import com.sdhh.po.Dict;
import com.sdhh.po.YearProjectTree;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface DictService {

    int addDict(Dict d1);

    List<Dict> getAllDict();

    int deleteDictById(String id);

    int deleteDictByFour(String ptyp ,String etyp ,String enm ,String emdl);

    List<String> getPtyp();








    /*=========================*/



    /*void setUrl(Long dbId, String imageurl, String attachurl);

    int deleteContractById(long id);

    String getImagenamesById(Long dbId);

    int addImagenamesById(String newImagenames, Long dbId);

    String getAttachnamesById(Long dbId);

    int addAttachnamesById(String newAttachnames, Long dbId);

    List<Contract> getAllContract();

    List<Contract> getTNContract(String type, String name);

    List<Contract> getYNContract(int year, String name);

    List<Contract> getTYContract(int year, String type);

    List<Contract> getYContract(int year);

    List<Contract> getNContract(String name);

    List<Contract> getTContract(String type);

    List<Contract> getTYNContract(String type, int year, String name);

    List<ContractType> getContractType();

    int delCrtTypById(Long id);

    int addContractType(ContractType ct1);*/

}
