package com.sdhh.controller;

import com.sdhh.po.Dict;
import com.sdhh.po.Project;
import com.sdhh.po.YearProjectTree;
import com.sdhh.po.Yytxxt;
import com.sdhh.service.DictService;
import com.sdhh.service.ProjectService;
import com.sdhh.service.ShebeiService;
import com.sdhh.util.FileLoad;
import com.sdhh.util.JsonUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/zl")
public class ZiliaoController {
    private static Logger logger = Logger.getLogger(ZiliaoController.class);

    @Autowired
    private DictService dictService;


    @Autowired
    private ProjectService projectService;

    @Autowired
    private ShebeiService shebeiService;
    /**
     *
     * @return 获取所有设备类型相关字段
     * @throws Exception
     */
    @RequestMapping(value="/getAllDict", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getDictAction() throws Exception{
        List<Dict> allDict = getAllDictType();
        Map<String,Object> map = new HashMap<>();
        map.put("code", "1");
        map.put("data", allDict);
        return map;
    }

    /**
     * 获取所有合同 被getDictTypes调用
     * @return 获取所有合同
     */
    private List<Dict> getAllDictType(){
        return dictService.getAllDict();
    }



    /**
     * 增加设备类型相关字段
     * @param ptyp
     * @param etyp
     * @param enm
     * @return 增加类别后的所有设备类型相关字段
     */
    @RequestMapping(value = "/addDict", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addDictAction(
            @RequestParam("ptyp") String ptyp,
            @RequestParam("etyp") String etyp,
            @RequestParam("enm") String enm){
        String id = RandomStringUtils.randomAlphanumeric(20);
        System.out.println("randomAlphanumeric====="+id);
        Map<String, Object> map = new HashMap<>();
        map.put("code", "0");
        logger.debug("<----addDict.action------>" + ptyp+","+etyp+","+enm);
        Dict ctr = new Dict(id, ptyp, etyp, enm);
        try {
            int flag1 = dictService.addDict(ctr);
            if(flag1 == 1)
                map.put("code", "1");
        }catch (Exception e){
            logger.debug("<---------->"+"addCtrTypAction Exception:"+e.toString());
        }
        List<Dict> ctrs = getAllDictType();
        map.put("data", ctrs);
        return map;
    }

    @RequestMapping(value = "/getYearProjectTree", method=RequestMethod.POST)
    @ResponseBody
    public  String getYearProjectTree(){
        /*先sql选出所有项目的年份,再选出所有项目按照年份组合成前端tree的数据结构返回*/
        List<Integer> projectYears = projectService.getProjectYear();
        List<YearProjectTree> yearProject = projectService.getYearProject(projectYears);
        System.out.println(JsonUtils.encodeObject(yearProject));
        return JsonUtils.encodeObject(yearProject);
    }


    /*录入项目 返回页面*/
    @RequestMapping(value="/addProjectJSP")
    public String goAddProjectJSP() throws Exception{
        return "ziliao/addProjectIndex";
    }


/*点击查看项目详情 返回主页面*//*
    @RequestMapping(value="/getProject" , method=RequestMethod.GET)
    public ModelAndView goProjectJSP(@RequestParam("id") String id) throws Exception{
        System.out.println("========项目详情页面.pid"+id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/zl/projectIndex.jsp");
        modelAndView.addObject("pid", id);
        return modelAndView;
    }*/


    /*录入项目*/
    @RequestMapping(value="/addProject", method=RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addProject(
            @RequestParam("pnm") String pnm,
            @RequestParam("ptyp") String ptyp,
            @RequestParam("pfwh") String pfwh,
            @RequestParam("tzje") BigDecimal tzje,
            @RequestParam("tzlb") String tzlb,
            @RequestParam("kgsj") String kgsj,
            @RequestParam("wgsj") String wgsj,
            @RequestParam("htwgyssj") String htwgyssj,
            @RequestParam("cbyssj") String cbyssj,
            @RequestParam("jgyssj") String jgyssj,
            @RequestParam("sbazdd") String sbazdd,
            @RequestParam("yxwhdw") String yxwhdw,
            @RequestParam("year") int year
    ){
        String id = RandomStringUtils.randomAlphanumeric(20);
        System.out.println("randomAlphanumeric=====" + id);
        Map<String, Object> map = new HashMap<>();
        map.put("code", "0");
        Project p = new Project(id,pnm,ptyp,pfwh,tzje,tzlb,kgsj,wgsj,htwgyssj,cbyssj,jgyssj,sbazdd,yxwhdw,year);
        try {
            int flag1 = projectService.addProject(p);
            if(flag1 == 1){
                 /*返回当前录入的项目基本信息*/
                map.put("code", "1");
                map.put("pid", id);
                map.put("pnm",pnm);
            }
        }catch (Exception e){
            logger.debug("<---------->"+"addProject Exception:"+e.toString());
        }

        return map;
    }


    @RequestMapping(value = "/getPtyp", method=RequestMethod.POST)
    @ResponseBody
    public String getPtyp(){
        List<String> ptypList = dictService.getPtyp();
     return JsonUtils.encodeObject(ptypList);
    }

    @RequestMapping(value = "/getPtypByProject", method=RequestMethod.POST)
    @ResponseBody
    public String getPtypByProject(){
        /*List<String> ptypList = projectDictService.getPtypByProject();
        return JsonUtils.encodeObject(ptypList);*/
        return "";
    }

    @RequestMapping(value="/delDict", method=RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> delC(String id ) throws Exception {
        Map<String, Object> map = new HashMap<>();
        List<Dict> list = new ArrayList<Dict>();
        int delDbCode = dictService.deleteDictById(id);
        if (0 == delDbCode) {
            map.put("code", "0");
            logger.debug("<---------->delDict-----未删除数据库记录.id:" + id);
        }else{
            map.put("code", "1");
            list = getAllDictType();
        }
        map.put("data", list);
        return map;
    }

    @RequestMapping(value="/zlDownload.action", method=RequestMethod.GET)
    public void downloadFileImgAction(HttpServletRequest request, HttpServletResponse response,@RequestParam(value="abspath") String abspath) throws Exception{
        /*abspath = "F:\\IDEAworkspace\\zlgl\\src\\main\\webapp\\zl\\"+abspath;*/
        /*abspath = "D:\\zlgl\\"+abspath;*/
        FileLoad.zlDownload(request, response, abspath);
    }


    @RequestMapping(value="/addYytxxt", method=RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addYytxxt(
            String ptyp,
            String etyp,
            String enm,
            String esbxh,
            String eazdd,
            String eipdz,
            String extpzzdrl,
            String extpzrl,
            int ezdfxs,
            int ecjhmzcws,
            int ejshmzcws,
            String ezjfx,
            String ezjrl,
            int eyhms,
            String etryxsj,
            String ebz
    ){
        String id = RandomStringUtils.randomAlphanumeric(50);
        System.out.println("randomAlphanumeric=====" + id);
        Map<String, Object> map = new HashMap<>();
        map.put("code", "0");
        Yytxxt p = new Yytxxt(id, ptyp, etyp, enm, esbxh, eazdd, eipdz, extpzzdrl, extpzrl, ezdfxs, ecjhmzcws, ejshmzcws, ezjfx, ezjrl, eyhms, etryxsj, ebz);
        try {
            int flag1 = shebeiService.addYytxxtShebei(p);
            if(flag1 == 1){
                map.put("code", "1");
                map.put("pid", id);
            }
        }catch (Exception e){
            logger.debug("<---------->"+"addProject Exception:"+e.toString());
        }
        return map;
    }
}
