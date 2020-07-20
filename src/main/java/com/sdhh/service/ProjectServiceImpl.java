package com.sdhh.service;

import com.sdhh.mapper.ProjectMapper;
import com.sdhh.po.Project;
import com.sdhh.po.YearProjectTree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("ProjectService")
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectMapper projectMapper;

    private List<YearProjectTree> initTreeByYear(List<Integer> projectYears){
        List<YearProjectTree> tree = new ArrayList<>();
        for(int i=0;i<projectYears.size();i++){
            YearProjectTree t = new YearProjectTree();
            t.setText(Integer.toString(projectYears.get(i)));
            List<YearProjectTree> y = new ArrayList<>();
            t.setChildren(y);
            tree.add(t);
        }

        return tree;
    }

    private int findIndexOfYear(List<Integer> projectYears, int tarYear){
        for(int i=0;i<projectYears.size(); i++){
            if(tarYear == projectYears.get(i)){
                return i;
            }
        }
        return -1;
    }
    @Override
    public List<YearProjectTree> getYearProject(List<Integer> projectYears) {
        List<Project> list = projectMapper.getYearProject();
        /*初始化父结点是年份的树*/

        /*遍历将project的list对象 转化为 yearProjectTree对象list*/
        List<YearProjectTree> tree = initTreeByYear(projectYears);
        for(int i=0;i<list.size(); i++){
            Project p = list.get(i);
            YearProjectTree childrenNode = new YearProjectTree();
            childrenNode.setId(p.getId());
            childrenNode.setText(p.getPnm());
            String url = "getProject.action?id="+ p.getId();
            childrenNode.setUrl(url);
            /*根据结点的年份对应在projectYears的第几个位置，就把结点加到tree的第几个结点的children里*/
            int j = findIndexOfYear(projectYears, p.getYear());
            if(-1 != j){
                tree.get(j).getChildren().add(childrenNode);
            }
        }
        return  tree;
    }



    @Override
    public List<Integer> getProjectYear(){
        return projectMapper.getProjectYear();
    }

    @Override
    public int addProject(Project p){
        return projectMapper.addProject(p);
    }



}
